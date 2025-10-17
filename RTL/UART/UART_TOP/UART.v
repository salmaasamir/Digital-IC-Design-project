module UART # ( parameter DATA_WIDTH = 8 )
(
    input  wire                    TX_CLK,
    input  wire                    RX_CLK,
    input  wire                    RST,
    input  wire                    PAR_TYP,
    input  wire                    PAR_EN,
    input  wire  [5:0]             Prescale,
    input  wire  [DATA_WIDTH-1:0]  TX_IN_P,
    input  wire                    TX_IN_V,
    input  wire                    RX_IN_S,
    output wire                    TX_OUT_S,
    output wire                    TX_OUT_V,
    output wire                    RX_OUT_V,
    output wire  [DATA_WIDTH-1:0]  RX_OUT_P,
    output  wire                   parity_error,
    output  wire                   framing_error
    
);

UART_TX #(.DATA_WIDTH(DATA_WIDTH)
) UART_TX_inst (
    .CLK(TX_CLK),
    .RST(RST),
    .P_DATA(TX_IN_P),
    .PAR_EN(PAR_EN),
    .Data_Valid(TX_IN_V),
    .PAR_TYP(PAR_TYP),
    .TX_OUT(TX_OUT_S),
    .busy(TX_OUT_V)
);

UART_RX #(.DATA_WIDTH(DATA_WIDTH)
) UART_RX_inst (
    .CLK(RX_CLK),
    .RST(RST),
    .RX_IN(RX_IN_S),
    .PAR_EN(PAR_EN),
    .PAR_TYP(PAR_TYP),
    .Prescale(Prescale),
    .P_DATA(RX_OUT_P),
    .data_valid(RX_OUT_V),
    .par_error(parity_error),
    .stp_error(framing_error)
);

endmodule

