module FSM_TX (
   input  wire        Data_Valid,
   input  wire        PAR_EN,
   input  wire        ser_done,
   input  wire        CLK,
   input  wire        RST,
   output reg   [1:0] mux_sel,
   output reg         ser_en,
   output reg         busy
);
reg  [2:0] current_state;
reg  [2:0] next_state;
localparam  [2:0]   IDLE   = 3'b000,
                    START  = 3'b001,
                    DATA   = 3'b010,
                    PARITY = 3'b011,
                    STOP   = 3'b100;

// Next state logic
always @(*) begin
    case (current_state)
        IDLE   : next_state = (Data_Valid)?START:IDLE;
        START  : next_state = DATA;
        DATA   : next_state = (ser_done) ? ((PAR_EN) ? PARITY : STOP) : DATA;
        PARITY : next_state = STOP;
        STOP   : next_state = IDLE;
        default: next_state = IDLE;
    endcase
end
// State register
always @(posedge CLK or negedge RST) begin
    if (!RST) begin
        current_state <= IDLE;
    end
    else begin
        current_state <= next_state;
    end   
end


// Output logic
    always @(*) begin
            // Default values
            busy <= 1'b0;
            ser_en <= 1'b0;
            mux_sel <= 2'b01; 
            case (current_state)
              IDLE : begin
                mux_sel <= 2'b01;
                busy <= 1'b0;
                ser_en <=1'b0;
              end
              START : begin
                mux_sel <= 2'b00;
                busy <= 1'b1;
                ser_en <=1'b0;
              end
              DATA : begin
                mux_sel <= 2'b10;
                busy <= 1'b1;
                ser_en <=1'b1;
              end
              PARITY : begin
                mux_sel <= 2'b11;
                busy <= 1'b1;
                ser_en <=1'b0;
              end
              STOP : begin
                mux_sel <= 2'b01;
                busy <= 1'b1;
                ser_en <=1'b0;
              end
            default: begin
                mux_sel <= 2'b01;
                busy <= 1'b0;
                ser_en <=1'b0;
            end
        endcase
        end
    
endmodule
