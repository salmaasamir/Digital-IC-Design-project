module UART_TX # ( parameter DATA_WIDTH = 8 )
(
    input  wire  [DATA_WIDTH-1:0] P_DATA,
    input  wire        PAR_EN,
    input  wire        Data_Valid,
    input  wire        PAR_TYP,
    input  wire        CLK,
    input  wire        RST,
    output wire        TX_OUT,
    output wire        busy
);
//internal signal 
wire         ser_done, ser_en;
wire         ser_data, par_bit;
wire [1:0]   mux_sel;

// instantiation of UART modules //
FSM_TX fsm_inst (
        .CLK(CLK),
        .RST(RST),
        .mux_sel(mux_sel),
        .ser_done(ser_done),
        .ser_en(ser_en),
        .busy(busy),
        .Data_Valid(Data_Valid),
        .PAR_EN(PAR_EN)
    );
MUX mux_inst (
        .mux_sel(mux_sel),
        .ser_data(ser_data),
        .par_bit(par_bit),
        .TX_OUT(TX_OUT)
    );
ParityCalc # (.WIDTH(DATA_WIDTH)
    ) Parity_Gen (
    .P_DATA(P_DATA),
    .busy(busy),
    .PAR_TYP(PAR_TYP),
    .PAR_EN(PAR_EN),
    .Data_Valid(Data_Valid),
    .par_bit(par_bit),
    .CLK(CLK),
    .RST(RST)
);

Serializer #(
   .DATA_WIDTH(DATA_WIDTH)
    ) u_Serializer (
    .P_DATA(P_DATA),
    .busy(busy),
    .Data_Valid(Data_Valid),
    .CLK(CLK),
    .RST(RST),
    .Enable(ser_en),
    .ser_done(ser_done),
    .ser_data(ser_data)
);

   
endmodule
