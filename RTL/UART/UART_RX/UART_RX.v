module UART_RX #(parameter DATA_WIDTH = 8 )
(
    input        CLK,
    input        RST,
    input        RX_IN,
    input        PAR_EN,
    input        PAR_TYP,
    input  [5:0] Prescale,
    output [DATA_WIDTH-1:0] P_DATA,
    output       data_valid,
    output       par_error,
    output       strt_glitch,
    output       stp_error
);

wire [5:0] edge_cnt;
wire [3:0] bit_cnt;
wire       data_samp_en, enable, deser_en;
wire       par_chk_en, strt_chk_en, stp_chk_en;
wire       sampled_bit, bit_done;

//  FSM 
FSM_RX fsm_inst (
    .CLK(CLK),
    .RST(RST),
    .RX_IN(RX_IN),
    .PAR_EN(PAR_EN),
    .bit_cnt(bit_cnt),
    .edge_cnt(edge_cnt),
    .par_error(par_error),
    .strt_glitch(strt_glitch),
    .stp_error(stp_error),
    .bit_done(bit_done),
    .data_samp_en(data_samp_en),
    .enable(enable),
    .par_chk_en(par_chk_en),
    .strt_chk_en(strt_chk_en),
    .stp_chk_en(stp_chk_en),
    .deser_en(deser_en),
    .data_valid(data_valid)
);

// edge_bit_counter 
edge_bit_count counter_inst (
    .CLK(CLK),
    .RST(RST),
    .enable(enable),
    .Prescale(Prescale),
    .bit_done(bit_done),
    .edge_cnt(edge_cnt),
    .bit_cnt(bit_cnt)
);

//  Data Sampling 
data_sampling sampling_inst (
    .CLK(CLK),
    .RST(RST),
    .RX_IN(RX_IN),
    .data_samp_en(data_samp_en),
    .Prescale(Prescale),
    .sampled_bit(sampled_bit),
    .edge_cnt(edge_cnt)
);

//   Deserializer  
deserializer # ( .DATA_WIDTH(DATA_WIDTH) ) 
deser_inst (
    .CLK(CLK),
    .RST(RST),
    .deser_en(deser_en),
    .sampled_bit(sampled_bit),
    .P_DATA(P_DATA) 
);

//   Checkers  
parity_check # ( .DATA_WIDTH(DATA_WIDTH) )
 par_chk (
    .CLK(CLK),
    .RST(RST),
    .par_chk_en(par_chk_en),
    .sampled_bit(sampled_bit),
    .PAR_TYP(PAR_TYP),
    .P_DATA(P_DATA),
    .par_error(par_error)
);

start_check strt_chk (
    .CLK(CLK),
    .RST(RST),
    .strt_chk_en(strt_chk_en),
    .sampled_bit(sampled_bit),
    .strt_glitch(strt_glitch)
);

stop_check stp_chk (
    .CLK(CLK),
    .RST(RST),
    .stp_chk_en(stp_chk_en),
    .sampled_bit(sampled_bit),
    .stp_error(stp_error)
);

endmodule