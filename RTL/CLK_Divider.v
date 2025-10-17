module CLK_divider #( 
 parameter RATIO_WD = 8 
)(
    input  wire       ref_clk,
    input  wire       clk_en,
    input  wire       rst,
    input  wire [RATIO_WD-1:0] div_ratio,
    output reg        div_clk
);
    // Internal signals
    reg [RATIO_WD-1:0] counter;
    reg [RATIO_WD-1:0] half_period_1, half_period_2;
    reg odd;
    reg flag ;
    wire ClK_DIV_EN ;
    reg div_clk_internal;

    // Clock enable logic
    assign ClK_DIV_EN = (clk_en && (div_ratio != 'd0) && (div_ratio != 'd1));

    //  period calculations
     always @(*) begin
        half_period_1 = (div_ratio >> 1) - 1;           // div_ratio/2
        half_period_2 = half_period_1 + div_ratio[0]; // div_ratio/2 for odd 
        odd = div_ratio[0];  // Check if div_ratio is odd
    end

    // Clock divider logic
    always @(posedge ref_clk or negedge rst) 
    begin
        if(!rst) begin
            counter <= 'b0;
            flag <= 1'b0;
            div_clk_internal <= 1'b1;
        end 
        else if(ClK_DIV_EN) begin
        if(!odd && counter == half_period_1) begin
            div_clk_internal <= ! div_clk_internal;
            counter <= 'b0;
        end
        else if (odd &&( (counter == half_period_1 && !flag) || (counter == half_period_2 && flag))) begin
           div_clk_internal <= ! div_clk_internal;
            counter <= 'b0;
            flag <= !flag;
        end
        else begin
            counter <= counter + 1;
        end
    end
    else begin
        counter <= 8'b0;
        flag <= 0;
    end
    end
    // Output logic
    always @(*) begin
        div_clk = (rst && ClK_DIV_EN) ? div_clk_internal : ref_clk;
    end

endmodule
