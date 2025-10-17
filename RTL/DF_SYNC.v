module DF_SYNC #(
    parameter ADDR_WIDTH = 3
) (
    input  wire       W_CLK,
    input  wire       W_RST,
    input  wire       R_CLK,
    input  wire       R_RST,
    input  wire [ADDR_WIDTH:0] w_ptr,
    input  wire [ADDR_WIDTH:0] r_ptr,
    output reg  [ADDR_WIDTH:0] wq2_rptr,
    output reg  [ADDR_WIDTH:0] rq2_wptr
);

reg [1:0] wq_ptr [ADDR_WIDTH:0];
reg [1:0] rq_ptr [ADDR_WIDTH:0];
integer  I ;

always @(posedge W_CLK or negedge W_RST) begin
    if (!W_RST) begin
        for(I=0 ; I<ADDR_WIDTH+1; I=I+1)
            wq_ptr[I] <= 0;
       
    end else begin
        for(I=0 ; I<ADDR_WIDTH+1; I=I+1)
            wq_ptr[I] <= {wq_ptr[I][0], r_ptr[I]};
    end
end

always @(posedge R_CLK or negedge R_RST) begin
    if (!R_RST) begin
        for(I=0 ; I<ADDR_WIDTH+1; I=I+1) begin
            rq_ptr[I] <= 0;
        end
    end else begin
        for(I=0 ; I<ADDR_WIDTH+1; I=I+1) begin
            rq_ptr[I] <= {rq_ptr[I][0], w_ptr[I]};
        end
    end
end

always @(*) begin
    for(I=0 ; I<ADDR_WIDTH+1; I=I+1) begin
        wq2_rptr[I] = wq_ptr[I][1];
    end
    for(I=0 ; I<ADDR_WIDTH+1; I=I+1) begin
        rq2_wptr[I] = rq_ptr[I][1];
    end
end

endmodule
