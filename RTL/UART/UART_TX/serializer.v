module Serializer # ( parameter DATA_WIDTH = 8 )
(
    input   wire    [DATA_WIDTH-1:0]  P_DATA, 
    input   wire                      Data_Valid,
    input   wire                      CLK,
    input   wire                      RST,
    input   wire                      Enable, 
    input   wire                      busy,
    output  wire                       ser_done,
    output  wire                       ser_data 
);

reg  [2:0] counter;
reg  [DATA_WIDTH-1:0] DATA_V;

always @ (posedge CLK or negedge RST) begin
    if(!RST) begin
        DATA_V <= 0;
    end
    else if(Data_Valid && !busy)
     begin
          DATA_V <= P_DATA ; 
     end
     else if(Enable)
     begin
           DATA_V <= DATA_V >> 1 ;         // shift register
     end           
    end
//counter
always @ (posedge CLK or negedge RST)
 begin
  if(!RST)
   begin
    counter <= 'b0 ;
   end
  else
   begin
    if (Enable)
	 begin
      counter <= counter + 'b1 ;		 
	 end
	else 
	 begin
      counter <= 'b0 ;		 
	 end	
   end
 end 
 
 assign ser_done = (counter == 'b111) ? 1'b1 : 1'b0 ;

assign ser_data = DATA_V[0] ;       

endmodule

