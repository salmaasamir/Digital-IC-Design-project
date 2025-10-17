module SYS_CTRL #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4,
    parameter ALU_OUT_WIDTH = DATA_WIDTH * 2
)(
    input  wire CLK,
    input  wire RST,

    // ALU Interface
    input  wire [ALU_OUT_WIDTH-1:0] ALU_OUT,
    input  wire ALU_OUT_Valid,
    output reg  [3:0] ALU_FUN,
    output reg  ALU_Enable,
    output reg  CLK_EN,

    // Register File Interface
    input  wire [DATA_WIDTH-1:0] Rd_DATA,
    input  wire Rd_DATA_Valid,
    output reg  [DATA_WIDTH-1:0] WR_DATA,
    output reg  WR_EN,
    output reg  RD_EN,
    output reg  [ADDR_WIDTH-1:0] addr,

    // UART RX Interface
    input  wire [DATA_WIDTH-1:0] RX_P_DATA,
    input  wire RX_D_VLD,

    // ASYNC FIFO Interface (TX)
    output reg  [DATA_WIDTH-1:0] TX_P_DATA,
    output reg  TX_D_VLD,
    input  wire FIFO_FULL,

    // Clock Divider Control
    output wire clk_div_en
);

//=============================================================================
// State Encoding
//=============================================================================
localparam [3:0]
    IDLE               = 4'b0000,
    RF_WR_ADDR         = 4'b0001,
    RF_WR_DATA         = 4'b0011,
    RF_RD_ADDR         = 4'b0010,
    ALU_OPER_A         = 4'b0110,
    ALU_OPER_B         = 4'b0111,
    ALU_OP_FUN         = 4'b0101,
    ALU_NOP_FUN        = 4'b0100,
    ALU_LOAD_OPER_A    = 4'b1100,
    ALU_LOAD_OPER_B    = 4'b1101,
    WAIT_ALU_RESULT    = 4'b1111,
    CAPTURE_ALU_RESULT = 4'b1000,
    WAIT_RD_VALID      = 4'b1110,
    SEND_RESULT_1      = 4'b1010,
    SEND_RESULT_2      = 4'b1011;

localparam [3:0] ALU_NO_OP = 4'b1111;

//=============================================================================
// Command Definitions
//=============================================================================
localparam [7:0]
    RF_WR_CMD     = 8'hAA,
    RF_RD_CMD     = 8'hBB,
    ALU_W_OP_CMD  = 8'hCC,
    ALU_W_NOP_CMD = 8'hDD;

//=============================================================================
// Internal Signals
//=============================================================================
reg [3:0] current_state, next_state;
reg [DATA_WIDTH-1:0] oper_A_reg, oper_B_reg;
reg [3:0] alu_function_reg;
reg [ALU_OUT_WIDTH-1:0] alu_result_reg;
reg [ADDR_WIDTH-1:0] rf_addr_reg;
reg is_alu_op;

assign clk_div_en = 1'b1;

//=============================================================================
// State Register
//=============================================================================
always @(posedge CLK or negedge RST) begin
    if (!RST)
        current_state <= IDLE;
    else
        current_state <= next_state;
end

//=============================================================================
// Next State Logic
//=============================================================================
always @(*) begin
    next_state = current_state;
    case (current_state)
        IDLE: begin
            if (RX_D_VLD) begin
                case (RX_P_DATA)
                    RF_WR_CMD     : next_state = RF_WR_ADDR;
                    RF_RD_CMD     : next_state = RF_RD_ADDR;
                    ALU_W_OP_CMD  : next_state = ALU_OPER_A;
                    ALU_W_NOP_CMD : next_state = ALU_NOP_FUN;
                    default       : next_state = IDLE;
                endcase
            end
        end
        RF_WR_ADDR      : if (RX_D_VLD) next_state = RF_WR_DATA;
        RF_WR_DATA      : if (RX_D_VLD) next_state = IDLE;
        RF_RD_ADDR      : if (RX_D_VLD) next_state = WAIT_RD_VALID;
        WAIT_RD_VALID   : if (Rd_DATA_Valid) next_state = SEND_RESULT_1;
        ALU_OPER_A      : if (RX_D_VLD) next_state = ALU_OPER_B;
        ALU_OPER_B      : if (RX_D_VLD) next_state = ALU_OP_FUN;
        ALU_OP_FUN      : if (RX_D_VLD) next_state = ALU_LOAD_OPER_A;
        ALU_NOP_FUN     : if (RX_D_VLD) next_state = WAIT_ALU_RESULT;
        ALU_LOAD_OPER_A : next_state = ALU_LOAD_OPER_B;
        ALU_LOAD_OPER_B : next_state = WAIT_ALU_RESULT;
        WAIT_ALU_RESULT : if (ALU_OUT_Valid) next_state = CAPTURE_ALU_RESULT;
        CAPTURE_ALU_RESULT: next_state = is_alu_op ? SEND_RESULT_1 : IDLE;
        SEND_RESULT_1   : if (!FIFO_FULL) next_state = is_alu_op ? SEND_RESULT_2 : IDLE;
        SEND_RESULT_2   : if (!FIFO_FULL) next_state = IDLE;
        default         : next_state = IDLE;
    endcase
