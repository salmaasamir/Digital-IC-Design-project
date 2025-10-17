module ParityCalc # ( parameter WIDTH = 8 )
(
    input   wire    [WIDTH-1:0]  P_DATA,
    input   wire                 CLK,
    input   wire                 RST,
    input   wire                 busy,
    input   wire                 Data_Valid,
    input   wire                 PAR_EN,
    input   wire                 PAR_TYP,
    output  reg                  par_bit
);

reg [WIDTH-1:0] DATA;


always @(posedge CLK or negedge RST) begin
    if (!RST) begin
     DATA <='b0; 
    end
    else if (Data_Valid && !busy) begin
       DATA <= P_DATA;       
    end
end


always @(posedge CLK or negedge RST) begin
   if(!RST)
    par_bit <= 0;
    else 
      begin
       if(PAR_EN)
         begin
           if(!PAR_TYP)
             par_bit <= ^DATA;
            else
             par_bit <= ~^DATA; 
           end
         end
      end

   
endmodule
