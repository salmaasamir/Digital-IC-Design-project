module RegFile #(parameter WIDTH = 8, DEPTH = 8, ADDR = 4 )
( 
    input   wire                clk,
    input   wire                rst, 
    input   wire [ADDR-1:0]     Address,
    input   wire [WIDTH-1:0]    WrData ,
    input   wire                WrEn,
    input   wire                RdEn,
    output  reg  [WIDTH-1:0]    RdData,
    output  reg                 RdData_valid,
    output  reg  [WIDTH-1:0]    REG0,
    output  reg  [WIDTH-1:0]    REG1,
    output  reg  [WIDTH-1:0]    REG2,
    output  reg  [WIDTH-1:0]    REG3
);

    // 8 registers, each 8 bits wide
    reg [WIDTH-1:0] regArr [DEPTH-1:0] ;
    integer i;
    
    always @(posedge clk or negedge rst) 
      begin
         if (!rst)
          begin
          RdData <= 0;
          RdData_valid <= 0;
           // Asynchronous active-low reset
           for ( i = 0; i < 8; i = i + 1) 
              begin
                if(i==2)
                 regArr[i] <='b10000001; // Initialize register 2 
                else if(i==3)
                 regArr[i] <='b00100000; // Initialize register 3
                else
                 regArr[i] <= 'b0; // Initialize other registers to 0
              end 
           end 
         else  if (WrEn && !RdEn) 
              begin
               // Write operation
               regArr[Address] <= WrData;  
                RdData_valid <= 0;
              end 
            else if (RdEn && !WrEn) 
              begin
               // Read operation
               RdData <= regArr[Address];
                RdData_valid <= 1;
              end 
         end

         assign REG0 = regArr[0];
         assign REG1 = regArr[1];
         assign REG2 = regArr[2];
         assign REG3 = regArr[3];

               endmodule