end

//=============================================================================
// Sequential Logic
//=============================================================================
always @(posedge CLK or negedge RST) begin
    if (!RST) begin
        oper_A_reg       <= 0;
        oper_B_reg       <= 0;
        alu_function_reg <= ALU_NO_OP;
        rf_addr_reg      <= 0;
        alu_result_reg   <= 0;
        is_alu_op        <= 0;
    end else begin
        case (current_state)
            IDLE: begin
                if (RX_D_VLD) begin
                    case (RX_P_DATA)
                        ALU_W_OP_CMD, ALU_W_NOP_CMD: is_alu_op <= 1'b1;
                        RF_WR_CMD, RF_RD_CMD       : is_alu_op <= 1'b0;
                    endcase
                end
            end
            RF_WR_ADDR     : if (RX_D_VLD) rf_addr_reg <= RX_P_DATA[ADDR_WIDTH-1:0];
            ALU_OPER_A     : if (RX_D_VLD) oper_A_reg <= RX_P_DATA;
            ALU_OPER_B     : if (RX_D_VLD) oper_B_reg <= RX_P_DATA;
            ALU_OP_FUN,
            ALU_NOP_FUN    : if (RX_D_VLD) alu_function_reg <= RX_P_DATA[3:0];
            CAPTURE_ALU_RESULT: alu_result_reg <= ALU_OUT;
        endcase

        if (ALU_OUT_Valid)
            alu_result_reg <= ALU_OUT;
    end
end

//=============================================================================
// Output Logic
//=============================================================================
always @(*) begin
    ALU_Enable = 1'b0;
    ALU_FUN    = ALU_NO_OP;
    CLK_EN     = 1'b0;
    WR_EN      = 1'b0;
    RD_EN      = 1'b0;
    addr       = 0;
    WR_DATA    = 0;
    TX_P_DATA  = 0;
    TX_D_VLD   = 1'b0;

    case (current_state)
        RF_WR_DATA: begin
            if (RX_D_VLD) begin
                WR_EN   = 1'b1;
                WR_DATA = RX_P_DATA;
                addr    = rf_addr_reg;
            end
        end
        RF_RD_ADDR: begin
            if (RX_D_VLD) begin
                RD_EN = 1'b1;
                addr  = RX_P_DATA[ADDR_WIDTH-1:0];
            end
        end
        ALU_LOAD_OPER_A: begin
            WR_EN   = 1'b1;
            WR_DATA = oper_A_reg;
            addr    = 0;
            CLK_EN  = 1'b1;
        end
        ALU_LOAD_OPER_B: begin
            WR_EN   = 1'b1;
            WR_DATA = oper_B_reg;
            addr    = 1;
            CLK_EN  = 1'b1;
        end
        WAIT_ALU_RESULT,
        CAPTURE_ALU_RESULT: begin
            ALU_Enable = 1'b1;
            CLK_EN     = 1'b1;
            ALU_FUN    = RX_P_DATA[3:0];
        end
        ALU_NOP_FUN: begin
            ALU_Enable = 1'b1;
            ALU_FUN    = alu_function_reg;
        end
        SEND_RESULT_1: begin
            if (!FIFO_FULL && (is_alu_op || Rd_DATA_Valid)) begin
                TX_D_VLD  = 1'b1;
                TX_P_DATA = is_alu_op ? alu_result_reg[DATA_WIDTH-1:0] : Rd_DATA;
            end
        end
        SEND_RESULT_2: begin
            if (!FIFO_FULL && is_alu_op) begin
                TX_D_VLD  = 1'b1;
                TX_P_DATA = alu_result_reg[ALU_OUT_WIDTH-1:DATA_WIDTH];
            end
        end
    endcase
end

endmodule
