module SYSTEM_TOP #(
    parameter DATA_WIDTH = 8,
    parameter RF_ADDR = 4
)(
    input RST_N,
    input UART_CLK,
    input REF_CLK,
    input UART_RX_IN,
    output UART_TX_O,
    output parity_error,
    output framing_error
);

//////// Internal Signals /////////
// ALU Signals
wire [DATA_WIDTH*2-1:0] ALU_OUT;
wire ALU_OUT_Valid;
wire ALU_Gated_CLK;

// RF Signals
wire [DATA_WIDTH-1:0] Rd_DATA;
wire Rd_DATA_Valid;
wire [DATA_WIDTH-1:0] OP_A;
wire [DATA_WIDTH-1:0] OP_B;

// UART Signals
wire [DATA_WIDTH-1:0] RX_OUT;
wire [DATA_WIDTH-1:0] Rx_SYNC_OUT;
wire RX_Valid;
wire RX_Valid_SYNC;
wire RX_IN;
wire TX_Valid_SYNC;
wire [DATA_WIDTH-1:0] TX_DATA_SYNC;
wire busy;
wire [DATA_WIDTH-1:0] UART_Config;
wire [DATA_WIDTH-1:0] DIV_RATIO_RX;

// SYS_CTRL Signals
wire [3:0] ALU_FUN;
wire ALU_Enable;
wire CLK_EN;
wire [DATA_WIDTH-1:0] WR_DATA;
wire WR_EN;
wire RD_EN;
wire [RF_ADDR-1:0] addr;
wire [DATA_WIDTH-1:0] TX_DATA_IN;
wire TX_D_VLD;

// FIFO Signals
wire FIFO_FULL;
wire FIFO_Empty;
wire Busy_PULSE;
wire [DATA_WIDTH-1:0] FIFO_DOUT;

// CLK Divider Signals
wire clk_div_en;
wire [7:0] DIV_Ratio;
wire TX_CLK;
wire RX_CLK;

// Reset Signals
wire SYNC_UART_RST;
wire SYNC_REF_RST;

///********************************************************///
/// Reset synchronizers
///********************************************************///
RST_SYNC #(
    .NUM_STAGES(2)
) rst_sync_inst (
    .CLK(REF_CLK),
    .RST(RST_N),
    .SYNC_RST(SYNC_REF_RST)
);

RST_SYNC #(
    .NUM_STAGES(2)
) rst_sync2_inst (
    .CLK(UART_CLK),
    .RST(RST_N),
    .SYNC_RST(SYNC_UART_RST)
);

///********************************************************///
/// Data Synchronizer
///********************************************************///
DATA_SYNC #(
    .BUS_WIDTH(DATA_WIDTH),
    .NUM_STAGES(2)
) data_sync_inst (
    .CLK(REF_CLK),
    .RST(SYNC_REF_RST),
    .bus_enable(RX_Valid),
    .unsyn_bus(RX_OUT),
    .sync_bus(Rx_SYNC_OUT),
    .enable_pulse(RX_Valid_SYNC)
);

///********************************************************///
/// Async FIFO
///********************************************************///
ASYNC_FIFO #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(3),
    .FIFO_DEPTH(8)
) async_fifo_inst (
    .W_CLK(REF_CLK),
    .R_CLK(TX_CLK),
    .W_RST(SYNC_REF_RST),
    .R_RST(SYNC_UART_RST),
    .w_inc(TX_D_VLD),
    .r_inc(Busy_PULSE),
    .WR_DATA(TX_DATA_IN),
    .RD_DATA(TX_DATA_SYNC),
    .w_full(FIFO_FULL),
    .r_empty(TX_Valid_SYNC)
);

///********************************************************///
/// Pulse Generator
///********************************************************///
PULSE_GEN pulse_gen_inst (
    .clk(TX_CLK),
    .rst_n(SYNC_UART_RST),
    .ASYNC(busy),
    .pulse_sig(Busy_PULSE)
);

///********************************************************///
/// Clock Divider for UART_TX Clock
///********************************************************///
CLK_divider clk_div_inst (
    .ref_clk(UART_CLK),
    .clk_en(clk_div_en),
    .rst(SYNC_UART_RST),
    .div_ratio(DIV_Ratio),
    .div_clk(TX_CLK)
);

