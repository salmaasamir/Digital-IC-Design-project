module CLK_GATE (
    input  wire  CLK,
    input  wire  GATE_EN,
    output wire  GATED_CLK
);

reg latch;

always @(CLK or GATE_EN) begin
    if (!CLK) begin
        latch <= GATE_EN;        
    end
    
end

assign GATED_CLK = latch && CLK ;
    
endmodule