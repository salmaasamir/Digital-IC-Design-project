module MUX (
input   wire     [1:0]  mux_sel,
input   wire            ser_data,
input   wire            par_bit,
output  reg             TX_OUT
 );

localparam  [1:0]   start_bit   = 2'b00,
                    stop_bit    = 2'b01, 
                    serial_data = 2'b10,
                    parity_bit  = 2'b11;

always @(*) begin

      case(mux_sel) 
      start_bit   : TX_OUT = 1'b0;
      stop_bit    : TX_OUT = 1'b1;
      serial_data : TX_OUT = ser_data;
      parity_bit  : TX_OUT = par_bit;
      default     : TX_OUT= 1'b1;   // high at no transmission

      endcase

    end

endmodule