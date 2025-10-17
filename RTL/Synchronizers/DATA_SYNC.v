module DATA_SYNC #(
    parameter BUS_WIDTH = 8,
    parameter NUM_STAGES = 2
) (
    input  wire                  CLK,
    input  wire                  RST,
    input  wire                  bus_enable,
    input  wire [BUS_WIDTH-1:0]  unsyn_bus,
    output reg  [BUS_WIDTH-1:0]  sync_bus,
    output reg                   enable_pulse
);
//internal signals

reg                  enable_prev;
wire                 enable_gen;
wire [BUS_WIDTH-1:0] sync_bus_mux;
reg [NUM_STAGES-1:0] sync_reg;


// Synchronize the enable signal
always @(posedge CLK or negedge RST) begin
    if(!RST) begin
        sync_reg <= 0;
    end
    else 
    begin
        sync_reg <= {sync_reg[NUM_STAGES-2:0], bus_enable};
    end
end


//pulse generator
always @(posedge CLK or negedge RST) begin
    if(!RST) begin
        enable_prev <= 0;
    end
    else begin
        enable_prev <= sync_reg[NUM_STAGES-1];
    end
end

assign enable_gen = sync_reg[NUM_STAGES-1] && !enable_prev;

//mux
assign sync_bus_mux = enable_gen ? unsyn_bus : sync_bus;
 always @(posedge CLK or negedge RST) begin
        if(!RST) begin
            sync_bus <= 0;
        end
        else begin
            sync_bus <= sync_bus_mux;
        end
end

//output enable pulse
always @(posedge CLK or negedge RST) begin
    if(!RST) begin
        enable_pulse <= 0;
    end
    else begin
        enable_pulse <= enable_gen;
    end
end

endmodule
