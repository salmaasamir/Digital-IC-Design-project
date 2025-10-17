`timescale 1ns / 1ps
module SYSTEM_TOP_TB ();

    parameter DATA_WIDTH = 8;
    parameter RF_ADDR = 4;

    // Clock periods
    localparam REF_PERIOD = 20;     // 50MHz
    localparam UART_PERIOD = 271;   // 3.6864MHz
    localparam BIT_PERIOD = UART_PERIOD * 32; //  prescale=32

    // Testbench signals
    reg  RST_N_tb;
    reg  UART_CLK_tb;
    reg  REF_CLK_tb;
    reg  UART_RX_IN_tb;
    wire UART_TX_O_tb;
    wire parity_error_tb;
    wire framing_error_tb;

    // DUT instance
    SYSTEM_TOP #(
        .DATA_WIDTH(DATA_WIDTH),
        .RF_ADDR(RF_ADDR)
    ) DUT (
        .RST_N(RST_N_tb),
        .UART_CLK(UART_CLK_tb),
        .REF_CLK(REF_CLK_tb),
        .UART_RX_IN(UART_RX_IN_tb),
        .UART_TX_O(UART_TX_O_tb),
        .parity_error(parity_error_tb),
        .framing_error(framing_error_tb)
    );

    // Clock generation
    always #(UART_PERIOD/2) UART_CLK_tb = ~UART_CLK_tb;
    always #(REF_PERIOD/2) REF_CLK_tb = ~REF_CLK_tb;

    // Simple UART send task 
    task send_uart_byte;
        input [7:0] data;
        integer k;
        begin
            $display("Time %0t: Sending 0x%02X", $time, data);

            // Start bit
            UART_RX_IN_tb = 1'b0;
            #BIT_PERIOD; 
            
            // Data bits (LSB first)
            for (k = 0; k < 8; k = k + 1) begin
                UART_RX_IN_tb = data[k];
                #BIT_PERIOD;
            end

            // Parity bit (even parity)
            UART_RX_IN_tb = ^data; // even parity
            #BIT_PERIOD;
            
            // Stop bit
            UART_RX_IN_tb = 1'b1;
            #BIT_PERIOD;
        end
    endtask

    // Main test sequence
    initial begin
        $dumpfile("SYSTEM_TOP_TB.vcd");
        $dumpvars(0, SYSTEM_TOP_TB);
        
        // Initialize all signals
        RST_N_tb = 1'b0;
        UART_CLK_tb = 1'b0;
        REF_CLK_tb = 1'b0;
        UART_RX_IN_tb = 1'b1; // UART idle = high
        
        $display("=== SYSTEM TEST START ===");
        
        // Hold reset for sufficient time
         #1000;
        RST_N_tb = 1'b1;
        $display("Time %0t: Reset released", $time);
        
        // Wait for system to stabilize
        #10000;
        
        // Test 1: Simple RF Write (Configure REG2 first)
        $display("\n=== TEST 1: Configure UART (REG2) ===");
        send_uart_byte(8'hAA);  // RF Write Command
        send_uart_byte(8'h02);  // Address 2
        send_uart_byte(8'h81);  // Data: Prescale=32, Par_En=1, Par_Type=0
        
        // Wait and check
        #200000;
        
        // Test 2: Configure Clock Divider (REG3)
        $display("\n=== TEST 2: Configure Clock Divider (REG3) ===");
        send_uart_byte(8'hAA);  // RF Write Command  
        send_uart_byte(8'h03);  // Address 3
        send_uart_byte(8'h20);  // Data: Division ratio = 32
        
        // Wait and check
        #200000;
        
        // Test 3: Simple RF Write to normal register
        $display("\n=== TEST 3: Write to normal register ===");
        send_uart_byte(8'hAA);  // RF Write Command
        send_uart_byte(8'h04);  // Address 4
        send_uart_byte(8'h55);  // Data: 0x55
        
        // Wait and check
        #200000;

        // Test 4: RF Read
        $display("\n=== TEST 4: Read from register ===");
        send_uart_byte(8'hBB);  // RF Read Command
        send_uart_byte(8'h04);  // Address 4
        
        // Wait for response
        #200000;

        // Test 5: ALU Operation (ADD)
        $display("\n=== TEST 5: ALU Operation (ADD) ===");
        send_uart_byte(8'hCC);  // RF Write Command
        send_uart_byte(8'h05);  // A=5
        send_uart_byte(8'h03);  // B=3
        send_uart_byte(8'h00);  // ALU Operation Command (ADD)
        #200000;
        // Test 6: ALU Operation (MULTIPLY)
        $display("\n=== TEST 6: ALU Operation (MULTIPLY) ===");
        send_uart_byte(8'hCC);  // RF Write Command
        send_uart_byte(8'h37);  
        send_uart_byte(8'h0F);  
        send_uart_byte(8'h02);  // ALU Operation Command (MULTIPLY)
       #300000;

        // Test 7: ALU Operation (SUBTRACT)
        $display("\n=== TEST 7: ALU Operation (SUBTRACT) ===");
        send_uart_byte(8'hDD);  // RF Write Command
        send_uart_byte(8'h01);  // ALU Operation Command (SUBTRACT)
        #200000;
        
        // Finish simulation
        $display("\n=== TEST COMPLETE ===");
        #200000;
        $finish;
    end

   
    //////////////////////// Debug monitors ////////////////////////

    
    always @(posedge DUT.async_fifo_inst.w_inc) begin
        $display("Time %0t: FIFO Write - Data: 0x%02X", 
                 $time, DUT.async_fifo_inst.WR_DATA);
    end
    

    // Monitor ALU results
    always @(posedge DUT.alu_inst.OUT_VALID) begin
        $display("Time %0t: ALU Result Valid - Result: 0x%04X", 
                 $time, DUT.alu_inst.ALU_OUT);
    end
    

    // Monitor RegFile operations
    always @(posedge DUT.regfile_inst.WrEn) begin
        $display("Time %0t: RegFile WRITE - Addr:0x%02X Data:0x%02X", 
                 $time, DUT.regfile_inst.Address, DUT.regfile_inst.WrData);
    end
    
    always @(posedge DUT.regfile_inst.RdEn) begin
        $display("Time %0t: RegFile READ - Addr:0x%02X", 
                 $time, DUT.regfile_inst.Address);
    end
    
    // Monitor UART RX output
    always @(posedge DUT.RX_Valid) begin
        $display("Time %0t: UART RX received: 0x%02X", 
                 $time, DUT.RX_OUT);
    end
    
    // Monitor UART TX parallel data
always @(posedge DUT.sys_ctrl_inst.TX_D_VLD) begin
    $display("Time %0t: UART TX Output - Data: 0x%02X", 
             $time, DUT.sys_ctrl_inst.TX_P_DATA);
end



     /*
    // Check for any TX activity
    initial begin
        forever begin
            @(negedge UART_TX_O_tb);
            $display("Time %0t: UART TX activity detected", $time);
        end
    end

    always @(*) begin
        if (DUT.sys_ctrl_inst.RX_D_VLD) begin
            $display("Time %0t: SYS_CTRL received data: 0x%02X", 
                     $time, DUT.sys_ctrl_inst.RX_P_DATA);
        end
    end

    always @(DUT.sys_ctrl_inst.current_state) begin
        if (DUT.sys_ctrl_inst.current_state >= 12) begin // SEND_RESULT states
            $display("Time %0t: SYS_CTRL in SEND state: %0d", 
                     $time, DUT.sys_ctrl_inst.current_state);
        end
    end
    
    always @(DUT.sys_ctrl_inst.current_state) begin
        if (DUT.sys_ctrl_inst.current_state != 0) begin
            $display("Time %0t: SYS_CTRL state changed to: %0d", 
                     $time, DUT.sys_ctrl_inst.current_state);
        end
    end
    
    */

endmodule