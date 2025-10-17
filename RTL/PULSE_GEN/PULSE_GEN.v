module PULSE_GEN(
    input wire clk,
    input wire rst_n,
    input wire ASYNC,
    output wire pulse_sig
);
    reg rcv_flop, pls_flop;

    // Multi flop synchronizer
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rcv_flop <= 1'b0;
            pls_flop <= 1'b0;
        end else begin
            rcv_flop <= ASYNC;
            pls_flop <= rcv_flop;
        end
    end

    assign pulse_sig = rcv_flop && !pls_flop;
endmodule
