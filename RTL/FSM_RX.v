module FSM_RX (
    input  wire       CLK,
    input  wire       RST,
    input  wire       RX_IN,
    input  wire       PAR_EN,
    input  wire       bit_done,
    input  wire [3:0] bit_cnt,
    input  wire [5:0] edge_cnt,
    input  wire       par_error,
    input  wire       strt_glitch,
    input  wire       stp_error,
    output reg        data_samp_en,
    output reg        enable,
    output reg        par_chk_en,
    output reg        strt_chk_en,
    output reg        stp_chk_en,
    output reg        deser_en,
    output reg        data_valid
);


 localparam  [2:0]   IDLE   = 3'b000,
                     START  = 3'b001,
                     DATA   = 3'b010,
                     PARITY = 3'b011,
                     STOP   = 3'b100,
                     VALID  = 3'b101;


reg  [2:0] current_state, next_state;

// State register
always @(posedge CLK or negedge RST) begin
    if (!RST) 
    begin
         current_state <= IDLE;
    end
    else
    begin
        current_state  <= next_state;
    end

end

// Next State Logic
always @(*) begin
    case (current_state)
        IDLE:   next_state = (!RX_IN) ? START : IDLE;
        START:  next_state = bit_done ? ( strt_glitch ? IDLE : DATA) : START;
        DATA:   next_state = ((bit_cnt == 4'd9) && bit_done) ? (PAR_EN ? PARITY : STOP) : DATA;
        PARITY: next_state = bit_done ? STOP : PARITY;
        STOP:   next_state = bit_done ? VALID : STOP;
        VALID:  next_state = IDLE;
        default: next_state = IDLE;
    endcase
end

// Output logic
always @(*) begin
    // Default values
    enable       = 1'b0;
    data_samp_en = 1'b0;
    deser_en     = 1'b0;
    par_chk_en   = 1'b0;
    strt_chk_en  = 1'b0;
    stp_chk_en   = 1'b0;
    data_valid   = 1'b0;

    case (current_state)
        START: begin
            enable       = 1'b1;
            data_samp_en = 1'b1;
            strt_chk_en  = 1'b1;  
        end
        DATA: begin
            enable       = 1'b1;
            data_samp_en = 1'b1;
            deser_en     = bit_done;  
        end
        PARITY: begin
            enable       = 1'b1;
            data_samp_en = 1'b1;
            par_chk_en   = bit_done;  
        end
        STOP: begin
            enable       = 1'b1;
            data_samp_en = 1'b1;
            stp_chk_en   = bit_done;  
        end
        VALID: begin
            if (par_error || stp_error) begin
                data_valid = 1'b0;  // Invalid data due to errors
            end else begin
                data_valid = 1'b1;  // Valid data
            end
        end
    endcase
end


endmodule
