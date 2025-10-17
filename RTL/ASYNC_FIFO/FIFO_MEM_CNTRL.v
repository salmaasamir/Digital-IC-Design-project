module FIFO_MEM #(
    parameter DATA_WIDTH =8,
    parameter ADDR_WIDTH =3,
    parameter FIFO_DEPTH = 8
) (
    input  wire                  W_CLK,
    input  wire                  W_RST,
    input  wire [ADDR_WIDTH-1:0] w_adder,
    input  wire [ADDR_WIDTH-1:0] r_adder,
    input  wire                  w_full,
    input  wire                  w_inc,
    input  wire [DATA_WIDTH-1:0] WR_DATA,
    output wire [DATA_WIDTH-1:0] RD_DATA   
);
reg [DATA_WIDTH-1:0] mem [FIFO_DEPTH-1:0];
integer i;

assign RD_DATA = mem[r_adder];

always @(posedge W_CLK or negedge W_RST) begin
    if (!W_RST) begin
        for (i = 0; i < FIFO_DEPTH; i = i + 1) begin
            mem[i] <= 0;
        end
    end else if (w_inc && !w_full) begin
        mem[w_adder] <= WR_DATA;
    end  
end

endmodule