///********************************************************///
/// Mux Clock
///********************************************************///
CLKDIV_MUX mux_clk_div_inst (
    .IN(UART_Config[7:2]),
    .OUT(DIV_RATIO_RX)
);

///********************************************************///
/// Clock Divider for UART_RX Clock
///********************************************************///
CLK_divider clk_div2_inst (
    .ref_clk(UART_CLK),
    .clk_en(clk_div_en),
    .rst(SYNC_UART_RST),
    .div_ratio(DIV_RATIO_RX),
    .div_clk(RX_CLK)
);

///********************************************************///
/// UART
///********************************************************///
UART #(
    .DATA_WIDTH(DATA_WIDTH)
) uart_inst (
    .RX_CLK(RX_CLK),
    .TX_CLK(TX_CLK),
    .RST(SYNC_UART_RST),
    .PAR_EN(UART_Config[0]),
    .PAR_TYP(UART_Config[1]),
    .Prescale(UART_Config[7:2]),
    .TX_IN_P(TX_DATA_SYNC),
    .TX_IN_V(!TX_Valid_SYNC),
    .RX_IN_S(UART_RX_IN),
    .TX_OUT_S(UART_TX_O),
    .TX_OUT_V(busy),
    .RX_OUT_V(RX_Valid),
    .RX_OUT_P(RX_OUT),
    .parity_error(parity_error),
    .framing_error(framing_error)
);

///********************************************************///
/// Register File
///********************************************************///
RegFile #(
    .WIDTH(DATA_WIDTH),
    .ADDR(RF_ADDR),
    .DEPTH(8)
) regfile_inst (
    .clk(REF_CLK),
    .rst(SYNC_REF_RST),
    .WrEn(WR_EN),
    .RdEn(RD_EN),
    .RdData(Rd_DATA),
    .RdData_valid(Rd_DATA_Valid),
    .Address(addr),
    .WrData(WR_DATA),
    .REG0(OP_A),
    .REG1(OP_B),
    .REG2(UART_Config),
    .REG3(DIV_Ratio)
);

///********************************************************///
/// ALU
///********************************************************///
ALU #(
    .OPER_WIDTH(DATA_WIDTH),
    .OUT_WIDTH(DATA_WIDTH*2)
) alu_inst (
    .CLK(ALU_Gated_CLK),
    .RST(SYNC_REF_RST),
    .A(OP_A),
    .B(OP_B),
    .ALU_FUN(ALU_FUN),
    .Enable(ALU_Enable),
    .ALU_OUT(ALU_OUT),
    .OUT_VALID(ALU_OUT_Valid)
);

///********************************************************///
/// Clock Gating
///********************************************************///
CLK_GATE clk_gating_inst (
    .CLK(REF_CLK),
    .GATE_EN(CLK_EN),
    .GATED_CLK(ALU_Gated_CLK)
);

///********************************************************///
/// System Controller
///********************************************************///
SYS_CTRL #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(RF_ADDR),
    .ALU_OUT_WIDTH(DATA_WIDTH*2)
) sys_ctrl_inst (
    .CLK(REF_CLK),
    .RST(SYNC_REF_RST),
    // ALU
    .ALU_FUN(ALU_FUN),
    .ALU_Enable(ALU_Enable),
    .ALU_OUT(ALU_OUT),
    .ALU_OUT_Valid(ALU_OUT_Valid),
    .CLK_EN(CLK_EN),
    // UART
    .RX_P_DATA(Rx_SYNC_OUT),
    .RX_D_VLD(RX_Valid_SYNC),
    .TX_P_DATA(TX_DATA_IN),
    .TX_D_VLD(TX_D_VLD),
    .FIFO_FULL(FIFO_FULL),
    // RF
    .Rd_DATA(Rd_DATA),
    .Rd_DATA_Valid(Rd_DATA_Valid),
    .WR_DATA(WR_DATA),
    .WR_EN(WR_EN),
    .RD_EN(RD_EN),
    .addr(addr),
    .clk_div_en(clk_div_en)
);

endmodule
