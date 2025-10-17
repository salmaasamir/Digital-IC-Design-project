/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Mon Sep 29 02:52:00 2025
/////////////////////////////////////////////////////////////


module RST_SYNC_NUM_STAGES2_0 ( CLK, RST, SYNC_RST );
  input CLK, RST;
  output SYNC_RST;
  wire   \sync_reg[0] ;

  DFFRQX2M \sync_reg_reg[1]  ( .D(\sync_reg[0] ), .CK(CLK), .RN(RST), .Q(
        SYNC_RST) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\sync_reg[0] )
         );
endmodule


module RST_SYNC_NUM_STAGES2_1 ( CLK, RST, SYNC_RST );
  input CLK, RST;
  output SYNC_RST;
  wire   \sync_reg[0] ;

  DFFRQX2M \sync_reg_reg[1]  ( .D(\sync_reg[0] ), .CK(CLK), .RN(RST), .Q(
        SYNC_RST) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\sync_reg[0] )
         );
endmodule


module DATA_SYNC_BUS_WIDTH8_NUM_STAGES2 ( CLK, RST, bus_enable, unsyn_bus, 
        sync_bus, enable_pulse );
  input [7:0] unsyn_bus;
  output [7:0] sync_bus;
  input CLK, RST, bus_enable;
  output enable_pulse;
  wire   enable_prev, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [1:0] sync_reg;

  DFFRQX2M enable_prev_reg ( .D(sync_reg[1]), .CK(CLK), .RN(RST), .Q(
        enable_prev) );
  DFFRQX2M \sync_reg_reg[1]  ( .D(sync_reg[0]), .CK(CLK), .RN(RST), .Q(
        sync_reg[1]) );
  DFFRQX2M \sync_bus_reg[7]  ( .D(n9), .CK(CLK), .RN(RST), .Q(sync_bus[7]) );
  DFFRQX2M \sync_bus_reg[5]  ( .D(n7), .CK(CLK), .RN(RST), .Q(sync_bus[5]) );
  DFFRQX2M \sync_bus_reg[6]  ( .D(n8), .CK(CLK), .RN(RST), .Q(sync_bus[6]) );
  DFFRQX2M \sync_bus_reg[4]  ( .D(n6), .CK(CLK), .RN(RST), .Q(sync_bus[4]) );
  DFFRQX2M \sync_bus_reg[3]  ( .D(n5), .CK(CLK), .RN(RST), .Q(sync_bus[3]) );
  DFFRQX2M \sync_bus_reg[1]  ( .D(n3), .CK(CLK), .RN(RST), .Q(sync_bus[1]) );
  DFFRQX2M enable_pulse_reg ( .D(n10), .CK(CLK), .RN(RST), .Q(enable_pulse) );
  DFFRQX2M \sync_bus_reg[0]  ( .D(n2), .CK(CLK), .RN(RST), .Q(sync_bus[0]) );
  DFFRQX2M \sync_bus_reg[2]  ( .D(n4), .CK(CLK), .RN(RST), .Q(sync_bus[2]) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(bus_enable), .CK(CLK), .RN(RST), .Q(
        sync_reg[0]) );
  INVX2M U3 ( .A(n1), .Y(n10) );
  NAND2BX2M U4 ( .AN(enable_prev), .B(sync_reg[1]), .Y(n1) );
  AO22X1M U5 ( .A0(unsyn_bus[0]), .A1(n10), .B0(sync_bus[0]), .B1(n1), .Y(n2)
         );
  AO22X1M U6 ( .A0(unsyn_bus[1]), .A1(n10), .B0(sync_bus[1]), .B1(n1), .Y(n3)
         );
  AO22X1M U7 ( .A0(unsyn_bus[2]), .A1(n10), .B0(sync_bus[2]), .B1(n1), .Y(n4)
         );
  AO22X1M U8 ( .A0(unsyn_bus[3]), .A1(n10), .B0(sync_bus[3]), .B1(n1), .Y(n5)
         );
  AO22X1M U9 ( .A0(unsyn_bus[4]), .A1(n10), .B0(sync_bus[4]), .B1(n1), .Y(n6)
         );
  AO22X1M U10 ( .A0(unsyn_bus[5]), .A1(n10), .B0(sync_bus[5]), .B1(n1), .Y(n7)
         );
  AO22X1M U11 ( .A0(unsyn_bus[6]), .A1(n10), .B0(sync_bus[6]), .B1(n1), .Y(n8)
         );
  AO22X1M U12 ( .A0(unsyn_bus[7]), .A1(n10), .B0(sync_bus[7]), .B1(n1), .Y(n9)
         );
endmodule


module FIFO_MEM_DATA_WIDTH8_ADDR_WIDTH3_FIFO_DEPTH8 ( W_CLK, W_RST, w_adder, 
        r_adder, w_full, w_inc, WR_DATA, RD_DATA );
  input [2:0] w_adder;
  input [2:0] r_adder;
  input [7:0] WR_DATA;
  output [7:0] RD_DATA;
  input W_CLK, W_RST, w_full, w_inc;
  wire   N9, N10, N11, \mem[7][7] , \mem[7][6] , \mem[7][5] , \mem[7][4] ,
         \mem[7][3] , \mem[7][2] , \mem[7][1] , \mem[7][0] , \mem[6][7] ,
         \mem[6][6] , \mem[6][5] , \mem[6][4] , \mem[6][3] , \mem[6][2] ,
         \mem[6][1] , \mem[6][0] , \mem[5][7] , \mem[5][6] , \mem[5][5] ,
         \mem[5][4] , \mem[5][3] , \mem[5][2] , \mem[5][1] , \mem[5][0] ,
         \mem[4][7] , \mem[4][6] , \mem[4][5] , \mem[4][4] , \mem[4][3] ,
         \mem[4][2] , \mem[4][1] , \mem[4][0] , \mem[3][7] , \mem[3][6] ,
         \mem[3][5] , \mem[3][4] , \mem[3][3] , \mem[3][2] , \mem[3][1] ,
         \mem[3][0] , \mem[2][7] , \mem[2][6] , \mem[2][5] , \mem[2][4] ,
         \mem[2][3] , \mem[2][2] , \mem[2][1] , \mem[2][0] , \mem[1][7] ,
         \mem[1][6] , \mem[1][5] , \mem[1][4] , \mem[1][3] , \mem[1][2] ,
         \mem[1][1] , \mem[1][0] , \mem[0][7] , \mem[0][6] , \mem[0][5] ,
         \mem[0][4] , \mem[0][3] , \mem[0][2] , \mem[0][1] , \mem[0][0] , n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113;
  assign N9 = r_adder[0];
  assign N10 = r_adder[1];
  assign N11 = r_adder[2];

  DFFRQX2M \mem_reg[5][7]  ( .D(n69), .CK(W_CLK), .RN(n100), .Q(\mem[5][7] )
         );
  DFFRQX2M \mem_reg[5][6]  ( .D(n68), .CK(W_CLK), .RN(n100), .Q(\mem[5][6] )
         );
  DFFRQX2M \mem_reg[5][5]  ( .D(n67), .CK(W_CLK), .RN(n100), .Q(\mem[5][5] )
         );
  DFFRQX2M \mem_reg[5][4]  ( .D(n66), .CK(W_CLK), .RN(n100), .Q(\mem[5][4] )
         );
  DFFRQX2M \mem_reg[5][3]  ( .D(n65), .CK(W_CLK), .RN(n100), .Q(\mem[5][3] )
         );
  DFFRQX2M \mem_reg[5][2]  ( .D(n64), .CK(W_CLK), .RN(n100), .Q(\mem[5][2] )
         );
  DFFRQX2M \mem_reg[5][1]  ( .D(n63), .CK(W_CLK), .RN(n100), .Q(\mem[5][1] )
         );
  DFFRQX2M \mem_reg[5][0]  ( .D(n62), .CK(W_CLK), .RN(n100), .Q(\mem[5][0] )
         );
  DFFRQX2M \mem_reg[1][7]  ( .D(n37), .CK(W_CLK), .RN(n102), .Q(\mem[1][7] )
         );
  DFFRQX2M \mem_reg[1][6]  ( .D(n36), .CK(W_CLK), .RN(n102), .Q(\mem[1][6] )
         );
  DFFRQX2M \mem_reg[1][5]  ( .D(n35), .CK(W_CLK), .RN(n102), .Q(\mem[1][5] )
         );
  DFFRQX2M \mem_reg[1][4]  ( .D(n34), .CK(W_CLK), .RN(n102), .Q(\mem[1][4] )
         );
  DFFRQX2M \mem_reg[1][3]  ( .D(n33), .CK(W_CLK), .RN(n103), .Q(\mem[1][3] )
         );
  DFFRQX2M \mem_reg[1][2]  ( .D(n32), .CK(W_CLK), .RN(n103), .Q(\mem[1][2] )
         );
  DFFRQX2M \mem_reg[1][1]  ( .D(n31), .CK(W_CLK), .RN(n103), .Q(\mem[1][1] )
         );
  DFFRQX2M \mem_reg[1][0]  ( .D(n30), .CK(W_CLK), .RN(n103), .Q(\mem[1][0] )
         );
  DFFRQX2M \mem_reg[7][7]  ( .D(n85), .CK(W_CLK), .RN(n99), .Q(\mem[7][7] ) );
  DFFRQX2M \mem_reg[7][6]  ( .D(n84), .CK(W_CLK), .RN(n99), .Q(\mem[7][6] ) );
  DFFRQX2M \mem_reg[7][5]  ( .D(n83), .CK(W_CLK), .RN(n99), .Q(\mem[7][5] ) );
  DFFRQX2M \mem_reg[7][4]  ( .D(n82), .CK(W_CLK), .RN(n99), .Q(\mem[7][4] ) );
  DFFRQX2M \mem_reg[7][3]  ( .D(n81), .CK(W_CLK), .RN(n99), .Q(\mem[7][3] ) );
  DFFRQX2M \mem_reg[7][2]  ( .D(n80), .CK(W_CLK), .RN(n99), .Q(\mem[7][2] ) );
  DFFRQX2M \mem_reg[7][1]  ( .D(n79), .CK(W_CLK), .RN(n99), .Q(\mem[7][1] ) );
  DFFRQX2M \mem_reg[7][0]  ( .D(n78), .CK(W_CLK), .RN(n99), .Q(\mem[7][0] ) );
  DFFRQX2M \mem_reg[3][7]  ( .D(n53), .CK(W_CLK), .RN(n101), .Q(\mem[3][7] )
         );
  DFFRQX2M \mem_reg[3][6]  ( .D(n52), .CK(W_CLK), .RN(n101), .Q(\mem[3][6] )
         );
  DFFRQX2M \mem_reg[3][5]  ( .D(n51), .CK(W_CLK), .RN(n101), .Q(\mem[3][5] )
         );
  DFFRQX2M \mem_reg[3][4]  ( .D(n50), .CK(W_CLK), .RN(n101), .Q(\mem[3][4] )
         );
  DFFRQX2M \mem_reg[3][3]  ( .D(n49), .CK(W_CLK), .RN(n101), .Q(\mem[3][3] )
         );
  DFFRQX2M \mem_reg[3][2]  ( .D(n48), .CK(W_CLK), .RN(n101), .Q(\mem[3][2] )
         );
  DFFRQX2M \mem_reg[3][1]  ( .D(n47), .CK(W_CLK), .RN(n101), .Q(\mem[3][1] )
         );
  DFFRQX2M \mem_reg[3][0]  ( .D(n46), .CK(W_CLK), .RN(n102), .Q(\mem[3][0] )
         );
  DFFRQX2M \mem_reg[6][7]  ( .D(n77), .CK(W_CLK), .RN(n99), .Q(\mem[6][7] ) );
  DFFRQX2M \mem_reg[6][6]  ( .D(n76), .CK(W_CLK), .RN(n99), .Q(\mem[6][6] ) );
  DFFRQX2M \mem_reg[6][5]  ( .D(n75), .CK(W_CLK), .RN(n99), .Q(\mem[6][5] ) );
  DFFRQX2M \mem_reg[6][4]  ( .D(n74), .CK(W_CLK), .RN(n99), .Q(\mem[6][4] ) );
  DFFRQX2M \mem_reg[6][3]  ( .D(n73), .CK(W_CLK), .RN(n99), .Q(\mem[6][3] ) );
  DFFRQX2M \mem_reg[6][2]  ( .D(n72), .CK(W_CLK), .RN(n100), .Q(\mem[6][2] )
         );
  DFFRQX2M \mem_reg[6][1]  ( .D(n71), .CK(W_CLK), .RN(n100), .Q(\mem[6][1] )
         );
  DFFRQX2M \mem_reg[6][0]  ( .D(n70), .CK(W_CLK), .RN(n100), .Q(\mem[6][0] )
         );
  DFFRQX2M \mem_reg[2][7]  ( .D(n45), .CK(W_CLK), .RN(n102), .Q(\mem[2][7] )
         );
  DFFRQX2M \mem_reg[2][6]  ( .D(n44), .CK(W_CLK), .RN(n102), .Q(\mem[2][6] )
         );
  DFFRQX2M \mem_reg[2][5]  ( .D(n43), .CK(W_CLK), .RN(n102), .Q(\mem[2][5] )
         );
  DFFRQX2M \mem_reg[2][4]  ( .D(n42), .CK(W_CLK), .RN(n102), .Q(\mem[2][4] )
         );
  DFFRQX2M \mem_reg[2][3]  ( .D(n41), .CK(W_CLK), .RN(n102), .Q(\mem[2][3] )
         );
  DFFRQX2M \mem_reg[2][2]  ( .D(n40), .CK(W_CLK), .RN(n102), .Q(\mem[2][2] )
         );
  DFFRQX2M \mem_reg[2][1]  ( .D(n39), .CK(W_CLK), .RN(n102), .Q(\mem[2][1] )
         );
  DFFRQX2M \mem_reg[2][0]  ( .D(n38), .CK(W_CLK), .RN(n102), .Q(\mem[2][0] )
         );
  DFFRQX2M \mem_reg[4][7]  ( .D(n61), .CK(W_CLK), .RN(n100), .Q(\mem[4][7] )
         );
  DFFRQX2M \mem_reg[4][6]  ( .D(n60), .CK(W_CLK), .RN(n100), .Q(\mem[4][6] )
         );
  DFFRQX2M \mem_reg[4][5]  ( .D(n59), .CK(W_CLK), .RN(n101), .Q(\mem[4][5] )
         );
  DFFRQX2M \mem_reg[4][4]  ( .D(n58), .CK(W_CLK), .RN(n101), .Q(\mem[4][4] )
         );
  DFFRQX2M \mem_reg[4][3]  ( .D(n57), .CK(W_CLK), .RN(n101), .Q(\mem[4][3] )
         );
  DFFRQX2M \mem_reg[4][2]  ( .D(n56), .CK(W_CLK), .RN(n101), .Q(\mem[4][2] )
         );
  DFFRQX2M \mem_reg[4][1]  ( .D(n55), .CK(W_CLK), .RN(n101), .Q(\mem[4][1] )
         );
  DFFRQX2M \mem_reg[4][0]  ( .D(n54), .CK(W_CLK), .RN(n101), .Q(\mem[4][0] )
         );
  DFFRQX2M \mem_reg[0][7]  ( .D(n29), .CK(W_CLK), .RN(n103), .Q(\mem[0][7] )
         );
  DFFRQX2M \mem_reg[0][6]  ( .D(n28), .CK(W_CLK), .RN(n103), .Q(\mem[0][6] )
         );
  DFFRQX2M \mem_reg[0][5]  ( .D(n27), .CK(W_CLK), .RN(n103), .Q(\mem[0][5] )
         );
  DFFRQX2M \mem_reg[0][4]  ( .D(n26), .CK(W_CLK), .RN(n103), .Q(\mem[0][4] )
         );
  DFFRQX2M \mem_reg[0][3]  ( .D(n25), .CK(W_CLK), .RN(n103), .Q(\mem[0][3] )
         );
  DFFRQX2M \mem_reg[0][2]  ( .D(n24), .CK(W_CLK), .RN(n103), .Q(\mem[0][2] )
         );
  DFFRQX2M \mem_reg[0][1]  ( .D(n23), .CK(W_CLK), .RN(n103), .Q(\mem[0][1] )
         );
  DFFRQX2M \mem_reg[0][0]  ( .D(n22), .CK(W_CLK), .RN(n103), .Q(\mem[0][0] )
         );
  NOR2BX2M U2 ( .AN(n16), .B(w_adder[2]), .Y(n12) );
  BUFX2M U3 ( .A(n19), .Y(n96) );
  BUFX2M U4 ( .A(n20), .Y(n95) );
  BUFX2M U5 ( .A(n21), .Y(n94) );
  BUFX2M U6 ( .A(n97), .Y(n101) );
  BUFX2M U7 ( .A(n97), .Y(n100) );
  BUFX2M U8 ( .A(n97), .Y(n99) );
  BUFX2M U9 ( .A(n98), .Y(n102) );
  BUFX2M U10 ( .A(n98), .Y(n103) );
  BUFX2M U11 ( .A(W_RST), .Y(n97) );
  BUFX2M U12 ( .A(W_RST), .Y(n98) );
  NAND3X2M U13 ( .A(n104), .B(n105), .C(n18), .Y(n17) );
  NAND3X2M U14 ( .A(n104), .B(n105), .C(n12), .Y(n11) );
  NAND3X2M U15 ( .A(n12), .B(n104), .C(w_adder[1]), .Y(n14) );
  NAND3X2M U16 ( .A(w_adder[0]), .B(n12), .C(w_adder[1]), .Y(n15) );
  NAND3X2M U17 ( .A(n12), .B(n105), .C(w_adder[0]), .Y(n13) );
  OAI2BB2X1M U18 ( .B0(n11), .B1(n106), .A0N(\mem[0][0] ), .A1N(n11), .Y(n22)
         );
  OAI2BB2X1M U19 ( .B0(n11), .B1(n107), .A0N(\mem[0][1] ), .A1N(n11), .Y(n23)
         );
  OAI2BB2X1M U20 ( .B0(n11), .B1(n108), .A0N(\mem[0][2] ), .A1N(n11), .Y(n24)
         );
  OAI2BB2X1M U21 ( .B0(n11), .B1(n109), .A0N(\mem[0][3] ), .A1N(n11), .Y(n25)
         );
  OAI2BB2X1M U22 ( .B0(n11), .B1(n110), .A0N(\mem[0][4] ), .A1N(n11), .Y(n26)
         );
  OAI2BB2X1M U23 ( .B0(n11), .B1(n111), .A0N(\mem[0][5] ), .A1N(n11), .Y(n27)
         );
  OAI2BB2X1M U24 ( .B0(n11), .B1(n112), .A0N(\mem[0][6] ), .A1N(n11), .Y(n28)
         );
  OAI2BB2X1M U25 ( .B0(n11), .B1(n113), .A0N(\mem[0][7] ), .A1N(n11), .Y(n29)
         );
  OAI2BB2X1M U26 ( .B0(n106), .B1(n14), .A0N(\mem[2][0] ), .A1N(n14), .Y(n38)
         );
  OAI2BB2X1M U27 ( .B0(n107), .B1(n14), .A0N(\mem[2][1] ), .A1N(n14), .Y(n39)
         );
  OAI2BB2X1M U28 ( .B0(n108), .B1(n14), .A0N(\mem[2][2] ), .A1N(n14), .Y(n40)
         );
  OAI2BB2X1M U29 ( .B0(n109), .B1(n14), .A0N(\mem[2][3] ), .A1N(n14), .Y(n41)
         );
  OAI2BB2X1M U30 ( .B0(n110), .B1(n14), .A0N(\mem[2][4] ), .A1N(n14), .Y(n42)
         );
  OAI2BB2X1M U31 ( .B0(n111), .B1(n14), .A0N(\mem[2][5] ), .A1N(n14), .Y(n43)
         );
  OAI2BB2X1M U32 ( .B0(n112), .B1(n14), .A0N(\mem[2][6] ), .A1N(n14), .Y(n44)
         );
  OAI2BB2X1M U33 ( .B0(n113), .B1(n14), .A0N(\mem[2][7] ), .A1N(n14), .Y(n45)
         );
  OAI2BB2X1M U34 ( .B0(n106), .B1(n15), .A0N(\mem[3][0] ), .A1N(n15), .Y(n46)
         );
  OAI2BB2X1M U35 ( .B0(n107), .B1(n15), .A0N(\mem[3][1] ), .A1N(n15), .Y(n47)
         );
  OAI2BB2X1M U36 ( .B0(n108), .B1(n15), .A0N(\mem[3][2] ), .A1N(n15), .Y(n48)
         );
  OAI2BB2X1M U37 ( .B0(n109), .B1(n15), .A0N(\mem[3][3] ), .A1N(n15), .Y(n49)
         );
  OAI2BB2X1M U38 ( .B0(n110), .B1(n15), .A0N(\mem[3][4] ), .A1N(n15), .Y(n50)
         );
  OAI2BB2X1M U39 ( .B0(n111), .B1(n15), .A0N(\mem[3][5] ), .A1N(n15), .Y(n51)
         );
  OAI2BB2X1M U40 ( .B0(n112), .B1(n15), .A0N(\mem[3][6] ), .A1N(n15), .Y(n52)
         );
  OAI2BB2X1M U41 ( .B0(n113), .B1(n15), .A0N(\mem[3][7] ), .A1N(n15), .Y(n53)
         );
  OAI2BB2X1M U42 ( .B0(n106), .B1(n13), .A0N(\mem[1][0] ), .A1N(n13), .Y(n30)
         );
  OAI2BB2X1M U43 ( .B0(n107), .B1(n13), .A0N(\mem[1][1] ), .A1N(n13), .Y(n31)
         );
  OAI2BB2X1M U44 ( .B0(n108), .B1(n13), .A0N(\mem[1][2] ), .A1N(n13), .Y(n32)
         );
  OAI2BB2X1M U45 ( .B0(n109), .B1(n13), .A0N(\mem[1][3] ), .A1N(n13), .Y(n33)
         );
  OAI2BB2X1M U46 ( .B0(n110), .B1(n13), .A0N(\mem[1][4] ), .A1N(n13), .Y(n34)
         );
  OAI2BB2X1M U47 ( .B0(n111), .B1(n13), .A0N(\mem[1][5] ), .A1N(n13), .Y(n35)
         );
  OAI2BB2X1M U48 ( .B0(n112), .B1(n13), .A0N(\mem[1][6] ), .A1N(n13), .Y(n36)
         );
  OAI2BB2X1M U49 ( .B0(n113), .B1(n13), .A0N(\mem[1][7] ), .A1N(n13), .Y(n37)
         );
  OAI2BB2X1M U50 ( .B0(n106), .B1(n17), .A0N(\mem[4][0] ), .A1N(n17), .Y(n54)
         );
  OAI2BB2X1M U51 ( .B0(n107), .B1(n17), .A0N(\mem[4][1] ), .A1N(n17), .Y(n55)
         );
  OAI2BB2X1M U52 ( .B0(n108), .B1(n17), .A0N(\mem[4][2] ), .A1N(n17), .Y(n56)
         );
  OAI2BB2X1M U53 ( .B0(n109), .B1(n17), .A0N(\mem[4][3] ), .A1N(n17), .Y(n57)
         );
  OAI2BB2X1M U54 ( .B0(n110), .B1(n17), .A0N(\mem[4][4] ), .A1N(n17), .Y(n58)
         );
  OAI2BB2X1M U55 ( .B0(n111), .B1(n17), .A0N(\mem[4][5] ), .A1N(n17), .Y(n59)
         );
  OAI2BB2X1M U56 ( .B0(n112), .B1(n17), .A0N(\mem[4][6] ), .A1N(n17), .Y(n60)
         );
  OAI2BB2X1M U57 ( .B0(n113), .B1(n17), .A0N(\mem[4][7] ), .A1N(n17), .Y(n61)
         );
  INVX2M U58 ( .A(WR_DATA[0]), .Y(n106) );
  INVX2M U59 ( .A(WR_DATA[1]), .Y(n107) );
  INVX2M U60 ( .A(WR_DATA[2]), .Y(n108) );
  INVX2M U61 ( .A(WR_DATA[3]), .Y(n109) );
  INVX2M U62 ( .A(WR_DATA[4]), .Y(n110) );
  INVX2M U63 ( .A(WR_DATA[5]), .Y(n111) );
  INVX2M U64 ( .A(WR_DATA[6]), .Y(n112) );
  INVX2M U65 ( .A(WR_DATA[7]), .Y(n113) );
  OAI2BB2X1M U66 ( .B0(n106), .B1(n96), .A0N(\mem[5][0] ), .A1N(n96), .Y(n62)
         );
  OAI2BB2X1M U67 ( .B0(n107), .B1(n96), .A0N(\mem[5][1] ), .A1N(n96), .Y(n63)
         );
  OAI2BB2X1M U68 ( .B0(n108), .B1(n96), .A0N(\mem[5][2] ), .A1N(n96), .Y(n64)
         );
  OAI2BB2X1M U69 ( .B0(n109), .B1(n96), .A0N(\mem[5][3] ), .A1N(n96), .Y(n65)
         );
  OAI2BB2X1M U70 ( .B0(n110), .B1(n96), .A0N(\mem[5][4] ), .A1N(n96), .Y(n66)
         );
  OAI2BB2X1M U71 ( .B0(n111), .B1(n96), .A0N(\mem[5][5] ), .A1N(n96), .Y(n67)
         );
  OAI2BB2X1M U72 ( .B0(n112), .B1(n96), .A0N(\mem[5][6] ), .A1N(n96), .Y(n68)
         );
  OAI2BB2X1M U73 ( .B0(n113), .B1(n96), .A0N(\mem[5][7] ), .A1N(n96), .Y(n69)
         );
  OAI2BB2X1M U74 ( .B0(n106), .B1(n95), .A0N(\mem[6][0] ), .A1N(n95), .Y(n70)
         );
  OAI2BB2X1M U75 ( .B0(n107), .B1(n95), .A0N(\mem[6][1] ), .A1N(n95), .Y(n71)
         );
  OAI2BB2X1M U76 ( .B0(n108), .B1(n95), .A0N(\mem[6][2] ), .A1N(n95), .Y(n72)
         );
  OAI2BB2X1M U77 ( .B0(n109), .B1(n95), .A0N(\mem[6][3] ), .A1N(n95), .Y(n73)
         );
  OAI2BB2X1M U78 ( .B0(n110), .B1(n95), .A0N(\mem[6][4] ), .A1N(n95), .Y(n74)
         );
  OAI2BB2X1M U79 ( .B0(n111), .B1(n95), .A0N(\mem[6][5] ), .A1N(n95), .Y(n75)
         );
  OAI2BB2X1M U80 ( .B0(n112), .B1(n95), .A0N(\mem[6][6] ), .A1N(n95), .Y(n76)
         );
  OAI2BB2X1M U81 ( .B0(n113), .B1(n95), .A0N(\mem[6][7] ), .A1N(n95), .Y(n77)
         );
  OAI2BB2X1M U82 ( .B0(n106), .B1(n94), .A0N(\mem[7][0] ), .A1N(n94), .Y(n78)
         );
  OAI2BB2X1M U83 ( .B0(n107), .B1(n94), .A0N(\mem[7][1] ), .A1N(n94), .Y(n79)
         );
  OAI2BB2X1M U84 ( .B0(n108), .B1(n94), .A0N(\mem[7][2] ), .A1N(n94), .Y(n80)
         );
  OAI2BB2X1M U85 ( .B0(n109), .B1(n94), .A0N(\mem[7][3] ), .A1N(n94), .Y(n81)
         );
  OAI2BB2X1M U86 ( .B0(n110), .B1(n94), .A0N(\mem[7][4] ), .A1N(n94), .Y(n82)
         );
  OAI2BB2X1M U87 ( .B0(n111), .B1(n94), .A0N(\mem[7][5] ), .A1N(n94), .Y(n83)
         );
  OAI2BB2X1M U88 ( .B0(n112), .B1(n94), .A0N(\mem[7][6] ), .A1N(n94), .Y(n84)
         );
  OAI2BB2X1M U89 ( .B0(n113), .B1(n94), .A0N(\mem[7][7] ), .A1N(n94), .Y(n85)
         );
  NOR2BX2M U90 ( .AN(w_inc), .B(w_full), .Y(n16) );
  AND2X2M U91 ( .A(w_adder[2]), .B(n16), .Y(n18) );
  NAND3X2M U92 ( .A(w_adder[0]), .B(n105), .C(n18), .Y(n19) );
  NAND3X2M U93 ( .A(w_adder[1]), .B(n104), .C(n18), .Y(n20) );
  NAND3X2M U94 ( .A(w_adder[1]), .B(w_adder[0]), .C(n18), .Y(n21) );
  INVX2M U95 ( .A(w_adder[1]), .Y(n105) );
  INVX2M U96 ( .A(w_adder[0]), .Y(n104) );
  MX2X2M U97 ( .A(n2), .B(n1), .S0(N11), .Y(RD_DATA[0]) );
  MX4X1M U98 ( .A(\mem[0][0] ), .B(\mem[1][0] ), .C(\mem[2][0] ), .D(
        \mem[3][0] ), .S0(n93), .S1(N10), .Y(n2) );
  MX4X1M U99 ( .A(\mem[4][0] ), .B(\mem[5][0] ), .C(\mem[6][0] ), .D(
        \mem[7][0] ), .S0(n92), .S1(N10), .Y(n1) );
  MX2X2M U100 ( .A(n4), .B(n3), .S0(N11), .Y(RD_DATA[1]) );
  MX4X1M U101 ( .A(\mem[0][1] ), .B(\mem[1][1] ), .C(\mem[2][1] ), .D(
        \mem[3][1] ), .S0(n93), .S1(N10), .Y(n4) );
  MX4X1M U102 ( .A(\mem[4][1] ), .B(\mem[5][1] ), .C(\mem[6][1] ), .D(
        \mem[7][1] ), .S0(n92), .S1(N10), .Y(n3) );
  MX2X2M U103 ( .A(n6), .B(n5), .S0(N11), .Y(RD_DATA[2]) );
  MX4X1M U104 ( .A(\mem[0][2] ), .B(\mem[1][2] ), .C(\mem[2][2] ), .D(
        \mem[3][2] ), .S0(n93), .S1(N10), .Y(n6) );
  MX4X1M U105 ( .A(\mem[4][2] ), .B(\mem[5][2] ), .C(\mem[6][2] ), .D(
        \mem[7][2] ), .S0(n92), .S1(N10), .Y(n5) );
  MX2X2M U106 ( .A(n8), .B(n7), .S0(N11), .Y(RD_DATA[3]) );
  MX4X1M U107 ( .A(\mem[0][3] ), .B(\mem[1][3] ), .C(\mem[2][3] ), .D(
        \mem[3][3] ), .S0(n93), .S1(N10), .Y(n8) );
  MX4X1M U108 ( .A(\mem[4][3] ), .B(\mem[5][3] ), .C(\mem[6][3] ), .D(
        \mem[7][3] ), .S0(n92), .S1(N10), .Y(n7) );
  MX2X2M U109 ( .A(n10), .B(n9), .S0(N11), .Y(RD_DATA[4]) );
  MX4X1M U110 ( .A(\mem[0][4] ), .B(\mem[1][4] ), .C(\mem[2][4] ), .D(
        \mem[3][4] ), .S0(n93), .S1(N10), .Y(n10) );
  MX4X1M U111 ( .A(\mem[4][4] ), .B(\mem[5][4] ), .C(\mem[6][4] ), .D(
        \mem[7][4] ), .S0(n92), .S1(N10), .Y(n9) );
  MX2X2M U112 ( .A(n87), .B(n86), .S0(N11), .Y(RD_DATA[5]) );
  MX4X1M U113 ( .A(\mem[0][5] ), .B(\mem[1][5] ), .C(\mem[2][5] ), .D(
        \mem[3][5] ), .S0(n93), .S1(N10), .Y(n87) );
  MX4X1M U114 ( .A(\mem[4][5] ), .B(\mem[5][5] ), .C(\mem[6][5] ), .D(
        \mem[7][5] ), .S0(n92), .S1(N10), .Y(n86) );
  MX2X2M U115 ( .A(n89), .B(n88), .S0(N11), .Y(RD_DATA[6]) );
  MX4X1M U116 ( .A(\mem[0][6] ), .B(\mem[1][6] ), .C(\mem[2][6] ), .D(
        \mem[3][6] ), .S0(n93), .S1(N10), .Y(n89) );
  MX4X1M U117 ( .A(\mem[4][6] ), .B(\mem[5][6] ), .C(\mem[6][6] ), .D(
        \mem[7][6] ), .S0(n92), .S1(N10), .Y(n88) );
  MX2X2M U118 ( .A(n91), .B(n90), .S0(N11), .Y(RD_DATA[7]) );
  MX4X1M U119 ( .A(\mem[0][7] ), .B(\mem[1][7] ), .C(\mem[2][7] ), .D(
        \mem[3][7] ), .S0(n93), .S1(N10), .Y(n91) );
  MX4X1M U120 ( .A(\mem[4][7] ), .B(\mem[5][7] ), .C(\mem[6][7] ), .D(
        \mem[7][7] ), .S0(n92), .S1(N10), .Y(n90) );
  BUFX2M U121 ( .A(N9), .Y(n92) );
  BUFX2M U122 ( .A(N9), .Y(n93) );
endmodule


module FIFO_RD_ADDR_WIDTH3 ( R_CLK, R_RST, r_inc, rq2_wptr, r_empty, r_adder, 
        r_ptr );
  input [3:0] rq2_wptr;
  output [2:0] r_adder;
  output [3:0] r_ptr;
  input R_CLK, R_RST, r_inc;
  output r_empty;
  wire   \r_Binary[3] , empty, n1, n2, n3, n4, n5, n6, n7;
  wire   [3:0] r_Binary_Next;
  wire   [2:0] r_Gray_Next;

  DFFRQX2M \r_Binary_reg[3]  ( .D(r_Binary_Next[3]), .CK(R_CLK), .RN(R_RST), 
        .Q(\r_Binary[3] ) );
  DFFRQX2M \r_ptr_reg[3]  ( .D(r_Binary_Next[3]), .CK(R_CLK), .RN(R_RST), .Q(
        r_ptr[3]) );
  DFFRQX2M \r_ptr_reg[2]  ( .D(r_Gray_Next[2]), .CK(R_CLK), .RN(R_RST), .Q(
        r_ptr[2]) );
  DFFRQX2M \r_ptr_reg[0]  ( .D(r_Gray_Next[0]), .CK(R_CLK), .RN(R_RST), .Q(
        r_ptr[0]) );
  DFFSQX2M r_empty_reg ( .D(empty), .CK(R_CLK), .SN(R_RST), .Q(r_empty) );
  DFFRQX2M \r_ptr_reg[1]  ( .D(r_Gray_Next[1]), .CK(R_CLK), .RN(R_RST), .Q(
        r_ptr[1]) );
  DFFRQX2M \r_Binary_reg[0]  ( .D(r_Binary_Next[0]), .CK(R_CLK), .RN(R_RST), 
        .Q(r_adder[0]) );
  DFFRQX2M \r_Binary_reg[2]  ( .D(r_Binary_Next[2]), .CK(R_CLK), .RN(R_RST), 
        .Q(r_adder[2]) );
  DFFRQX2M \r_Binary_reg[1]  ( .D(r_Binary_Next[1]), .CK(R_CLK), .RN(R_RST), 
        .Q(r_adder[1]) );
  CLKXOR2X2M U3 ( .A(r_Binary_Next[1]), .B(r_Binary_Next[0]), .Y(
        r_Gray_Next[0]) );
  CLKXOR2X2M U4 ( .A(r_Binary_Next[3]), .B(r_Binary_Next[2]), .Y(
        r_Gray_Next[2]) );
  CLKXOR2X2M U5 ( .A(r_Binary_Next[2]), .B(r_Binary_Next[1]), .Y(
        r_Gray_Next[1]) );
  XNOR2X2M U6 ( .A(n3), .B(r_adder[1]), .Y(r_Binary_Next[1]) );
  XNOR2X2M U7 ( .A(n1), .B(\r_Binary[3] ), .Y(r_Binary_Next[3]) );
  NAND2X2M U8 ( .A(n2), .B(r_adder[2]), .Y(n1) );
  NOR2BX2M U9 ( .AN(r_adder[1]), .B(n3), .Y(n2) );
  NOR4X1M U10 ( .A(n4), .B(n5), .C(n6), .D(n7), .Y(empty) );
  CLKXOR2X2M U11 ( .A(rq2_wptr[2]), .B(r_ptr[2]), .Y(n4) );
  CLKXOR2X2M U12 ( .A(rq2_wptr[3]), .B(r_ptr[3]), .Y(n5) );
  CLKXOR2X2M U13 ( .A(rq2_wptr[0]), .B(r_ptr[0]), .Y(n6) );
  NAND2X2M U14 ( .A(r_inc), .B(r_adder[0]), .Y(n3) );
  CLKXOR2X2M U15 ( .A(n2), .B(r_adder[2]), .Y(r_Binary_Next[2]) );
  CLKXOR2X2M U16 ( .A(rq2_wptr[1]), .B(r_ptr[1]), .Y(n7) );
  CLKXOR2X2M U17 ( .A(r_adder[0]), .B(r_inc), .Y(r_Binary_Next[0]) );
endmodule


module FIFO_WR_ADDR_WIDTH3 ( W_CLK, W_RST, w_inc, wq2_rptr, w_full, w_adder, 
        w_ptr );
  input [3:0] wq2_rptr;
  output [2:0] w_adder;
  output [3:0] w_ptr;
  input W_CLK, W_RST, w_inc;
  output w_full;
  wire   \w_Binary[3] , full, n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [3:0] w_Binary_Next;
  wire   [2:0] w_Gray_Next;

  DFFRQX2M \w_Binary_reg[3]  ( .D(w_Binary_Next[3]), .CK(W_CLK), .RN(W_RST), 
        .Q(\w_Binary[3] ) );
  DFFRQX2M \w_Binary_reg[2]  ( .D(w_Binary_Next[2]), .CK(W_CLK), .RN(W_RST), 
        .Q(w_adder[2]) );
  DFFRQX2M \w_Binary_reg[1]  ( .D(w_Binary_Next[1]), .CK(W_CLK), .RN(W_RST), 
        .Q(w_adder[1]) );
  DFFRQX2M w_full_reg ( .D(full), .CK(W_CLK), .RN(W_RST), .Q(w_full) );
  DFFRQX2M \w_Binary_reg[0]  ( .D(w_Binary_Next[0]), .CK(W_CLK), .RN(W_RST), 
        .Q(w_adder[0]) );
  DFFRQX2M \w_ptr_reg[3]  ( .D(w_Binary_Next[3]), .CK(W_CLK), .RN(W_RST), .Q(
        w_ptr[3]) );
  DFFRQX2M \w_ptr_reg[1]  ( .D(w_Gray_Next[1]), .CK(W_CLK), .RN(W_RST), .Q(
        w_ptr[1]) );
  DFFRQX2M \w_ptr_reg[2]  ( .D(w_Gray_Next[2]), .CK(W_CLK), .RN(W_RST), .Q(
        w_ptr[2]) );
  DFFRQX2M \w_ptr_reg[0]  ( .D(w_Gray_Next[0]), .CK(W_CLK), .RN(W_RST), .Q(
        w_ptr[0]) );
  CLKXOR2X2M U3 ( .A(w_Binary_Next[1]), .B(w_Binary_Next[0]), .Y(
        w_Gray_Next[0]) );
  CLKXOR2X2M U4 ( .A(w_Binary_Next[2]), .B(w_Binary_Next[1]), .Y(
        w_Gray_Next[1]) );
  CLKXOR2X2M U5 ( .A(w_Binary_Next[3]), .B(w_Binary_Next[2]), .Y(
        w_Gray_Next[2]) );
  XNOR2X2M U6 ( .A(n7), .B(w_adder[2]), .Y(w_Binary_Next[2]) );
  NAND2X2M U7 ( .A(w_adder[1]), .B(n6), .Y(n7) );
  XNOR2X2M U8 ( .A(n8), .B(\w_Binary[3] ), .Y(w_Binary_Next[3]) );
  NAND3X2M U9 ( .A(w_adder[1]), .B(n6), .C(w_adder[2]), .Y(n8) );
  NOR4X1M U10 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(full) );
  XNOR2X2M U11 ( .A(w_Binary_Next[3]), .B(wq2_rptr[3]), .Y(n1) );
  XNOR2X2M U12 ( .A(w_Gray_Next[2]), .B(wq2_rptr[2]), .Y(n2) );
  CLKXOR2X2M U13 ( .A(wq2_rptr[0]), .B(w_Gray_Next[0]), .Y(n3) );
  NOR2BX2M U14 ( .AN(w_inc), .B(w_full), .Y(n5) );
  AND2X2M U15 ( .A(w_adder[0]), .B(n5), .Y(n6) );
  CLKXOR2X2M U16 ( .A(n6), .B(w_adder[1]), .Y(w_Binary_Next[1]) );
  CLKXOR2X2M U17 ( .A(wq2_rptr[1]), .B(w_Gray_Next[1]), .Y(n4) );
  CLKXOR2X2M U18 ( .A(n5), .B(w_adder[0]), .Y(w_Binary_Next[0]) );
endmodule


module DF_SYNC_ADDR_WIDTH3 ( W_CLK, W_RST, R_CLK, R_RST, w_ptr, r_ptr, 
        wq2_rptr, rq2_wptr );
  input [3:0] w_ptr;
  input [3:0] r_ptr;
  output [3:0] wq2_rptr;
  output [3:0] rq2_wptr;
  input W_CLK, W_RST, R_CLK, R_RST;
  wire   \wq_ptr[3][0] , \wq_ptr[2][0] , \wq_ptr[1][0] , \wq_ptr[0][0] ,
         \rq_ptr[3][0] , \rq_ptr[2][0] , \rq_ptr[1][0] , \rq_ptr[0][0] ;

  DFFRQX2M \rq_ptr_reg[3][1]  ( .D(\rq_ptr[3][0] ), .CK(R_CLK), .RN(R_RST), 
        .Q(rq2_wptr[3]) );
  DFFRQX2M \rq_ptr_reg[2][1]  ( .D(\rq_ptr[2][0] ), .CK(R_CLK), .RN(R_RST), 
        .Q(rq2_wptr[2]) );
  DFFRQX2M \rq_ptr_reg[1][1]  ( .D(\rq_ptr[1][0] ), .CK(R_CLK), .RN(R_RST), 
        .Q(rq2_wptr[1]) );
  DFFRQX2M \rq_ptr_reg[0][1]  ( .D(\rq_ptr[0][0] ), .CK(R_CLK), .RN(R_RST), 
        .Q(rq2_wptr[0]) );
  DFFRQX2M \wq_ptr_reg[3][1]  ( .D(\wq_ptr[3][0] ), .CK(W_CLK), .RN(W_RST), 
        .Q(wq2_rptr[3]) );
  DFFRQX2M \wq_ptr_reg[2][1]  ( .D(\wq_ptr[2][0] ), .CK(W_CLK), .RN(W_RST), 
        .Q(wq2_rptr[2]) );
  DFFRQX2M \wq_ptr_reg[1][1]  ( .D(\wq_ptr[1][0] ), .CK(W_CLK), .RN(W_RST), 
        .Q(wq2_rptr[1]) );
  DFFRQX2M \wq_ptr_reg[0][1]  ( .D(\wq_ptr[0][0] ), .CK(W_CLK), .RN(W_RST), 
        .Q(wq2_rptr[0]) );
  DFFRQX2M \rq_ptr_reg[3][0]  ( .D(w_ptr[3]), .CK(R_CLK), .RN(R_RST), .Q(
        \rq_ptr[3][0] ) );
  DFFRQX2M \rq_ptr_reg[2][0]  ( .D(w_ptr[2]), .CK(R_CLK), .RN(R_RST), .Q(
        \rq_ptr[2][0] ) );
  DFFRQX2M \rq_ptr_reg[1][0]  ( .D(w_ptr[1]), .CK(R_CLK), .RN(R_RST), .Q(
        \rq_ptr[1][0] ) );
  DFFRQX2M \rq_ptr_reg[0][0]  ( .D(w_ptr[0]), .CK(R_CLK), .RN(R_RST), .Q(
        \rq_ptr[0][0] ) );
  DFFRQX2M \wq_ptr_reg[3][0]  ( .D(r_ptr[3]), .CK(W_CLK), .RN(W_RST), .Q(
        \wq_ptr[3][0] ) );
  DFFRQX2M \wq_ptr_reg[2][0]  ( .D(r_ptr[2]), .CK(W_CLK), .RN(W_RST), .Q(
        \wq_ptr[2][0] ) );
  DFFRQX2M \wq_ptr_reg[1][0]  ( .D(r_ptr[1]), .CK(W_CLK), .RN(W_RST), .Q(
        \wq_ptr[1][0] ) );
  DFFRQX2M \wq_ptr_reg[0][0]  ( .D(r_ptr[0]), .CK(W_CLK), .RN(W_RST), .Q(
        \wq_ptr[0][0] ) );
endmodule


module ASYNC_FIFO_DATA_WIDTH8_ADDR_WIDTH3_FIFO_DEPTH8 ( W_CLK, W_RST, R_CLK, 
        R_RST, w_inc, r_inc, WR_DATA, RD_DATA, w_full, r_empty );
  input [7:0] WR_DATA;
  output [7:0] RD_DATA;
  input W_CLK, W_RST, R_CLK, R_RST, w_inc, r_inc;
  output w_full, r_empty;
  wire   n1, n2;
  wire   [2:0] w_adder;
  wire   [2:0] r_adder;
  wire   [3:0] rq2_wptr;
  wire   [3:0] r_ptr;
  wire   [3:0] wq2_rptr;
  wire   [3:0] w_ptr;

  FIFO_MEM_DATA_WIDTH8_ADDR_WIDTH3_FIFO_DEPTH8 fifo_mem_inst ( .W_CLK(W_CLK), 
        .W_RST(n1), .w_adder(w_adder), .r_adder(r_adder), .w_full(w_full), 
        .w_inc(w_inc), .WR_DATA(WR_DATA), .RD_DATA(RD_DATA) );
  FIFO_RD_ADDR_WIDTH3 fifo_rd_inst ( .R_CLK(R_CLK), .R_RST(R_RST), .r_inc(
        r_inc), .rq2_wptr(rq2_wptr), .r_empty(r_empty), .r_adder(r_adder), 
        .r_ptr(r_ptr) );
  FIFO_WR_ADDR_WIDTH3 fifo_wr_inst ( .W_CLK(W_CLK), .W_RST(n1), .w_inc(w_inc), 
        .wq2_rptr(wq2_rptr), .w_full(w_full), .w_adder(w_adder), .w_ptr(w_ptr)
         );
  DF_SYNC_ADDR_WIDTH3 df_sync_inst ( .W_CLK(W_CLK), .W_RST(n1), .R_CLK(R_CLK), 
        .R_RST(R_RST), .w_ptr(w_ptr), .r_ptr(r_ptr), .wq2_rptr(wq2_rptr), 
        .rq2_wptr(rq2_wptr) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(W_RST), .Y(n2) );
endmodule


module PULSE_GEN ( clk, rst_n, ASYNC, pulse_sig );
  input clk, rst_n, ASYNC;
  output pulse_sig;
  wire   pls_flop, rcv_flop;

  DFFRQX2M rcv_flop_reg ( .D(ASYNC), .CK(clk), .RN(rst_n), .Q(rcv_flop) );
  DFFRQX2M pls_flop_reg ( .D(rcv_flop), .CK(clk), .RN(rst_n), .Q(pls_flop) );
  NOR2BX2M U3 ( .AN(rcv_flop), .B(pls_flop), .Y(pulse_sig) );
endmodule


module CLK_divider_0_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CLK_divider_0 ( ref_clk, clk_en, rst, div_ratio, div_clk );
  input [7:0] div_ratio;
  input ref_clk, clk_en, rst;
  output div_clk;
  wire   N3, div_clk_internal, flag, N17, N18, N19, N20, N21, N22, N23, N24,
         N38, N39, N40, N41, N42, N43, N44, N45, n23, n24, \add_24/carry[7] ,
         \add_24/carry[6] , \add_24/carry[5] , \add_24/carry[4] ,
         \add_24/carry[3] , \add_24/carry[2] , \add_24/carry[1] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38;
  wire   [7:0] half_period_1;
  wire   [7:0] half_period_2;
  wire   [7:0] counter;

  CLK_divider_0_DW01_inc_0 add_47 ( .A(counter), .SUM({N24, N23, N22, N21, N20, 
        N19, N18, N17}) );
  DFFSQX2M div_clk_internal_reg ( .D(n24), .CK(ref_clk), .SN(rst), .Q(
        div_clk_internal) );
  DFFRQX2M flag_reg ( .D(n23), .CK(ref_clk), .RN(rst), .Q(flag) );
  DFFRQX2M \counter_reg[7]  ( .D(N45), .CK(ref_clk), .RN(rst), .Q(counter[7])
         );
  DFFRQX2M \counter_reg[0]  ( .D(N38), .CK(ref_clk), .RN(rst), .Q(counter[0])
         );
  DFFRQX2M \counter_reg[6]  ( .D(N44), .CK(ref_clk), .RN(rst), .Q(counter[6])
         );
  DFFRQX2M \counter_reg[5]  ( .D(N43), .CK(ref_clk), .RN(rst), .Q(counter[5])
         );
  DFFRQX2M \counter_reg[4]  ( .D(N42), .CK(ref_clk), .RN(rst), .Q(counter[4])
         );
  DFFRQX2M \counter_reg[3]  ( .D(N41), .CK(ref_clk), .RN(rst), .Q(counter[3])
         );
  DFFRQX2M \counter_reg[2]  ( .D(N40), .CK(ref_clk), .RN(rst), .Q(counter[2])
         );
  DFFRQX2M \counter_reg[1]  ( .D(N39), .CK(ref_clk), .RN(rst), .Q(counter[1])
         );
  MX2X2M U3 ( .A(ref_clk), .B(div_clk_internal), .S0(N3), .Y(div_clk) );
  OR2X2M U4 ( .A(div_ratio[2]), .B(div_ratio[1]), .Y(n1) );
  CLKXOR2X2M U5 ( .A(half_period_1[7]), .B(\add_24/carry[7] ), .Y(
        half_period_2[7]) );
  AND2X1M U6 ( .A(half_period_1[6]), .B(\add_24/carry[6] ), .Y(
        \add_24/carry[7] ) );
  CLKXOR2X2M U7 ( .A(half_period_1[6]), .B(\add_24/carry[6] ), .Y(
        half_period_2[6]) );
  AND2X1M U8 ( .A(half_period_1[5]), .B(\add_24/carry[5] ), .Y(
        \add_24/carry[6] ) );
  CLKXOR2X2M U9 ( .A(half_period_1[5]), .B(\add_24/carry[5] ), .Y(
        half_period_2[5]) );
  AND2X1M U10 ( .A(half_period_1[4]), .B(\add_24/carry[4] ), .Y(
        \add_24/carry[5] ) );
  CLKXOR2X2M U11 ( .A(half_period_1[4]), .B(\add_24/carry[4] ), .Y(
        half_period_2[4]) );
  AND2X1M U12 ( .A(half_period_1[3]), .B(\add_24/carry[3] ), .Y(
        \add_24/carry[4] ) );
  CLKXOR2X2M U13 ( .A(half_period_1[3]), .B(\add_24/carry[3] ), .Y(
        half_period_2[3]) );
  AND2X1M U14 ( .A(half_period_1[2]), .B(\add_24/carry[2] ), .Y(
        \add_24/carry[3] ) );
  CLKXOR2X2M U15 ( .A(half_period_1[2]), .B(\add_24/carry[2] ), .Y(
        half_period_2[2]) );
  AND2X1M U16 ( .A(half_period_1[1]), .B(\add_24/carry[1] ), .Y(
        \add_24/carry[2] ) );
  CLKXOR2X2M U17 ( .A(half_period_1[1]), .B(\add_24/carry[1] ), .Y(
        half_period_2[1]) );
  AND2X1M U18 ( .A(div_ratio[0]), .B(half_period_1[0]), .Y(\add_24/carry[1] )
         );
  CLKXOR2X2M U19 ( .A(div_ratio[0]), .B(half_period_1[0]), .Y(half_period_2[0]) );
  CLKINVX1M U20 ( .A(div_ratio[1]), .Y(half_period_1[0]) );
  OAI2BB1X1M U21 ( .A0N(div_ratio[1]), .A1N(div_ratio[2]), .B0(n1), .Y(
        half_period_1[1]) );
  OR2X1M U22 ( .A(n1), .B(div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U23 ( .A0N(n1), .A1N(div_ratio[3]), .B0(n2), .Y(half_period_1[2])
         );
  OR2X1M U24 ( .A(n2), .B(div_ratio[4]), .Y(n3) );
  OAI2BB1X1M U25 ( .A0N(n2), .A1N(div_ratio[4]), .B0(n3), .Y(half_period_1[3])
         );
  OR2X1M U26 ( .A(n3), .B(div_ratio[5]), .Y(n4) );
  OAI2BB1X1M U27 ( .A0N(n3), .A1N(div_ratio[5]), .B0(n4), .Y(half_period_1[4])
         );
  XNOR2X1M U28 ( .A(div_ratio[6]), .B(n4), .Y(half_period_1[5]) );
  NOR3X1M U29 ( .A(div_ratio[6]), .B(div_ratio[7]), .C(n4), .Y(
        half_period_1[7]) );
  OAI21X1M U30 ( .A0(div_ratio[6]), .A1(n4), .B0(div_ratio[7]), .Y(n5) );
  NAND2BX1M U31 ( .AN(half_period_1[7]), .B(n5), .Y(half_period_1[6]) );
  CLKXOR2X2M U32 ( .A(div_clk_internal), .B(n6), .Y(n24) );
  AOI21X1M U33 ( .A0(n7), .A1(n8), .B0(n9), .Y(n6) );
  NOR2X1M U34 ( .A(n10), .B(n9), .Y(n23) );
  CLKXOR2X2M U35 ( .A(n7), .B(flag), .Y(n10) );
  NOR2BX1M U36 ( .AN(N24), .B(n11), .Y(N45) );
  NOR2BX1M U37 ( .AN(N23), .B(n11), .Y(N44) );
  NOR2BX1M U38 ( .AN(N22), .B(n11), .Y(N43) );
  NOR2BX1M U39 ( .AN(N21), .B(n11), .Y(N42) );
  NOR2BX1M U40 ( .AN(N20), .B(n11), .Y(N41) );
  NOR2BX1M U41 ( .AN(N19), .B(n11), .Y(N40) );
  NOR2BX1M U42 ( .AN(N18), .B(n11), .Y(N39) );
  NOR2BX1M U43 ( .AN(N17), .B(n11), .Y(N38) );
  NAND3BX1M U44 ( .AN(n9), .B(n8), .C(n7), .Y(n11) );
  CLKNAND2X2M U45 ( .A(n12), .B(div_ratio[0]), .Y(n7) );
  MXI2X1M U46 ( .A(n13), .B(n14), .S0(flag), .Y(n12) );
  CLKNAND2X2M U47 ( .A(n15), .B(n16), .Y(n14) );
  NOR4X1M U48 ( .A(n17), .B(n18), .C(n19), .D(n20), .Y(n16) );
  CLKXOR2X2M U49 ( .A(half_period_2[3]), .B(counter[3]), .Y(n20) );
  CLKXOR2X2M U50 ( .A(half_period_2[2]), .B(counter[2]), .Y(n19) );
  CLKXOR2X2M U51 ( .A(half_period_2[1]), .B(counter[1]), .Y(n18) );
  CLKXOR2X2M U52 ( .A(half_period_2[0]), .B(counter[0]), .Y(n17) );
  NOR4X1M U53 ( .A(n21), .B(n22), .C(n25), .D(n26), .Y(n15) );
  CLKXOR2X2M U54 ( .A(half_period_2[7]), .B(counter[7]), .Y(n26) );
  CLKXOR2X2M U55 ( .A(half_period_2[6]), .B(counter[6]), .Y(n25) );
  CLKXOR2X2M U56 ( .A(half_period_2[5]), .B(counter[5]), .Y(n22) );
  CLKXOR2X2M U57 ( .A(half_period_2[4]), .B(counter[4]), .Y(n21) );
  OR2X1M U58 ( .A(n13), .B(div_ratio[0]), .Y(n8) );
  CLKNAND2X2M U59 ( .A(n27), .B(n28), .Y(n13) );
  NOR4X1M U60 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n28) );
  CLKXOR2X2M U61 ( .A(half_period_1[3]), .B(counter[3]), .Y(n32) );
  CLKXOR2X2M U62 ( .A(half_period_1[2]), .B(counter[2]), .Y(n31) );
  CLKXOR2X2M U63 ( .A(half_period_1[1]), .B(counter[1]), .Y(n30) );
  CLKXOR2X2M U64 ( .A(half_period_1[0]), .B(counter[0]), .Y(n29) );
  NOR4X1M U65 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n27) );
  CLKXOR2X2M U66 ( .A(half_period_1[7]), .B(counter[7]), .Y(n36) );
  CLKXOR2X2M U67 ( .A(half_period_1[6]), .B(counter[6]), .Y(n35) );
  CLKXOR2X2M U68 ( .A(half_period_1[5]), .B(counter[5]), .Y(n34) );
  CLKXOR2X2M U69 ( .A(half_period_1[4]), .B(counter[4]), .Y(n33) );
  NOR2BX1M U70 ( .AN(rst), .B(n9), .Y(N3) );
  OAI2BB1X1M U71 ( .A0N(n37), .A1N(n38), .B0(clk_en), .Y(n9) );
  NOR4X1M U72 ( .A(div_ratio[7]), .B(div_ratio[6]), .C(div_ratio[5]), .D(
        div_ratio[4]), .Y(n38) );
  NOR3X1M U73 ( .A(div_ratio[1]), .B(div_ratio[3]), .C(div_ratio[2]), .Y(n37)
         );
endmodule


module CLKDIV_MUX ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n14, n15, n16, n17;

  INVX2M U3 ( .A(1'b1), .Y(OUT[4]) );
  INVX2M U5 ( .A(1'b1), .Y(OUT[5]) );
  INVX2M U7 ( .A(1'b1), .Y(OUT[6]) );
  INVX2M U9 ( .A(1'b1), .Y(OUT[7]) );
  NAND4BX1M U11 ( .AN(IN[4]), .B(IN[3]), .C(n15), .D(n14), .Y(n6) );
  NAND4BX1M U12 ( .AN(IN[3]), .B(IN[4]), .C(n15), .D(n14), .Y(n7) );
  NOR3X2M U13 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  OAI211X2M U14 ( .A0(n8), .A1(n9), .B0(n17), .C0(n16), .Y(OUT[0]) );
  NAND2X2M U15 ( .A(n7), .B(n6), .Y(n9) );
  NOR4X1M U16 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n15), .Y(n8) );
  NOR4X1M U17 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND3X2M U18 ( .A(n17), .B(n16), .C(IN[2]), .Y(n5) );
  NOR3X2M U19 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  INVX2M U20 ( .A(IN[2]), .Y(n15) );
  INVX2M U21 ( .A(IN[1]), .Y(n16) );
  INVX2M U22 ( .A(IN[0]), .Y(n17) );
  INVX2M U23 ( .A(IN[5]), .Y(n14) );
endmodule


module CLK_divider_1_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CLK_divider_1 ( ref_clk, clk_en, rst, div_ratio, div_clk );
  input [7:0] div_ratio;
  input ref_clk, clk_en, rst;
  output div_clk;
  wire   N3, div_clk_internal, flag, N17, N18, N19, N20, N21, N22, N23, N24,
         N38, N39, N40, N41, N42, N43, N44, N45, \add_24/carry[7] ,
         \add_24/carry[6] , \add_24/carry[5] , \add_24/carry[4] ,
         \add_24/carry[3] , \add_24/carry[2] , \add_24/carry[1] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40;
  wire   [7:0] half_period_1;
  wire   [7:0] half_period_2;
  wire   [7:0] counter;

  CLK_divider_1_DW01_inc_0 add_47 ( .A(counter), .SUM({N24, N23, N22, N21, N20, 
        N19, N18, N17}) );
  DFFSQX2M div_clk_internal_reg ( .D(n39), .CK(ref_clk), .SN(rst), .Q(
        div_clk_internal) );
  DFFRQX2M flag_reg ( .D(n40), .CK(ref_clk), .RN(rst), .Q(flag) );
  DFFRQX2M \counter_reg[7]  ( .D(N45), .CK(ref_clk), .RN(rst), .Q(counter[7])
         );
  DFFRQX2M \counter_reg[0]  ( .D(N38), .CK(ref_clk), .RN(rst), .Q(counter[0])
         );
  DFFRQX2M \counter_reg[6]  ( .D(N44), .CK(ref_clk), .RN(rst), .Q(counter[6])
         );
  DFFRQX2M \counter_reg[5]  ( .D(N43), .CK(ref_clk), .RN(rst), .Q(counter[5])
         );
  DFFRQX2M \counter_reg[4]  ( .D(N42), .CK(ref_clk), .RN(rst), .Q(counter[4])
         );
  DFFRQX2M \counter_reg[3]  ( .D(N41), .CK(ref_clk), .RN(rst), .Q(counter[3])
         );
  DFFRQX2M \counter_reg[2]  ( .D(N40), .CK(ref_clk), .RN(rst), .Q(counter[2])
         );
  DFFRQX2M \counter_reg[1]  ( .D(N39), .CK(ref_clk), .RN(rst), .Q(counter[1])
         );
  MX2X2M U3 ( .A(ref_clk), .B(div_clk_internal), .S0(N3), .Y(div_clk) );
  OR2X2M U4 ( .A(div_ratio[2]), .B(div_ratio[1]), .Y(n1) );
  CLKXOR2X2M U5 ( .A(half_period_1[7]), .B(\add_24/carry[7] ), .Y(
        half_period_2[7]) );
  AND2X1M U6 ( .A(half_period_1[6]), .B(\add_24/carry[6] ), .Y(
        \add_24/carry[7] ) );
  CLKXOR2X2M U7 ( .A(half_period_1[6]), .B(\add_24/carry[6] ), .Y(
        half_period_2[6]) );
  AND2X1M U8 ( .A(half_period_1[5]), .B(\add_24/carry[5] ), .Y(
        \add_24/carry[6] ) );
  CLKXOR2X2M U9 ( .A(half_period_1[5]), .B(\add_24/carry[5] ), .Y(
        half_period_2[5]) );
  AND2X1M U10 ( .A(half_period_1[4]), .B(\add_24/carry[4] ), .Y(
        \add_24/carry[5] ) );
  CLKXOR2X2M U11 ( .A(half_period_1[4]), .B(\add_24/carry[4] ), .Y(
        half_period_2[4]) );
  AND2X1M U12 ( .A(half_period_1[3]), .B(\add_24/carry[3] ), .Y(
        \add_24/carry[4] ) );
  CLKXOR2X2M U13 ( .A(half_period_1[3]), .B(\add_24/carry[3] ), .Y(
        half_period_2[3]) );
  AND2X1M U14 ( .A(half_period_1[2]), .B(\add_24/carry[2] ), .Y(
        \add_24/carry[3] ) );
  CLKXOR2X2M U15 ( .A(half_period_1[2]), .B(\add_24/carry[2] ), .Y(
        half_period_2[2]) );
  AND2X1M U16 ( .A(half_period_1[1]), .B(\add_24/carry[1] ), .Y(
        \add_24/carry[2] ) );
  CLKXOR2X2M U17 ( .A(half_period_1[1]), .B(\add_24/carry[1] ), .Y(
        half_period_2[1]) );
  AND2X1M U18 ( .A(div_ratio[0]), .B(half_period_1[0]), .Y(\add_24/carry[1] )
         );
  CLKXOR2X2M U19 ( .A(div_ratio[0]), .B(half_period_1[0]), .Y(half_period_2[0]) );
  CLKINVX1M U20 ( .A(div_ratio[1]), .Y(half_period_1[0]) );
  OAI2BB1X1M U21 ( .A0N(div_ratio[1]), .A1N(div_ratio[2]), .B0(n1), .Y(
        half_period_1[1]) );
  OR2X1M U22 ( .A(n1), .B(div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U23 ( .A0N(n1), .A1N(div_ratio[3]), .B0(n2), .Y(half_period_1[2])
         );
  OR2X1M U24 ( .A(n2), .B(div_ratio[4]), .Y(n3) );
  OAI2BB1X1M U25 ( .A0N(n2), .A1N(div_ratio[4]), .B0(n3), .Y(half_period_1[3])
         );
  OR2X1M U26 ( .A(n3), .B(div_ratio[5]), .Y(n4) );
  OAI2BB1X1M U27 ( .A0N(n3), .A1N(div_ratio[5]), .B0(n4), .Y(half_period_1[4])
         );
  XNOR2X1M U28 ( .A(div_ratio[6]), .B(n4), .Y(half_period_1[5]) );
  NOR3X1M U29 ( .A(div_ratio[6]), .B(div_ratio[7]), .C(n4), .Y(
        half_period_1[7]) );
  OAI21X1M U30 ( .A0(div_ratio[6]), .A1(n4), .B0(div_ratio[7]), .Y(n5) );
  NAND2BX1M U31 ( .AN(half_period_1[7]), .B(n5), .Y(half_period_1[6]) );
  CLKXOR2X2M U32 ( .A(div_clk_internal), .B(n6), .Y(n39) );
  AOI21X1M U33 ( .A0(n7), .A1(n8), .B0(n9), .Y(n6) );
  NOR2X1M U34 ( .A(n10), .B(n9), .Y(n40) );
  CLKXOR2X2M U35 ( .A(n7), .B(flag), .Y(n10) );
  NOR2BX1M U36 ( .AN(N24), .B(n11), .Y(N45) );
  NOR2BX1M U37 ( .AN(N23), .B(n11), .Y(N44) );
  NOR2BX1M U38 ( .AN(N22), .B(n11), .Y(N43) );
  NOR2BX1M U39 ( .AN(N21), .B(n11), .Y(N42) );
  NOR2BX1M U40 ( .AN(N20), .B(n11), .Y(N41) );
  NOR2BX1M U41 ( .AN(N19), .B(n11), .Y(N40) );
  NOR2BX1M U42 ( .AN(N18), .B(n11), .Y(N39) );
  NOR2BX1M U43 ( .AN(N17), .B(n11), .Y(N38) );
  NAND3BX1M U44 ( .AN(n9), .B(n8), .C(n7), .Y(n11) );
  CLKNAND2X2M U45 ( .A(n12), .B(div_ratio[0]), .Y(n7) );
  MXI2X1M U46 ( .A(n13), .B(n14), .S0(flag), .Y(n12) );
  CLKNAND2X2M U47 ( .A(n15), .B(n16), .Y(n14) );
  NOR4X1M U48 ( .A(n17), .B(n18), .C(n19), .D(n20), .Y(n16) );
  CLKXOR2X2M U49 ( .A(half_period_2[3]), .B(counter[3]), .Y(n20) );
  CLKXOR2X2M U50 ( .A(half_period_2[2]), .B(counter[2]), .Y(n19) );
  CLKXOR2X2M U51 ( .A(half_period_2[1]), .B(counter[1]), .Y(n18) );
  CLKXOR2X2M U52 ( .A(half_period_2[0]), .B(counter[0]), .Y(n17) );
  NOR4X1M U53 ( .A(n21), .B(n22), .C(n25), .D(n26), .Y(n15) );
  CLKXOR2X2M U54 ( .A(half_period_2[7]), .B(counter[7]), .Y(n26) );
  CLKXOR2X2M U55 ( .A(half_period_2[6]), .B(counter[6]), .Y(n25) );
  CLKXOR2X2M U56 ( .A(half_period_2[5]), .B(counter[5]), .Y(n22) );
  CLKXOR2X2M U57 ( .A(half_period_2[4]), .B(counter[4]), .Y(n21) );
  OR2X1M U58 ( .A(n13), .B(div_ratio[0]), .Y(n8) );
  CLKNAND2X2M U59 ( .A(n27), .B(n28), .Y(n13) );
  NOR4X1M U60 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n28) );
  CLKXOR2X2M U61 ( .A(half_period_1[3]), .B(counter[3]), .Y(n32) );
  CLKXOR2X2M U62 ( .A(half_period_1[2]), .B(counter[2]), .Y(n31) );
  CLKXOR2X2M U63 ( .A(half_period_1[1]), .B(counter[1]), .Y(n30) );
  CLKXOR2X2M U64 ( .A(half_period_1[0]), .B(counter[0]), .Y(n29) );
  NOR4X1M U65 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n27) );
  CLKXOR2X2M U66 ( .A(half_period_1[7]), .B(counter[7]), .Y(n36) );
  CLKXOR2X2M U67 ( .A(half_period_1[6]), .B(counter[6]), .Y(n35) );
  CLKXOR2X2M U68 ( .A(half_period_1[5]), .B(counter[5]), .Y(n34) );
  CLKXOR2X2M U69 ( .A(half_period_1[4]), .B(counter[4]), .Y(n33) );
  NOR2BX1M U70 ( .AN(rst), .B(n9), .Y(N3) );
  OAI2BB1X1M U71 ( .A0N(n37), .A1N(n38), .B0(clk_en), .Y(n9) );
  NOR4X1M U72 ( .A(div_ratio[7]), .B(div_ratio[6]), .C(div_ratio[5]), .D(
        div_ratio[4]), .Y(n38) );
  NOR3X1M U73 ( .A(div_ratio[1]), .B(div_ratio[3]), .C(div_ratio[2]), .Y(n37)
         );
endmodule


module FSM ( Data_Valid, PAR_EN, ser_done, CLK, RST, mux_sel, ser_en, busy );
  output [1:0] mux_sel;
  input Data_Valid, PAR_EN, ser_done, CLK, RST;
  output ser_en, busy;
  wire   n6, n7, n8, n9, n10, n2, n3, n4, n5, n11;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  INVX2M U3 ( .A(busy), .Y(n4) );
  INVX2M U4 ( .A(n6), .Y(ser_en) );
  NOR2X2M U5 ( .A(n5), .B(current_state[2]), .Y(busy) );
  INVX2M U6 ( .A(current_state[1]), .Y(n5) );
  OAI31X1M U7 ( .A0(n11), .A1(n2), .A2(n6), .B0(n8), .Y(next_state[0]) );
  INVX2M U8 ( .A(PAR_EN), .Y(n11) );
  NAND3X2M U9 ( .A(n9), .B(n5), .C(Data_Valid), .Y(n8) );
  NAND2BX2M U10 ( .AN(current_state[2]), .B(n10), .Y(mux_sel[0]) );
  XNOR2X2M U11 ( .A(n5), .B(current_state[0]), .Y(n10) );
  OAI33X2M U12 ( .A0(n3), .A1(current_state[2]), .A2(current_state[1]), .B0(n4), .B1(current_state[0]), .B2(n7), .Y(next_state[1]) );
  INVX2M U13 ( .A(current_state[0]), .Y(n3) );
  NOR2X2M U14 ( .A(current_state[0]), .B(current_state[2]), .Y(n9) );
  NAND2X2M U15 ( .A(current_state[1]), .B(n9), .Y(n6) );
  NOR2X2M U16 ( .A(n2), .B(PAR_EN), .Y(n7) );
  AOI2BB1X2M U17 ( .A0N(n7), .A1N(current_state[0]), .B0(n4), .Y(next_state[2]) );
  INVX2M U18 ( .A(ser_done), .Y(n2) );
  BUFX2M U19 ( .A(busy), .Y(mux_sel[1]) );
endmodule


module MUX ( mux_sel, ser_data, par_bit, TX_OUT );
  input [1:0] mux_sel;
  input ser_data, par_bit;
  output TX_OUT;
  wire   n2, n3, n1;

  OAI21X4M U3 ( .A0(n2), .A1(n1), .B0(n3), .Y(TX_OUT) );
  NAND3X2M U4 ( .A(mux_sel[1]), .B(n1), .C(ser_data), .Y(n3) );
  NOR2BX2M U5 ( .AN(mux_sel[1]), .B(par_bit), .Y(n2) );
  INVX2M U6 ( .A(mux_sel[0]), .Y(n1) );
endmodule


module ParityCalc_WIDTH8 ( P_DATA, CLK, RST, busy, Data_Valid, PAR_EN, PAR_TYP, 
        par_bit );
  input [7:0] P_DATA;
  input CLK, RST, busy, Data_Valid, PAR_EN, PAR_TYP;
  output par_bit;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n2
;
  wire   [7:0] DATA;

  DFFRQX2M \DATA_reg[1]  ( .D(n10), .CK(CLK), .RN(RST), .Q(DATA[1]) );
  DFFRQX2M \DATA_reg[0]  ( .D(n9), .CK(CLK), .RN(RST), .Q(DATA[0]) );
  DFFRQX2M \DATA_reg[2]  ( .D(n11), .CK(CLK), .RN(RST), .Q(DATA[2]) );
  DFFRQX2M \DATA_reg[3]  ( .D(n12), .CK(CLK), .RN(RST), .Q(DATA[3]) );
  DFFRQX2M \DATA_reg[5]  ( .D(n14), .CK(CLK), .RN(RST), .Q(DATA[5]) );
  DFFRQX2M \DATA_reg[4]  ( .D(n13), .CK(CLK), .RN(RST), .Q(DATA[4]) );
  DFFRQX2M \DATA_reg[6]  ( .D(n15), .CK(CLK), .RN(RST), .Q(DATA[6]) );
  DFFRQX2M \DATA_reg[7]  ( .D(n16), .CK(CLK), .RN(RST), .Q(DATA[7]) );
  DFFRQX2M par_bit_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(par_bit) );
  NOR2BX2M U2 ( .AN(Data_Valid), .B(busy), .Y(n7) );
  AO2B2X2M U3 ( .B0(P_DATA[0]), .B1(n7), .A0(DATA[0]), .A1N(n7), .Y(n9) );
  AO2B2X2M U4 ( .B0(P_DATA[1]), .B1(n7), .A0(DATA[1]), .A1N(n7), .Y(n10) );
  AO2B2X2M U5 ( .B0(P_DATA[2]), .B1(n7), .A0(DATA[2]), .A1N(n7), .Y(n11) );
  AO2B2X2M U6 ( .B0(P_DATA[3]), .B1(n7), .A0(DATA[3]), .A1N(n7), .Y(n12) );
  AO2B2X2M U7 ( .B0(P_DATA[4]), .B1(n7), .A0(DATA[4]), .A1N(n7), .Y(n13) );
  AO2B2X2M U8 ( .B0(P_DATA[5]), .B1(n7), .A0(DATA[5]), .A1N(n7), .Y(n14) );
  AO2B2X2M U9 ( .B0(P_DATA[6]), .B1(n7), .A0(DATA[6]), .A1N(n7), .Y(n15) );
  AO2B2X2M U10 ( .B0(P_DATA[7]), .B1(n7), .A0(DATA[7]), .A1N(n7), .Y(n16) );
  OAI2BB2X1M U11 ( .B0(n1), .B1(n2), .A0N(par_bit), .A1N(n2), .Y(n8) );
  INVX2M U12 ( .A(PAR_EN), .Y(n2) );
  XOR3XLM U13 ( .A(n3), .B(PAR_TYP), .C(n4), .Y(n1) );
  XOR3XLM U14 ( .A(DATA[1]), .B(DATA[0]), .C(n5), .Y(n4) );
  XOR3XLM U15 ( .A(DATA[5]), .B(DATA[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U16 ( .A(DATA[7]), .B(DATA[6]), .Y(n6) );
  XNOR2X2M U17 ( .A(DATA[2]), .B(DATA[3]), .Y(n5) );
endmodule


module Serializer_DATA_WIDTH8 ( P_DATA, Data_Valid, CLK, RST, Enable, busy, 
        ser_done, ser_data );
  input [7:0] P_DATA;
  input Data_Valid, CLK, RST, Enable, busy;
  output ser_done, ser_data;
  wire   N31, N32, N33, N34, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n1, n2, n3, n4
;
  wire   [7:0] DATA_V;
  wire   [3:0] counter;

  DFFRQX2M \DATA_V_reg[0]  ( .D(n19), .CK(CLK), .RN(RST), .Q(DATA_V[0]) );
  DFFRQX2M \DATA_V_reg[6]  ( .D(n21), .CK(CLK), .RN(RST), .Q(DATA_V[6]) );
  DFFRQX2M \DATA_V_reg[5]  ( .D(n22), .CK(CLK), .RN(RST), .Q(DATA_V[5]) );
  DFFRQX2M \DATA_V_reg[4]  ( .D(n23), .CK(CLK), .RN(RST), .Q(DATA_V[4]) );
  DFFRQX2M \DATA_V_reg[3]  ( .D(n24), .CK(CLK), .RN(RST), .Q(DATA_V[3]) );
  DFFRQX2M \DATA_V_reg[2]  ( .D(n25), .CK(CLK), .RN(RST), .Q(DATA_V[2]) );
  DFFRQX2M \DATA_V_reg[1]  ( .D(n26), .CK(CLK), .RN(RST), .Q(DATA_V[1]) );
  DFFRQX2M \DATA_V_reg[7]  ( .D(n20), .CK(CLK), .RN(RST), .Q(DATA_V[7]) );
  DFFRQX2M ser_done_reg ( .D(N31), .CK(CLK), .RN(RST), .Q(ser_done) );
  DFFRQX2M \counter_reg[2]  ( .D(N34), .CK(CLK), .RN(RST), .Q(counter[2]) );
  DFFRQX2M \counter_reg[1]  ( .D(N33), .CK(CLK), .RN(RST), .Q(counter[1]) );
  DFFRQX2M \counter_reg[0]  ( .D(N32), .CK(CLK), .RN(RST), .Q(counter[0]) );
  DFFSQX2M ser_data_reg ( .D(DATA_V[0]), .CK(CLK), .SN(RST), .Q(ser_data) );
  NOR2X2M U3 ( .A(n4), .B(n8), .Y(n7) );
  NOR2X2M U4 ( .A(n8), .B(n7), .Y(n5) );
  INVX2M U5 ( .A(Enable), .Y(n4) );
  NOR2BX2M U6 ( .AN(Data_Valid), .B(busy), .Y(n8) );
  OAI2BB1X2M U7 ( .A0N(DATA_V[0]), .A1N(n5), .B0(n6), .Y(n19) );
  AOI22X1M U8 ( .A0(DATA_V[1]), .A1(n7), .B0(P_DATA[0]), .B1(n8), .Y(n6) );
  OAI2BB1X2M U9 ( .A0N(DATA_V[1]), .A1N(n5), .B0(n14), .Y(n26) );
  AOI22X1M U10 ( .A0(DATA_V[2]), .A1(n7), .B0(P_DATA[1]), .B1(n8), .Y(n14) );
  OAI2BB1X2M U11 ( .A0N(n5), .A1N(DATA_V[2]), .B0(n13), .Y(n25) );
  AOI22X1M U12 ( .A0(DATA_V[3]), .A1(n7), .B0(P_DATA[2]), .B1(n8), .Y(n13) );
  OAI2BB1X2M U13 ( .A0N(n5), .A1N(DATA_V[3]), .B0(n12), .Y(n24) );
  AOI22X1M U14 ( .A0(DATA_V[4]), .A1(n7), .B0(P_DATA[3]), .B1(n8), .Y(n12) );
  OAI2BB1X2M U15 ( .A0N(n5), .A1N(DATA_V[4]), .B0(n11), .Y(n23) );
  AOI22X1M U16 ( .A0(DATA_V[5]), .A1(n7), .B0(P_DATA[4]), .B1(n8), .Y(n11) );
  OAI2BB1X2M U17 ( .A0N(n5), .A1N(DATA_V[5]), .B0(n10), .Y(n22) );
  AOI22X1M U18 ( .A0(DATA_V[6]), .A1(n7), .B0(P_DATA[5]), .B1(n8), .Y(n10) );
  OAI2BB1X2M U19 ( .A0N(n5), .A1N(DATA_V[6]), .B0(n9), .Y(n21) );
  AOI22X1M U20 ( .A0(DATA_V[7]), .A1(n7), .B0(P_DATA[6]), .B1(n8), .Y(n9) );
  AO22X1M U21 ( .A0(n5), .A1(DATA_V[7]), .B0(P_DATA[7]), .B1(n8), .Y(n20) );
  OAI32X1M U22 ( .A0(n16), .A1(n1), .A2(n2), .B0(n17), .B1(n3), .Y(N34) );
  NAND2X2M U23 ( .A(Enable), .B(n3), .Y(n16) );
  AOI21X2M U24 ( .A0(Enable), .A1(n2), .B0(N32), .Y(n17) );
  INVX2M U25 ( .A(counter[2]), .Y(n3) );
  NOR2X2M U26 ( .A(n4), .B(counter[0]), .Y(N32) );
  NOR2X2M U27 ( .A(n15), .B(n4), .Y(N31) );
  NAND3X2M U28 ( .A(counter[1]), .B(counter[0]), .C(counter[2]), .Y(n15) );
  NOR2X2M U29 ( .A(n18), .B(n4), .Y(N33) );
  CLKXOR2X2M U30 ( .A(n1), .B(counter[1]), .Y(n18) );
  INVX2M U31 ( .A(counter[0]), .Y(n1) );
  INVX2M U32 ( .A(counter[1]), .Y(n2) );
endmodule


module UART_TX_DATA_WIDTH8 ( P_DATA, PAR_EN, Data_Valid, PAR_TYP, CLK, RST, 
        TX_OUT, busy );
  input [7:0] P_DATA;
  input PAR_EN, Data_Valid, PAR_TYP, CLK, RST;
  output TX_OUT, busy;
  wire   ser_done, ser_en, ser_data, par_bit, n1, n2;
  wire   [1:0] mux_sel;

  FSM fsm_inst ( .Data_Valid(Data_Valid), .PAR_EN(PAR_EN), .ser_done(ser_done), 
        .CLK(CLK), .RST(n1), .mux_sel(mux_sel), .ser_en(ser_en), .busy(busy)
         );
  MUX mux_inst ( .mux_sel(mux_sel), .ser_data(ser_data), .par_bit(par_bit), 
        .TX_OUT(TX_OUT) );
  ParityCalc_WIDTH8 Parity_Gen ( .P_DATA(P_DATA), .CLK(CLK), .RST(n1), .busy(
        busy), .Data_Valid(Data_Valid), .PAR_EN(PAR_EN), .PAR_TYP(PAR_TYP), 
        .par_bit(par_bit) );
  Serializer_DATA_WIDTH8 u_Serializer ( .P_DATA(P_DATA), .Data_Valid(
        Data_Valid), .CLK(CLK), .RST(n1), .Enable(ser_en), .busy(busy), 
        .ser_done(ser_done), .ser_data(ser_data) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module FSM_RX ( CLK, RST, RX_IN, PAR_EN, bit_done, bit_cnt, edge_cnt, 
        par_error, strt_glitch, stp_error, data_samp_en, enable, par_chk_en, 
        strt_chk_en, stp_chk_en, deser_en, data_valid );
  input [3:0] bit_cnt;
  input [5:0] edge_cnt;
  input CLK, RST, RX_IN, PAR_EN, bit_done, par_error, strt_glitch, stp_error;
  output data_samp_en, enable, par_chk_en, strt_chk_en, stp_chk_en, deser_en,
         data_valid;
  wire   n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n2, n3, n4, n5,
         n17;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  INVX2M U3 ( .A(n10), .Y(n4) );
  NOR3X2M U4 ( .A(n2), .B(n3), .C(n8), .Y(par_chk_en) );
  NOR2X2M U5 ( .A(n2), .B(n4), .Y(stp_chk_en) );
  OAI21BX1M U6 ( .A0(current_state[2]), .A1(n14), .B0N(stp_chk_en), .Y(
        next_state[0]) );
  AOI22X1M U7 ( .A0(n15), .A1(n3), .B0(current_state[0]), .B1(n2), .Y(n14) );
  OAI32X1M U8 ( .A0(n17), .A1(n5), .A2(n7), .B0(current_state[1]), .B1(RX_IN), 
        .Y(n15) );
  NOR2X2M U9 ( .A(n6), .B(current_state[0]), .Y(n10) );
  NAND2X2M U10 ( .A(current_state[2]), .B(n5), .Y(n6) );
  NAND2BX2M U11 ( .AN(current_state[2]), .B(current_state[1]), .Y(n8) );
  INVX2M U12 ( .A(current_state[0]), .Y(n3) );
  INVX2M U13 ( .A(current_state[1]), .Y(n5) );
  OAI32X1M U14 ( .A0(n11), .A1(n3), .A2(n2), .B0(n12), .B1(n8), .Y(
        next_state[1]) );
  OR3X2M U15 ( .A(strt_glitch), .B(current_state[2]), .C(current_state[1]), 
        .Y(n11) );
  NOR2X2M U16 ( .A(n13), .B(n2), .Y(n12) );
  AOI2B1X1M U17 ( .A1N(n7), .A0(n17), .B0(current_state[0]), .Y(n13) );
  OAI31X1M U18 ( .A0(n7), .A1(PAR_EN), .A2(n8), .B0(n9), .Y(next_state[2]) );
  NOR2X2M U19 ( .A(par_chk_en), .B(n10), .Y(n9) );
  NAND4X2M U20 ( .A(bit_cnt[3]), .B(bit_cnt[0]), .C(n16), .D(bit_done), .Y(n7)
         );
  NOR2X2M U21 ( .A(bit_cnt[2]), .B(bit_cnt[1]), .Y(n16) );
  INVX2M U22 ( .A(bit_done), .Y(n2) );
  NOR3X2M U23 ( .A(n8), .B(current_state[0]), .C(n2), .Y(deser_en) );
  AND3X2M U24 ( .A(n6), .B(current_state[0]), .C(n5), .Y(strt_chk_en) );
  NOR4X1M U25 ( .A(stp_error), .B(par_error), .C(n3), .D(n6), .Y(data_valid)
         );
  INVX2M U26 ( .A(PAR_EN), .Y(n17) );
  BUFX2M U27 ( .A(enable), .Y(data_samp_en) );
  OAI211X2M U28 ( .A0(current_state[2]), .A1(n3), .B0(n8), .C0(n4), .Y(enable)
         );
endmodule


module edge_bit_count ( CLK, RST, enable, Prescale, edge_cnt, bit_cnt, 
        bit_done );
  input [5:0] Prescale;
  output [5:0] edge_cnt;
  output [3:0] bit_cnt;
  input CLK, RST, enable;
  output bit_done;
  wire   prev_enable, N8, N9, N10, N11, N12, N13, N14, N15, N24, N25, N26, N27,
         N28, N41, N42, N43, N44, N45, N46, N47, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, \add_35/carry[5] , \add_35/carry[4] ,
         \add_35/carry[3] , \add_35/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8,
         n21, n22, n23, n24, n25, n26, n27, n28, n29;

  DFFRQX2M \bit_cnt_reg[3]  ( .D(n17), .CK(CLK), .RN(RST), .Q(bit_cnt[3]) );
  DFFRQX2M bit_done_reg ( .D(N41), .CK(CLK), .RN(RST), .Q(bit_done) );
  DFFRQX2M prev_enable_reg ( .D(enable), .CK(CLK), .RN(RST), .Q(prev_enable)
         );
  DFFRQX2M \bit_cnt_reg[2]  ( .D(n18), .CK(CLK), .RN(RST), .Q(bit_cnt[2]) );
  DFFRQX2M \bit_cnt_reg[1]  ( .D(n19), .CK(CLK), .RN(RST), .Q(bit_cnt[1]) );
  DFFRQX2M \bit_cnt_reg[0]  ( .D(n20), .CK(CLK), .RN(RST), .Q(bit_cnt[0]) );
  DFFRQX2M \edge_cnt_reg[5]  ( .D(N47), .CK(CLK), .RN(RST), .Q(edge_cnt[5]) );
  DFFRQX2M \edge_cnt_reg[0]  ( .D(N42), .CK(CLK), .RN(RST), .Q(edge_cnt[0]) );
  DFFRQX2M \edge_cnt_reg[4]  ( .D(N46), .CK(CLK), .RN(RST), .Q(edge_cnt[4]) );
  DFFRQX2M \edge_cnt_reg[1]  ( .D(N43), .CK(CLK), .RN(RST), .Q(edge_cnt[1]) );
  DFFRQX2M \edge_cnt_reg[2]  ( .D(N44), .CK(CLK), .RN(RST), .Q(edge_cnt[2]) );
  DFFRQX2M \edge_cnt_reg[3]  ( .D(N45), .CK(CLK), .RN(RST), .Q(edge_cnt[3]) );
  INVX2M U3 ( .A(N41), .Y(n26) );
  NOR2X2M U4 ( .A(n15), .B(n29), .Y(N41) );
  INVX2M U5 ( .A(enable), .Y(n29) );
  AND2X2M U6 ( .A(N27), .B(n16), .Y(N46) );
  AND2X2M U7 ( .A(N26), .B(n16), .Y(N45) );
  AND2X2M U8 ( .A(N25), .B(n16), .Y(N44) );
  AND2X2M U9 ( .A(N24), .B(n16), .Y(N43) );
  OAI32X1M U10 ( .A0(n11), .A1(bit_cnt[2]), .A2(n27), .B0(n12), .B1(n28), .Y(
        n18) );
  INVX2M U11 ( .A(bit_cnt[2]), .Y(n28) );
  AOI21X2M U12 ( .A0(N41), .A1(n27), .B0(n13), .Y(n12) );
  INVX2M U13 ( .A(bit_cnt[1]), .Y(n27) );
  NAND2X2M U14 ( .A(prev_enable), .B(N15), .Y(n15) );
  OAI2B2X1M U15 ( .A1N(bit_cnt[0]), .A0(n14), .B0(bit_cnt[0]), .B1(n26), .Y(
        n20) );
  OAI21X2M U16 ( .A0(bit_cnt[0]), .A1(n26), .B0(n14), .Y(n13) );
  OAI2BB2X1M U17 ( .B0(bit_cnt[1]), .B1(n11), .A0N(n13), .A1N(bit_cnt[1]), .Y(
        n19) );
  NAND2X2M U18 ( .A(N41), .B(bit_cnt[0]), .Y(n11) );
  NOR3BX2M U19 ( .AN(prev_enable), .B(n29), .C(N15), .Y(n16) );
  NAND3X2M U20 ( .A(enable), .B(n15), .C(prev_enable), .Y(n14) );
  NOR3BX2M U21 ( .AN(prev_enable), .B(n9), .C(n29), .Y(n17) );
  CLKXOR2X2M U22 ( .A(n10), .B(bit_cnt[3]), .Y(n9) );
  NAND4X1M U23 ( .A(bit_cnt[2]), .B(N15), .C(bit_cnt[1]), .D(bit_cnt[0]), .Y(
        n10) );
  OAI2B2X1M U24 ( .A1N(n16), .A0(edge_cnt[0]), .B0(prev_enable), .B1(n29), .Y(
        N42) );
  AND2X2M U25 ( .A(N28), .B(n16), .Y(N47) );
  ADDHX1M U26 ( .A(edge_cnt[2]), .B(\add_35/carry[2] ), .CO(\add_35/carry[3] ), 
        .S(N25) );
  ADDHX1M U27 ( .A(edge_cnt[3]), .B(\add_35/carry[3] ), .CO(\add_35/carry[4] ), 
        .S(N26) );
  ADDHX1M U28 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .CO(\add_35/carry[2] ), .S(
        N24) );
  ADDHX1M U29 ( .A(edge_cnt[4]), .B(\add_35/carry[4] ), .CO(\add_35/carry[5] ), 
        .S(N27) );
  OR2X2M U30 ( .A(Prescale[1]), .B(Prescale[0]), .Y(n1) );
  CLKINVX1M U31 ( .A(Prescale[0]), .Y(N8) );
  OAI2BB1X1M U32 ( .A0N(Prescale[0]), .A1N(Prescale[1]), .B0(n1), .Y(N9) );
  OR2X1M U33 ( .A(n1), .B(Prescale[2]), .Y(n2) );
  OAI2BB1X1M U34 ( .A0N(n1), .A1N(Prescale[2]), .B0(n2), .Y(N10) );
  OR2X1M U35 ( .A(n2), .B(Prescale[3]), .Y(n3) );
  OAI2BB1X1M U36 ( .A0N(n2), .A1N(Prescale[3]), .B0(n3), .Y(N11) );
  OR2X1M U37 ( .A(n3), .B(Prescale[4]), .Y(n4) );
  OAI2BB1X1M U38 ( .A0N(n3), .A1N(Prescale[4]), .B0(n4), .Y(N12) );
  NOR2X1M U39 ( .A(n4), .B(Prescale[5]), .Y(N14) );
  AO21XLM U40 ( .A0(n4), .A1(Prescale[5]), .B0(N14), .Y(N13) );
  CLKXOR2X2M U41 ( .A(\add_35/carry[5] ), .B(edge_cnt[5]), .Y(N28) );
  NOR2BX1M U42 ( .AN(N8), .B(edge_cnt[0]), .Y(n5) );
  OAI2B2X1M U43 ( .A1N(edge_cnt[1]), .A0(n5), .B0(N9), .B1(n5), .Y(n21) );
  XNOR2X1M U44 ( .A(N13), .B(edge_cnt[5]), .Y(n8) );
  NOR2BX1M U45 ( .AN(edge_cnt[0]), .B(N8), .Y(n6) );
  OAI2B2X1M U46 ( .A1N(N9), .A0(n6), .B0(edge_cnt[1]), .B1(n6), .Y(n7) );
  NAND4BX1M U47 ( .AN(N14), .B(n21), .C(n8), .D(n7), .Y(n25) );
  CLKXOR2X2M U48 ( .A(N12), .B(edge_cnt[4]), .Y(n24) );
  CLKXOR2X2M U49 ( .A(N10), .B(edge_cnt[2]), .Y(n23) );
  CLKXOR2X2M U50 ( .A(N11), .B(edge_cnt[3]), .Y(n22) );
  NOR4X1M U51 ( .A(n25), .B(n24), .C(n23), .D(n22), .Y(N15) );
endmodule


module data_sampling ( CLK, RST, RX_IN, data_samp_en, Prescale, edge_cnt, 
        sampled_bit );
  input [5:0] Prescale;
  input [5:0] edge_cnt;
  input CLK, RST, RX_IN, data_samp_en;
  output sampled_bit;
  wire   sample_reg1, sample_reg2, sample_reg3, n18, n19, n20, n21,
         \add_14/carry[4] , \add_14/carry[3] , \add_14/carry[2] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42;
  wire   [5:0] sample1;
  wire   [5:0] sample3;

  DFFRQX2M sample_reg2_reg ( .D(n20), .CK(CLK), .RN(RST), .Q(sample_reg2) );
  DFFRQX2M sample_reg1_reg ( .D(n21), .CK(CLK), .RN(RST), .Q(sample_reg1) );
  DFFRQX2M sample_reg3_reg ( .D(n19), .CK(CLK), .RN(RST), .Q(sample_reg3) );
  DFFRQX2M sampled_bit_reg ( .D(n18), .CK(CLK), .RN(RST), .Q(sampled_bit) );
  OR2X2M U3 ( .A(Prescale[2]), .B(Prescale[1]), .Y(n1) );
  ADDHX1M U4 ( .A(Prescale[4]), .B(\add_14/carry[3] ), .CO(\add_14/carry[4] ), 
        .S(sample3[3]) );
  ADDHX1M U5 ( .A(Prescale[3]), .B(\add_14/carry[2] ), .CO(\add_14/carry[3] ), 
        .S(sample3[2]) );
  ADDHX1M U6 ( .A(Prescale[2]), .B(Prescale[1]), .CO(\add_14/carry[2] ), .S(
        sample3[1]) );
  ADDHX1M U7 ( .A(Prescale[5]), .B(\add_14/carry[4] ), .CO(sample3[5]), .S(
        sample3[4]) );
  CLKINVX1M U8 ( .A(Prescale[1]), .Y(sample1[0]) );
  OAI2BB1X1M U9 ( .A0N(Prescale[1]), .A1N(Prescale[2]), .B0(n1), .Y(sample1[1]) );
  OR2X1M U10 ( .A(n1), .B(Prescale[3]), .Y(n2) );
  OAI2BB1X1M U11 ( .A0N(n1), .A1N(Prescale[3]), .B0(n2), .Y(sample1[2]) );
  XNOR2X1M U12 ( .A(Prescale[4]), .B(n2), .Y(sample1[3]) );
  NOR3X1M U13 ( .A(Prescale[4]), .B(Prescale[5]), .C(n2), .Y(sample1[5]) );
  OAI21X1M U14 ( .A0(Prescale[4]), .A1(n2), .B0(Prescale[5]), .Y(n3) );
  NAND2BX1M U15 ( .AN(sample1[5]), .B(n3), .Y(sample1[4]) );
  MXI2X1M U16 ( .A(n4), .B(n5), .S0(n6), .Y(n21) );
  NOR2X1M U17 ( .A(n7), .B(n8), .Y(n6) );
  MXI2X1M U18 ( .A(n9), .B(n5), .S0(n10), .Y(n20) );
  NOR4X1M U19 ( .A(n11), .B(n12), .C(n13), .D(n8), .Y(n10) );
  OR3X1M U20 ( .A(n14), .B(n15), .C(n16), .Y(n11) );
  CLKINVX1M U21 ( .A(RX_IN), .Y(n5) );
  CLKMX2X2M U22 ( .A(sample_reg3), .B(RX_IN), .S0(n17), .Y(n19) );
  CLKMX2X2M U23 ( .A(sampled_bit), .B(n22), .S0(n17), .Y(n18) );
  AND4X1M U24 ( .A(n23), .B(n24), .C(n25), .D(n26), .Y(n17) );
  NOR4X1M U25 ( .A(n27), .B(n28), .C(n29), .D(n30), .Y(n26) );
  CLKXOR2X2M U26 ( .A(sample3[5]), .B(edge_cnt[5]), .Y(n30) );
  CLKXOR2X2M U27 ( .A(sample3[4]), .B(edge_cnt[4]), .Y(n29) );
  CLKXOR2X2M U28 ( .A(sample3[3]), .B(edge_cnt[3]), .Y(n28) );
  CLKXOR2X2M U29 ( .A(sample3[2]), .B(edge_cnt[2]), .Y(n27) );
  NOR3X1M U30 ( .A(n8), .B(n13), .C(n31), .Y(n25) );
  NOR4X1M U31 ( .A(n12), .B(n15), .C(n16), .D(n14), .Y(n31) );
  CLKXOR2X2M U32 ( .A(edge_cnt[3]), .B(Prescale[4]), .Y(n14) );
  NAND3BX1M U33 ( .AN(edge_cnt[5]), .B(n32), .C(n33), .Y(n16) );
  XNOR2X1M U34 ( .A(edge_cnt[0]), .B(Prescale[1]), .Y(n33) );
  XNOR2X1M U35 ( .A(edge_cnt[1]), .B(Prescale[2]), .Y(n32) );
  XNOR2X1M U36 ( .A(n34), .B(Prescale[5]), .Y(n15) );
  CLKINVX1M U37 ( .A(edge_cnt[4]), .Y(n34) );
  CLKXOR2X2M U38 ( .A(edge_cnt[2]), .B(Prescale[3]), .Y(n12) );
  CLKINVX1M U39 ( .A(n7), .Y(n13) );
  NAND4X1M U40 ( .A(n35), .B(n36), .C(n37), .D(n38), .Y(n7) );
  NOR3X1M U41 ( .A(n39), .B(n40), .C(n41), .Y(n38) );
  CLKXOR2X2M U42 ( .A(sample1[4]), .B(edge_cnt[4]), .Y(n41) );
  CLKXOR2X2M U43 ( .A(sample1[1]), .B(edge_cnt[1]), .Y(n40) );
  CLKXOR2X2M U44 ( .A(sample1[0]), .B(edge_cnt[0]), .Y(n39) );
  XNOR2X1M U45 ( .A(edge_cnt[2]), .B(sample1[2]), .Y(n37) );
  XNOR2X1M U46 ( .A(edge_cnt[3]), .B(sample1[3]), .Y(n36) );
  XNOR2X1M U47 ( .A(edge_cnt[5]), .B(sample1[5]), .Y(n35) );
  CLKINVX1M U48 ( .A(data_samp_en), .Y(n8) );
  XNOR2X1M U49 ( .A(edge_cnt[0]), .B(sample1[0]), .Y(n24) );
  XNOR2X1M U50 ( .A(edge_cnt[1]), .B(sample3[1]), .Y(n23) );
  OAI21X1M U51 ( .A0(n4), .A1(n9), .B0(n42), .Y(n22) );
  OAI21X1M U52 ( .A0(sample_reg1), .A1(sample_reg2), .B0(sample_reg3), .Y(n42)
         );
  CLKINVX1M U53 ( .A(sample_reg2), .Y(n9) );
  CLKINVX1M U54 ( .A(sample_reg1), .Y(n4) );
endmodule


module deserializer_DATA_WIDTH8 ( CLK, RST, deser_en, sampled_bit, P_DATA );
  output [7:0] P_DATA;
  input CLK, RST, deser_en, sampled_bit;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n1, n2, n3, n4, n5, n6, n7, n8,
         n17;

  DFFRQX2M \P_DATA_reg[0]  ( .D(n9), .CK(CLK), .RN(RST), .Q(P_DATA[0]) );
  DFFRQX2M \P_DATA_reg[5]  ( .D(n14), .CK(CLK), .RN(RST), .Q(P_DATA[5]) );
  DFFRQX2M \P_DATA_reg[1]  ( .D(n10), .CK(CLK), .RN(RST), .Q(P_DATA[1]) );
  DFFRQX2M \P_DATA_reg[4]  ( .D(n13), .CK(CLK), .RN(RST), .Q(P_DATA[4]) );
  DFFRQX2M \P_DATA_reg[7]  ( .D(n16), .CK(CLK), .RN(RST), .Q(P_DATA[7]) );
  DFFRQX2M \P_DATA_reg[3]  ( .D(n12), .CK(CLK), .RN(RST), .Q(P_DATA[3]) );
  DFFRQX2M \P_DATA_reg[6]  ( .D(n15), .CK(CLK), .RN(RST), .Q(P_DATA[6]) );
  DFFRQX2M \P_DATA_reg[2]  ( .D(n11), .CK(CLK), .RN(RST), .Q(P_DATA[2]) );
  OAI22X1M U2 ( .A0(n17), .A1(n7), .B0(n1), .B1(n8), .Y(n10) );
  OAI22X1M U3 ( .A0(n17), .A1(n6), .B0(n1), .B1(n7), .Y(n11) );
  OAI22X1M U4 ( .A0(n17), .A1(n5), .B0(n1), .B1(n6), .Y(n12) );
  OAI22X1M U5 ( .A0(n17), .A1(n4), .B0(n1), .B1(n5), .Y(n13) );
  OAI22X1M U6 ( .A0(n17), .A1(n3), .B0(n1), .B1(n4), .Y(n14) );
  OAI22X1M U7 ( .A0(n17), .A1(n2), .B0(n1), .B1(n3), .Y(n15) );
  INVX2M U8 ( .A(n1), .Y(n17) );
  OAI2BB2X1M U9 ( .B0(n1), .B1(n2), .A0N(sampled_bit), .A1N(n1), .Y(n16) );
  OAI2BB2X1M U10 ( .B0(n8), .B1(n17), .A0N(P_DATA[0]), .A1N(n17), .Y(n9) );
  BUFX2M U11 ( .A(deser_en), .Y(n1) );
  INVX2M U12 ( .A(P_DATA[2]), .Y(n7) );
  INVX2M U13 ( .A(P_DATA[6]), .Y(n3) );
  INVX2M U14 ( .A(P_DATA[7]), .Y(n2) );
  INVX2M U15 ( .A(P_DATA[3]), .Y(n6) );
  INVX2M U16 ( .A(P_DATA[1]), .Y(n8) );
  INVX2M U17 ( .A(P_DATA[4]), .Y(n5) );
  INVX2M U18 ( .A(P_DATA[5]), .Y(n4) );
endmodule


module parity_check_DATA_WIDTH8 ( CLK, RST, P_DATA, PAR_TYP, par_chk_en, 
        sampled_bit, par_error );
  input [7:0] P_DATA;
  input CLK, RST, PAR_TYP, par_chk_en, sampled_bit;
  output par_error;
  wire   n1, n3, n4, n5, n6, n7, n8, n2;

  DFFRQX2M par_error_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(par_error) );
  OAI2BB2X1M U2 ( .B0(n1), .B1(n2), .A0N(par_error), .A1N(n2), .Y(n8) );
  INVX2M U3 ( .A(par_chk_en), .Y(n2) );
  XOR3XLM U4 ( .A(n3), .B(n4), .C(n5), .Y(n1) );
  XNOR2X2M U5 ( .A(sampled_bit), .B(PAR_TYP), .Y(n5) );
  XOR3XLM U6 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n4) );
  XNOR2X2M U7 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
  XOR3XLM U8 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n7), .Y(n3) );
  XNOR2X2M U9 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n7) );
endmodule


module start_check ( CLK, RST, strt_chk_en, sampled_bit, strt_glitch );
  input CLK, RST, strt_chk_en, sampled_bit;
  output strt_glitch;
  wire   N4;

  DFFRQX2M strt_glitch_reg ( .D(N4), .CK(CLK), .RN(RST), .Q(strt_glitch) );
  AND2X2M U3 ( .A(strt_chk_en), .B(sampled_bit), .Y(N4) );
endmodule


module stop_check ( CLK, RST, stp_chk_en, sampled_bit, stp_error );
  input CLK, RST, stp_chk_en, sampled_bit;
  output stp_error;
  wire   n2, n1;

  DFFRQX2M stp_error_reg ( .D(n2), .CK(CLK), .RN(RST), .Q(stp_error) );
  OAI2BB2X1M U2 ( .B0(sampled_bit), .B1(n1), .A0N(stp_error), .A1N(n1), .Y(n2)
         );
  INVX2M U3 ( .A(stp_chk_en), .Y(n1) );
endmodule


module UART_RX_DATA_WIDTH8 ( CLK, RST, RX_IN, PAR_EN, PAR_TYP, Prescale, 
        P_DATA, data_valid, par_error, strt_glitch, stp_error );
  input [5:0] Prescale;
  output [7:0] P_DATA;
  input CLK, RST, RX_IN, PAR_EN, PAR_TYP;
  output data_valid, par_error, strt_glitch, stp_error;
  wire   bit_done, data_samp_en, enable, par_chk_en, strt_chk_en, stp_chk_en,
         deser_en, sampled_bit, n1, n2;
  wire   [3:0] bit_cnt;
  wire   [5:0] edge_cnt;

  FSM_RX fsm_inst ( .CLK(CLK), .RST(n1), .RX_IN(RX_IN), .PAR_EN(PAR_EN), 
        .bit_done(bit_done), .bit_cnt(bit_cnt), .edge_cnt(edge_cnt), 
        .par_error(par_error), .strt_glitch(strt_glitch), .stp_error(stp_error), .data_samp_en(data_samp_en), .enable(enable), .par_chk_en(par_chk_en), 
        .strt_chk_en(strt_chk_en), .stp_chk_en(stp_chk_en), .deser_en(deser_en), .data_valid(data_valid) );
  edge_bit_count counter_inst ( .CLK(CLK), .RST(n1), .enable(enable), 
        .Prescale(Prescale), .edge_cnt(edge_cnt), .bit_cnt(bit_cnt), 
        .bit_done(bit_done) );
  data_sampling sampling_inst ( .CLK(CLK), .RST(n1), .RX_IN(RX_IN), 
        .data_samp_en(data_samp_en), .Prescale(Prescale), .edge_cnt(edge_cnt), 
        .sampled_bit(sampled_bit) );
  deserializer_DATA_WIDTH8 deser_inst ( .CLK(CLK), .RST(n1), .deser_en(
        deser_en), .sampled_bit(sampled_bit), .P_DATA(P_DATA) );
  parity_check_DATA_WIDTH8 par_chk ( .CLK(CLK), .RST(n1), .P_DATA(P_DATA), 
        .PAR_TYP(PAR_TYP), .par_chk_en(par_chk_en), .sampled_bit(sampled_bit), 
        .par_error(par_error) );
  start_check strt_chk ( .CLK(CLK), .RST(n1), .strt_chk_en(strt_chk_en), 
        .sampled_bit(sampled_bit), .strt_glitch(strt_glitch) );
  stop_check stp_chk ( .CLK(CLK), .RST(n1), .stp_chk_en(stp_chk_en), 
        .sampled_bit(sampled_bit), .stp_error(stp_error) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module UART_DATA_WIDTH8 ( TX_CLK, RX_CLK, RST, PAR_TYP, PAR_EN, Prescale, 
        TX_IN_P, TX_IN_V, RX_IN_S, TX_OUT_S, TX_OUT_V, RX_OUT_V, RX_OUT_P, 
        parity_error, framing_error );
  input [5:0] Prescale;
  input [7:0] TX_IN_P;
  output [7:0] RX_OUT_P;
  input TX_CLK, RX_CLK, RST, PAR_TYP, PAR_EN, TX_IN_V, RX_IN_S;
  output TX_OUT_S, TX_OUT_V, RX_OUT_V, parity_error, framing_error;
  wire   n1, n2;

  UART_TX_DATA_WIDTH8 UART_TX_inst ( .P_DATA(TX_IN_P), .PAR_EN(PAR_EN), 
        .Data_Valid(TX_IN_V), .PAR_TYP(PAR_TYP), .CLK(TX_CLK), .RST(n1), 
        .TX_OUT(TX_OUT_S), .busy(TX_OUT_V) );
  UART_RX_DATA_WIDTH8 UART_RX_inst ( .CLK(RX_CLK), .RST(n1), .RX_IN(RX_IN_S), 
        .PAR_EN(PAR_EN), .PAR_TYP(PAR_TYP), .Prescale(Prescale), .P_DATA(
        RX_OUT_P), .data_valid(RX_OUT_V), .par_error(parity_error), 
        .stp_error(framing_error) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module RegFile_WIDTH8_DEPTH8_ADDR4 ( clk, rst, Address, WrData, WrEn, RdEn, 
        RdData, RdData_valid, REG0, REG1, REG2, REG3 );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input clk, rst, WrEn, RdEn;
  output RdData_valid;
  wire   N11, N12, N13, \regArr[7][7] , \regArr[7][6] , \regArr[7][5] ,
         \regArr[7][4] , \regArr[7][3] , \regArr[7][2] , \regArr[7][1] ,
         \regArr[7][0] , \regArr[6][7] , \regArr[6][6] , \regArr[6][5] ,
         \regArr[6][4] , \regArr[6][3] , \regArr[6][2] , \regArr[6][1] ,
         \regArr[6][0] , \regArr[5][7] , \regArr[5][6] , \regArr[5][5] ,
         \regArr[5][4] , \regArr[5][3] , \regArr[5][2] , \regArr[5][1] ,
         \regArr[5][0] , \regArr[4][7] , \regArr[4][6] , \regArr[4][5] ,
         \regArr[4][4] , \regArr[4][3] , \regArr[4][2] , \regArr[4][1] ,
         \regArr[4][0] , N27, N28, N29, N30, N31, N32, N33, N34, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];

  DFFSQX2M \regArr_reg[3][5]  ( .D(n64), .CK(clk), .SN(n112), .Q(REG3[5]) );
  DFFRQX2M \regArr_reg[5][7]  ( .D(n82), .CK(clk), .RN(n115), .Q(
        \regArr[5][7] ) );
  DFFRQX2M \regArr_reg[5][6]  ( .D(n81), .CK(clk), .RN(n115), .Q(
        \regArr[5][6] ) );
  DFFRQX2M \regArr_reg[5][5]  ( .D(n80), .CK(clk), .RN(n115), .Q(
        \regArr[5][5] ) );
  DFFRQX2M \regArr_reg[5][4]  ( .D(n79), .CK(clk), .RN(n115), .Q(
        \regArr[5][4] ) );
  DFFRQX2M \regArr_reg[5][3]  ( .D(n78), .CK(clk), .RN(n115), .Q(
        \regArr[5][3] ) );
  DFFRQX2M \regArr_reg[5][2]  ( .D(n77), .CK(clk), .RN(n115), .Q(
        \regArr[5][2] ) );
  DFFRQX2M \regArr_reg[5][1]  ( .D(n76), .CK(clk), .RN(n115), .Q(
        \regArr[5][1] ) );
  DFFRQX2M \regArr_reg[5][0]  ( .D(n75), .CK(clk), .RN(n115), .Q(
        \regArr[5][0] ) );
  DFFRQX2M \regArr_reg[7][7]  ( .D(n98), .CK(clk), .RN(n112), .Q(
        \regArr[7][7] ) );
  DFFRQX2M \regArr_reg[7][6]  ( .D(n97), .CK(clk), .RN(n116), .Q(
        \regArr[7][6] ) );
  DFFRQX2M \regArr_reg[7][5]  ( .D(n96), .CK(clk), .RN(n116), .Q(
        \regArr[7][5] ) );
  DFFRQX2M \regArr_reg[7][4]  ( .D(n95), .CK(clk), .RN(n116), .Q(
        \regArr[7][4] ) );
  DFFRQX2M \regArr_reg[7][3]  ( .D(n94), .CK(clk), .RN(n116), .Q(
        \regArr[7][3] ) );
  DFFRQX2M \regArr_reg[7][2]  ( .D(n93), .CK(clk), .RN(n116), .Q(
        \regArr[7][2] ) );
  DFFRQX2M \regArr_reg[7][1]  ( .D(n92), .CK(clk), .RN(n116), .Q(
        \regArr[7][1] ) );
  DFFRQX2M \regArr_reg[7][0]  ( .D(n91), .CK(clk), .RN(n116), .Q(
        \regArr[7][0] ) );
  DFFRQX2M \regArr_reg[6][7]  ( .D(n90), .CK(clk), .RN(n116), .Q(
        \regArr[6][7] ) );
  DFFRQX2M \regArr_reg[6][6]  ( .D(n89), .CK(clk), .RN(n116), .Q(
        \regArr[6][6] ) );
  DFFRQX2M \regArr_reg[6][5]  ( .D(n88), .CK(clk), .RN(n116), .Q(
        \regArr[6][5] ) );
  DFFRQX2M \regArr_reg[6][4]  ( .D(n87), .CK(clk), .RN(n116), .Q(
        \regArr[6][4] ) );
  DFFRQX2M \regArr_reg[6][3]  ( .D(n86), .CK(clk), .RN(n116), .Q(
        \regArr[6][3] ) );
  DFFRQX2M \regArr_reg[6][2]  ( .D(n85), .CK(clk), .RN(n116), .Q(
        \regArr[6][2] ) );
  DFFRQX2M \regArr_reg[6][1]  ( .D(n84), .CK(clk), .RN(n115), .Q(
        \regArr[6][1] ) );
  DFFRQX2M \regArr_reg[6][0]  ( .D(n83), .CK(clk), .RN(n115), .Q(
        \regArr[6][0] ) );
  DFFRQX2M \regArr_reg[4][7]  ( .D(n74), .CK(clk), .RN(n115), .Q(
        \regArr[4][7] ) );
  DFFRQX2M \regArr_reg[4][6]  ( .D(n73), .CK(clk), .RN(n115), .Q(
        \regArr[4][6] ) );
  DFFRQX2M \regArr_reg[4][5]  ( .D(n72), .CK(clk), .RN(n115), .Q(
        \regArr[4][5] ) );
  DFFRQX2M \regArr_reg[4][4]  ( .D(n71), .CK(clk), .RN(n115), .Q(
        \regArr[4][4] ) );
  DFFRQX2M \regArr_reg[4][3]  ( .D(n70), .CK(clk), .RN(n115), .Q(
        \regArr[4][3] ) );
  DFFRQX2M \regArr_reg[4][2]  ( .D(n69), .CK(clk), .RN(n114), .Q(
        \regArr[4][2] ) );
  DFFRQX2M \regArr_reg[4][1]  ( .D(n68), .CK(clk), .RN(n114), .Q(
        \regArr[4][1] ) );
  DFFRQX2M \regArr_reg[4][0]  ( .D(n67), .CK(clk), .RN(n114), .Q(
        \regArr[4][0] ) );
  DFFRQX2M \RdData_reg[7]  ( .D(n34), .CK(clk), .RN(n112), .Q(RdData[7]) );
  DFFRQX2M \RdData_reg[6]  ( .D(n33), .CK(clk), .RN(n112), .Q(RdData[6]) );
  DFFRQX2M \RdData_reg[5]  ( .D(n32), .CK(clk), .RN(n112), .Q(RdData[5]) );
  DFFRQX2M \RdData_reg[4]  ( .D(n31), .CK(clk), .RN(n112), .Q(RdData[4]) );
  DFFRQX2M \RdData_reg[3]  ( .D(n30), .CK(clk), .RN(n112), .Q(RdData[3]) );
  DFFRQX2M \RdData_reg[2]  ( .D(n29), .CK(clk), .RN(n112), .Q(RdData[2]) );
  DFFRQX2M \RdData_reg[1]  ( .D(n28), .CK(clk), .RN(n112), .Q(RdData[1]) );
  DFFRQX2M \RdData_reg[0]  ( .D(n27), .CK(clk), .RN(n112), .Q(RdData[0]) );
  DFFRQX2M \regArr_reg[3][2]  ( .D(n61), .CK(clk), .RN(n114), .Q(REG3[2]) );
  DFFRQX2M \regArr_reg[3][3]  ( .D(n62), .CK(clk), .RN(n114), .Q(REG3[3]) );
  DFFRQX2M \regArr_reg[3][4]  ( .D(n63), .CK(clk), .RN(n114), .Q(REG3[4]) );
  DFFRQX2M \regArr_reg[3][7]  ( .D(n66), .CK(clk), .RN(n114), .Q(REG3[7]) );
  DFFRQX2M \regArr_reg[3][6]  ( .D(n65), .CK(clk), .RN(n114), .Q(REG3[6]) );
  DFFRQX2M \regArr_reg[3][0]  ( .D(n59), .CK(clk), .RN(n114), .Q(REG3[0]) );
  DFFRQX2M \regArr_reg[2][1]  ( .D(n52), .CK(clk), .RN(n113), .Q(REG2[1]) );
  DFFRQX2M \regArr_reg[3][1]  ( .D(n60), .CK(clk), .RN(n114), .Q(REG3[1]) );
  DFFSQX2M \regArr_reg[2][0]  ( .D(n51), .CK(clk), .SN(n112), .Q(REG2[0]) );
  DFFRQX2M \regArr_reg[2][4]  ( .D(n55), .CK(clk), .RN(n114), .Q(REG2[4]) );
  DFFRQX2M \regArr_reg[2][2]  ( .D(n53), .CK(clk), .RN(n113), .Q(REG2[2]) );
  DFFRQX2M \regArr_reg[2][3]  ( .D(n54), .CK(clk), .RN(n114), .Q(REG2[3]) );
  DFFSQX2M \regArr_reg[2][7]  ( .D(n58), .CK(clk), .SN(n112), .Q(REG2[7]) );
  DFFRQX2M \regArr_reg[2][5]  ( .D(n56), .CK(clk), .RN(n114), .Q(REG2[5]) );
  DFFRQX2M \regArr_reg[2][6]  ( .D(n57), .CK(clk), .RN(n114), .Q(REG2[6]) );
  DFFRQX2M RdData_valid_reg ( .D(n26), .CK(clk), .RN(n114), .Q(RdData_valid)
         );
  DFFRQX2M \regArr_reg[0][1]  ( .D(n36), .CK(clk), .RN(n112), .Q(REG0[1]) );
  DFFRQX2M \regArr_reg[0][0]  ( .D(n35), .CK(clk), .RN(n112), .Q(REG0[0]) );
  DFFRQX2M \regArr_reg[0][2]  ( .D(n37), .CK(clk), .RN(n112), .Q(REG0[2]) );
  DFFRQX2M \regArr_reg[0][3]  ( .D(n38), .CK(clk), .RN(n113), .Q(REG0[3]) );
  DFFRQX2M \regArr_reg[0][4]  ( .D(n39), .CK(clk), .RN(n113), .Q(REG0[4]) );
  DFFRQX2M \regArr_reg[0][5]  ( .D(n40), .CK(clk), .RN(n113), .Q(REG0[5]) );
  DFFRQX2M \regArr_reg[0][7]  ( .D(n42), .CK(clk), .RN(n113), .Q(REG0[7]) );
  DFFRQX2M \regArr_reg[0][6]  ( .D(n41), .CK(clk), .RN(n113), .Q(REG0[6]) );
  DFFRQX2M \regArr_reg[1][7]  ( .D(n50), .CK(clk), .RN(n113), .Q(REG1[7]) );
  DFFRQX2M \regArr_reg[1][6]  ( .D(n49), .CK(clk), .RN(n113), .Q(REG1[6]) );
  DFFRQX2M \regArr_reg[1][1]  ( .D(n44), .CK(clk), .RN(n113), .Q(REG1[1]) );
  DFFRQX2M \regArr_reg[1][4]  ( .D(n47), .CK(clk), .RN(n113), .Q(REG1[4]) );
  DFFRQX2M \regArr_reg[1][5]  ( .D(n48), .CK(clk), .RN(n113), .Q(REG1[5]) );
  DFFRQX2M \regArr_reg[1][2]  ( .D(n45), .CK(clk), .RN(n113), .Q(REG1[2]) );
  DFFRQX2M \regArr_reg[1][3]  ( .D(n46), .CK(clk), .RN(n113), .Q(REG1[3]) );
  DFFRQX2M \regArr_reg[1][0]  ( .D(n43), .CK(clk), .RN(n113), .Q(REG1[0]) );
  INVX2M U3 ( .A(n14), .Y(n117) );
  NAND3X2M U4 ( .A(n127), .B(n128), .C(n22), .Y(n21) );
  NAND3X2M U5 ( .A(n127), .B(n128), .C(n16), .Y(n15) );
  NOR2X2M U6 ( .A(n118), .B(RdEn), .Y(n13) );
  INVX2M U7 ( .A(WrEn), .Y(n118) );
  NAND2X2M U8 ( .A(RdEn), .B(n118), .Y(n14) );
  BUFX2M U9 ( .A(n110), .Y(n112) );
  BUFX2M U10 ( .A(n110), .Y(n113) );
  BUFX2M U11 ( .A(n110), .Y(n114) );
  BUFX2M U12 ( .A(n111), .Y(n115) );
  BUFX2M U13 ( .A(n111), .Y(n116) );
  BUFX4M U14 ( .A(N11), .Y(n103) );
  NOR2BX2M U15 ( .AN(n20), .B(N13), .Y(n16) );
  INVX2M U16 ( .A(N11), .Y(n127) );
  INVX2M U17 ( .A(N12), .Y(n128) );
  BUFX2M U18 ( .A(n19), .Y(n107) );
  NAND3X2M U19 ( .A(N11), .B(n16), .C(N12), .Y(n19) );
  BUFX2M U20 ( .A(n25), .Y(n104) );
  NAND3X2M U21 ( .A(N12), .B(N11), .C(n22), .Y(n25) );
  AND2X2M U22 ( .A(N13), .B(n20), .Y(n22) );
  BUFX2M U23 ( .A(n17), .Y(n109) );
  NAND3X2M U24 ( .A(n16), .B(n128), .C(N11), .Y(n17) );
  BUFX2M U25 ( .A(n23), .Y(n106) );
  NAND3X2M U26 ( .A(N11), .B(n128), .C(n22), .Y(n23) );
  BUFX2M U27 ( .A(n18), .Y(n108) );
  NAND3X2M U28 ( .A(n16), .B(n127), .C(N12), .Y(n18) );
  BUFX2M U29 ( .A(n24), .Y(n105) );
  NAND3X2M U30 ( .A(N12), .B(n127), .C(n22), .Y(n24) );
  BUFX2M U31 ( .A(rst), .Y(n110) );
  BUFX2M U32 ( .A(rst), .Y(n111) );
  AO22X1M U33 ( .A0(N34), .A1(n117), .B0(RdData[0]), .B1(n14), .Y(n27) );
  MX2X2M U34 ( .A(n2), .B(n1), .S0(N13), .Y(N34) );
  MX4X1M U35 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(n103), 
        .S1(N12), .Y(n2) );
  MX4X1M U36 ( .A(\regArr[4][0] ), .B(\regArr[5][0] ), .C(\regArr[6][0] ), .D(
        \regArr[7][0] ), .S0(n103), .S1(N12), .Y(n1) );
  AO22X1M U37 ( .A0(N33), .A1(n117), .B0(RdData[1]), .B1(n14), .Y(n28) );
  MX2X2M U38 ( .A(n4), .B(n3), .S0(N13), .Y(N33) );
  MX4X1M U39 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n103), 
        .S1(N12), .Y(n4) );
  MX4X1M U40 ( .A(\regArr[4][1] ), .B(\regArr[5][1] ), .C(\regArr[6][1] ), .D(
        \regArr[7][1] ), .S0(n103), .S1(N12), .Y(n3) );
  AO22X1M U41 ( .A0(N32), .A1(n117), .B0(RdData[2]), .B1(n14), .Y(n29) );
  MX2X2M U42 ( .A(n6), .B(n5), .S0(N13), .Y(N32) );
  MX4X1M U43 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n103), 
        .S1(N12), .Y(n6) );
  MX4X1M U44 ( .A(\regArr[4][2] ), .B(\regArr[5][2] ), .C(\regArr[6][2] ), .D(
        \regArr[7][2] ), .S0(n103), .S1(N12), .Y(n5) );
  AO22X1M U45 ( .A0(N31), .A1(n117), .B0(RdData[3]), .B1(n14), .Y(n30) );
  MX2X2M U46 ( .A(n8), .B(n7), .S0(N13), .Y(N31) );
  MX4X1M U47 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n103), 
        .S1(N12), .Y(n8) );
  MX4X1M U48 ( .A(\regArr[4][3] ), .B(\regArr[5][3] ), .C(\regArr[6][3] ), .D(
        \regArr[7][3] ), .S0(n103), .S1(N12), .Y(n7) );
  AO22X1M U49 ( .A0(N30), .A1(n117), .B0(RdData[4]), .B1(n14), .Y(n31) );
  MX2X2M U50 ( .A(n10), .B(n9), .S0(N13), .Y(N30) );
  MX4X1M U51 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n103), 
        .S1(N12), .Y(n10) );
  MX4X1M U52 ( .A(\regArr[4][4] ), .B(\regArr[5][4] ), .C(\regArr[6][4] ), .D(
        \regArr[7][4] ), .S0(n103), .S1(N12), .Y(n9) );
  AO22X1M U53 ( .A0(N29), .A1(n117), .B0(RdData[5]), .B1(n14), .Y(n32) );
  MX2X2M U54 ( .A(n12), .B(n11), .S0(N13), .Y(N29) );
  MX4X1M U55 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n103), 
        .S1(N12), .Y(n12) );
  MX4X1M U56 ( .A(\regArr[4][5] ), .B(\regArr[5][5] ), .C(\regArr[6][5] ), .D(
        \regArr[7][5] ), .S0(n103), .S1(N12), .Y(n11) );
  AO22X1M U57 ( .A0(N28), .A1(n117), .B0(RdData[6]), .B1(n14), .Y(n33) );
  MX2X2M U58 ( .A(n100), .B(n99), .S0(N13), .Y(N28) );
  MX4X1M U59 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n103), 
        .S1(N12), .Y(n100) );
  MX4X1M U60 ( .A(\regArr[4][6] ), .B(\regArr[5][6] ), .C(\regArr[6][6] ), .D(
        \regArr[7][6] ), .S0(n103), .S1(N12), .Y(n99) );
  AO22X1M U61 ( .A0(N27), .A1(n117), .B0(RdData[7]), .B1(n14), .Y(n34) );
  MX2X2M U62 ( .A(n102), .B(n101), .S0(N13), .Y(N27) );
  MX4X1M U63 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n103), 
        .S1(N12), .Y(n102) );
  MX4X1M U64 ( .A(\regArr[4][7] ), .B(\regArr[5][7] ), .C(\regArr[6][7] ), .D(
        \regArr[7][7] ), .S0(n103), .S1(N12), .Y(n101) );
  OAI2BB2X1M U65 ( .B0(n15), .B1(n119), .A0N(REG0[0]), .A1N(n15), .Y(n35) );
  OAI2BB2X1M U66 ( .B0(n15), .B1(n120), .A0N(REG0[1]), .A1N(n15), .Y(n36) );
  OAI2BB2X1M U67 ( .B0(n15), .B1(n121), .A0N(REG0[2]), .A1N(n15), .Y(n37) );
  OAI2BB2X1M U68 ( .B0(n15), .B1(n122), .A0N(REG0[3]), .A1N(n15), .Y(n38) );
  OAI2BB2X1M U69 ( .B0(n15), .B1(n123), .A0N(REG0[4]), .A1N(n15), .Y(n39) );
  OAI2BB2X1M U70 ( .B0(n15), .B1(n124), .A0N(REG0[5]), .A1N(n15), .Y(n40) );
  OAI2BB2X1M U71 ( .B0(n15), .B1(n125), .A0N(REG0[6]), .A1N(n15), .Y(n41) );
  OAI2BB2X1M U72 ( .B0(n15), .B1(n126), .A0N(REG0[7]), .A1N(n15), .Y(n42) );
  OAI2BB2X1M U73 ( .B0(n119), .B1(n21), .A0N(\regArr[4][0] ), .A1N(n21), .Y(
        n67) );
  OAI2BB2X1M U74 ( .B0(n120), .B1(n21), .A0N(\regArr[4][1] ), .A1N(n21), .Y(
        n68) );
  OAI2BB2X1M U75 ( .B0(n121), .B1(n21), .A0N(\regArr[4][2] ), .A1N(n21), .Y(
        n69) );
  OAI2BB2X1M U76 ( .B0(n122), .B1(n21), .A0N(\regArr[4][3] ), .A1N(n21), .Y(
        n70) );
  OAI2BB2X1M U77 ( .B0(n123), .B1(n21), .A0N(\regArr[4][4] ), .A1N(n21), .Y(
        n71) );
  OAI2BB2X1M U78 ( .B0(n124), .B1(n21), .A0N(\regArr[4][5] ), .A1N(n21), .Y(
        n72) );
  OAI2BB2X1M U79 ( .B0(n125), .B1(n21), .A0N(\regArr[4][6] ), .A1N(n21), .Y(
        n73) );
  OAI2BB2X1M U80 ( .B0(n126), .B1(n21), .A0N(\regArr[4][7] ), .A1N(n21), .Y(
        n74) );
  OAI2BB2X1M U81 ( .B0(n119), .B1(n109), .A0N(REG1[0]), .A1N(n109), .Y(n43) );
  OAI2BB2X1M U82 ( .B0(n120), .B1(n109), .A0N(REG1[1]), .A1N(n109), .Y(n44) );
  OAI2BB2X1M U83 ( .B0(n121), .B1(n109), .A0N(REG1[2]), .A1N(n109), .Y(n45) );
  OAI2BB2X1M U84 ( .B0(n122), .B1(n109), .A0N(REG1[3]), .A1N(n109), .Y(n46) );
  OAI2BB2X1M U85 ( .B0(n123), .B1(n109), .A0N(REG1[4]), .A1N(n109), .Y(n47) );
  OAI2BB2X1M U86 ( .B0(n124), .B1(n109), .A0N(REG1[5]), .A1N(n109), .Y(n48) );
  OAI2BB2X1M U87 ( .B0(n125), .B1(n109), .A0N(REG1[6]), .A1N(n109), .Y(n49) );
  OAI2BB2X1M U88 ( .B0(n126), .B1(n109), .A0N(REG1[7]), .A1N(n109), .Y(n50) );
  OAI2BB2X1M U89 ( .B0(n120), .B1(n108), .A0N(REG2[1]), .A1N(n108), .Y(n52) );
  OAI2BB2X1M U90 ( .B0(n121), .B1(n108), .A0N(REG2[2]), .A1N(n108), .Y(n53) );
  OAI2BB2X1M U91 ( .B0(n122), .B1(n108), .A0N(REG2[3]), .A1N(n108), .Y(n54) );
  OAI2BB2X1M U92 ( .B0(n123), .B1(n108), .A0N(REG2[4]), .A1N(n108), .Y(n55) );
  OAI2BB2X1M U93 ( .B0(n124), .B1(n108), .A0N(REG2[5]), .A1N(n108), .Y(n56) );
  OAI2BB2X1M U94 ( .B0(n125), .B1(n108), .A0N(REG2[6]), .A1N(n108), .Y(n57) );
  OAI2BB2X1M U95 ( .B0(n119), .B1(n107), .A0N(REG3[0]), .A1N(n107), .Y(n59) );
  OAI2BB2X1M U96 ( .B0(n120), .B1(n107), .A0N(REG3[1]), .A1N(n107), .Y(n60) );
  OAI2BB2X1M U97 ( .B0(n121), .B1(n107), .A0N(REG3[2]), .A1N(n107), .Y(n61) );
  OAI2BB2X1M U98 ( .B0(n122), .B1(n107), .A0N(REG3[3]), .A1N(n107), .Y(n62) );
  OAI2BB2X1M U99 ( .B0(n123), .B1(n107), .A0N(REG3[4]), .A1N(n107), .Y(n63) );
  OAI2BB2X1M U100 ( .B0(n125), .B1(n107), .A0N(REG3[6]), .A1N(n107), .Y(n65)
         );
  OAI2BB2X1M U101 ( .B0(n126), .B1(n107), .A0N(REG3[7]), .A1N(n107), .Y(n66)
         );
  OAI2BB2X1M U102 ( .B0(n119), .B1(n106), .A0N(\regArr[5][0] ), .A1N(n106), 
        .Y(n75) );
  OAI2BB2X1M U103 ( .B0(n120), .B1(n106), .A0N(\regArr[5][1] ), .A1N(n106), 
        .Y(n76) );
  OAI2BB2X1M U104 ( .B0(n121), .B1(n106), .A0N(\regArr[5][2] ), .A1N(n106), 
        .Y(n77) );
  OAI2BB2X1M U105 ( .B0(n122), .B1(n106), .A0N(\regArr[5][3] ), .A1N(n106), 
        .Y(n78) );
  OAI2BB2X1M U106 ( .B0(n123), .B1(n106), .A0N(\regArr[5][4] ), .A1N(n106), 
        .Y(n79) );
  OAI2BB2X1M U107 ( .B0(n124), .B1(n106), .A0N(\regArr[5][5] ), .A1N(n106), 
        .Y(n80) );
  OAI2BB2X1M U108 ( .B0(n125), .B1(n106), .A0N(\regArr[5][6] ), .A1N(n106), 
        .Y(n81) );
  OAI2BB2X1M U109 ( .B0(n126), .B1(n106), .A0N(\regArr[5][7] ), .A1N(n106), 
        .Y(n82) );
  OAI2BB2X1M U110 ( .B0(n119), .B1(n105), .A0N(\regArr[6][0] ), .A1N(n105), 
        .Y(n83) );
  OAI2BB2X1M U111 ( .B0(n120), .B1(n105), .A0N(\regArr[6][1] ), .A1N(n105), 
        .Y(n84) );
  OAI2BB2X1M U112 ( .B0(n121), .B1(n105), .A0N(\regArr[6][2] ), .A1N(n105), 
        .Y(n85) );
  OAI2BB2X1M U113 ( .B0(n122), .B1(n105), .A0N(\regArr[6][3] ), .A1N(n105), 
        .Y(n86) );
  OAI2BB2X1M U114 ( .B0(n123), .B1(n105), .A0N(\regArr[6][4] ), .A1N(n105), 
        .Y(n87) );
  OAI2BB2X1M U115 ( .B0(n124), .B1(n105), .A0N(\regArr[6][5] ), .A1N(n105), 
        .Y(n88) );
  OAI2BB2X1M U116 ( .B0(n125), .B1(n105), .A0N(\regArr[6][6] ), .A1N(n105), 
        .Y(n89) );
  OAI2BB2X1M U117 ( .B0(n126), .B1(n105), .A0N(\regArr[6][7] ), .A1N(n105), 
        .Y(n90) );
  OAI2BB2X1M U118 ( .B0(n119), .B1(n104), .A0N(\regArr[7][0] ), .A1N(n104), 
        .Y(n91) );
  OAI2BB2X1M U119 ( .B0(n120), .B1(n104), .A0N(\regArr[7][1] ), .A1N(n104), 
        .Y(n92) );
  OAI2BB2X1M U120 ( .B0(n121), .B1(n104), .A0N(\regArr[7][2] ), .A1N(n104), 
        .Y(n93) );
  OAI2BB2X1M U121 ( .B0(n122), .B1(n104), .A0N(\regArr[7][3] ), .A1N(n104), 
        .Y(n94) );
  OAI2BB2X1M U122 ( .B0(n123), .B1(n104), .A0N(\regArr[7][4] ), .A1N(n104), 
        .Y(n95) );
  OAI2BB2X1M U123 ( .B0(n124), .B1(n104), .A0N(\regArr[7][5] ), .A1N(n104), 
        .Y(n96) );
  OAI2BB2X1M U124 ( .B0(n125), .B1(n104), .A0N(\regArr[7][6] ), .A1N(n104), 
        .Y(n97) );
  OAI2BB2X1M U125 ( .B0(n126), .B1(n104), .A0N(\regArr[7][7] ), .A1N(n104), 
        .Y(n98) );
  OAI2BB2X1M U126 ( .B0(n119), .B1(n108), .A0N(REG2[0]), .A1N(n108), .Y(n51)
         );
  OAI2BB2X1M U127 ( .B0(n126), .B1(n108), .A0N(REG2[7]), .A1N(n108), .Y(n58)
         );
  OAI2BB2X1M U128 ( .B0(n124), .B1(n107), .A0N(REG3[5]), .A1N(n107), .Y(n64)
         );
  NOR2BX2M U129 ( .AN(n13), .B(Address[3]), .Y(n20) );
  INVX2M U130 ( .A(WrData[0]), .Y(n119) );
  INVX2M U131 ( .A(WrData[1]), .Y(n120) );
  INVX2M U132 ( .A(WrData[2]), .Y(n121) );
  INVX2M U133 ( .A(WrData[3]), .Y(n122) );
  INVX2M U134 ( .A(WrData[4]), .Y(n123) );
  INVX2M U135 ( .A(WrData[5]), .Y(n124) );
  INVX2M U136 ( .A(WrData[6]), .Y(n125) );
  INVX2M U137 ( .A(WrData[7]), .Y(n126) );
  OAI2B1X2M U138 ( .A1N(RdData_valid), .A0(n13), .B0(n14), .Y(n26) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW_div_uns_0 ( a, b, quotient, remainder, 
        divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;

  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n13), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n15), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n16), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n17), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n14), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n11), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n17), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n16), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n17), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n17), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n17), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n17), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n17), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n13), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n12), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n15), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n14), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n14), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n13), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n15), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n16), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n14), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n15), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n15), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n16), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n16), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n16), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n12), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  INVX2M U1 ( .A(b[0]), .Y(n18) );
  XNOR2X2M U2 ( .A(n18), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U3 ( .A(n18), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U4 ( .A(n18), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U5 ( .A(n18), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U6 ( .A(n18), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U7 ( .A(n18), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  XNOR2X2M U8 ( .A(n18), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  OR2X2M U9 ( .A(n18), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  INVX2M U10 ( .A(b[1]), .Y(n17) );
  NAND2X2M U11 ( .A(n3), .B(n4), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U12 ( .A(a[5]), .Y(n4) );
  INVX2M U13 ( .A(n18), .Y(n3) );
  NAND2X2M U14 ( .A(n5), .B(n6), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U15 ( .A(a[4]), .Y(n6) );
  INVX2M U16 ( .A(n18), .Y(n5) );
  NAND2X2M U17 ( .A(n5), .B(n7), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U18 ( .A(a[3]), .Y(n7) );
  NAND2X2M U19 ( .A(n5), .B(n8), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U20 ( .A(a[2]), .Y(n8) );
  NAND2X2M U21 ( .A(n5), .B(n9), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U22 ( .A(a[1]), .Y(n9) );
  NAND2X2M U23 ( .A(n5), .B(n10), .Y(\u_div/CryTmp[0][1] ) );
  NAND2X2M U24 ( .A(n1), .B(n2), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U25 ( .A(a[6]), .Y(n2) );
  INVX2M U26 ( .A(n18), .Y(n1) );
  INVX2M U27 ( .A(b[6]), .Y(n12) );
  INVX2M U28 ( .A(a[0]), .Y(n10) );
  INVX2M U29 ( .A(b[7]), .Y(n11) );
  INVX2M U30 ( .A(b[2]), .Y(n16) );
  INVX2M U31 ( .A(b[3]), .Y(n15) );
  INVX2M U32 ( .A(b[4]), .Y(n14) );
  INVX2M U33 ( .A(b[5]), .Y(n13) );
  CLKMX2X2M U34 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U37 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U38 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U39 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U40 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U41 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U46 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U47 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U51 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U52 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U54 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U55 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U56 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U58 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U59 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U60 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U61 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U62 ( .A(\u_div/CryTmp[7][1] ), .B(n19), .C(n17), .D(n16), .Y(
        quotient[7]) );
  AND3X1M U63 ( .A(n19), .B(n16), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X1M U64 ( .A(\u_div/CryTmp[5][3] ), .B(n19), .Y(quotient[5]) );
  AND2X1M U65 ( .A(n20), .B(n15), .Y(n19) );
  AND2X1M U66 ( .A(\u_div/CryTmp[4][4] ), .B(n20), .Y(quotient[4]) );
  AND3X1M U67 ( .A(n21), .B(n14), .C(n13), .Y(n20) );
  AND3X1M U68 ( .A(n21), .B(n13), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  AND2X1M U69 ( .A(\u_div/CryTmp[2][6] ), .B(n21), .Y(quotient[2]) );
  NOR2X1M U70 ( .A(b[6]), .B(b[7]), .Y(n21) );
  AND2X1M U71 ( .A(\u_div/CryTmp[1][7] ), .B(n11), .Y(quotient[1]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  INVX2M U1 ( .A(B[6]), .Y(n3) );
  INVX2M U2 ( .A(B[1]), .Y(n8) );
  NAND2X2M U3 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U4 ( .A(A[0]), .Y(n1) );
  INVX2M U5 ( .A(B[7]), .Y(n2) );
  XNOR2X2M U6 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U7 ( .A(B[0]), .Y(n9) );
  INVX2M U8 ( .A(B[2]), .Y(n7) );
  INVX2M U9 ( .A(B[3]), .Y(n6) );
  INVX2M U10 ( .A(B[4]), .Y(n5) );
  INVX2M U11 ( .A(B[5]), .Y(n4) );
  CLKINVX1M U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n1, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27;

  AOI21BX2M U2 ( .A0(n18), .A1(A[12]), .B0N(n19), .Y(n1) );
  NAND2X2M U3 ( .A(A[7]), .B(B[7]), .Y(n15) );
  XNOR2X2M U4 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  XNOR2X2M U5 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U6 ( .A(B[7]), .Y(n8) );
  INVX2M U7 ( .A(A[6]), .Y(n9) );
  INVX2M U8 ( .A(n9), .Y(SUM[6]) );
  BUFX2M U9 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U10 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U11 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U12 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U13 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U14 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U15 ( .A(n10), .B(n11), .Y(SUM[9]) );
  NOR2X1M U16 ( .A(n12), .B(n13), .Y(n11) );
  CLKXOR2X2M U17 ( .A(n14), .B(n15), .Y(SUM[8]) );
  NAND2BX1M U18 ( .AN(n16), .B(n17), .Y(n14) );
  OAI21X1M U19 ( .A0(A[12]), .A1(n18), .B0(B[12]), .Y(n19) );
  XOR3XLM U20 ( .A(B[12]), .B(A[12]), .C(n18), .Y(SUM[12]) );
  OAI21BX1M U21 ( .A0(n20), .A1(n21), .B0N(n22), .Y(n18) );
  XNOR2X1M U22 ( .A(n21), .B(n23), .Y(SUM[11]) );
  NOR2X1M U23 ( .A(n22), .B(n20), .Y(n23) );
  NOR2X1M U24 ( .A(B[11]), .B(A[11]), .Y(n20) );
  AND2X1M U25 ( .A(B[11]), .B(A[11]), .Y(n22) );
  OA21X1M U26 ( .A0(n24), .A1(n25), .B0(n26), .Y(n21) );
  CLKXOR2X2M U27 ( .A(n27), .B(n25), .Y(SUM[10]) );
  AOI2BB1X1M U28 ( .A0N(n10), .A1N(n13), .B0(n12), .Y(n25) );
  AND2X1M U29 ( .A(B[9]), .B(A[9]), .Y(n12) );
  NOR2X1M U30 ( .A(B[9]), .B(A[9]), .Y(n13) );
  OA21X1M U31 ( .A0(n15), .A1(n16), .B0(n17), .Y(n10) );
  CLKNAND2X2M U32 ( .A(B[8]), .B(A[8]), .Y(n17) );
  NOR2X1M U33 ( .A(B[8]), .B(A[8]), .Y(n16) );
  NAND2BX1M U34 ( .AN(n24), .B(n26), .Y(n27) );
  CLKNAND2X2M U35 ( .A(B[10]), .B(A[10]), .Y(n26) );
  NOR2X1M U36 ( .A(B[10]), .B(A[10]), .Y(n24) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , 
        \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , 
        \A1[3] , \A1[2] , \A1[1] , \A1[0] }), .B({n10, n16, n15, n14, n13, n11, 
        n12, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(
        PRODUCT[15:2]) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n6), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n5), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n9), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n8), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n4), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n3), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n7), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  AND2X2M U2 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][6] ), .Y(n22) );
  INVX2M U11 ( .A(\ab[0][7] ), .Y(n23) );
  CLKXOR2X2M U12 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  CLKXOR2X2M U13 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX2M U14 ( .A(\ab[0][3] ), .Y(n19) );
  INVX2M U15 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U16 ( .A(\ab[0][5] ), .Y(n21) );
  XNOR2X2M U17 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  AND2X2M U18 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n11) );
  AND2X2M U19 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n12) );
  CLKXOR2X2M U20 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U21 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U22 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  CLKXOR2X2M U23 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U24 ( .A(\ab[0][2] ), .Y(n18) );
  AND2X2M U25 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n13) );
  AND2X2M U26 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n14) );
  AND2X2M U27 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n15) );
  XNOR2X2M U28 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U29 ( .A(\SUMB[7][1] ), .Y(n17) );
  AND2X2M U30 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  CLKXOR2X2M U31 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XNOR2X2M U32 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U33 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U34 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U35 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  INVX2M U36 ( .A(A[1]), .Y(n38) );
  INVX2M U37 ( .A(A[0]), .Y(n39) );
  INVX2M U38 ( .A(B[6]), .Y(n25) );
  INVX2M U39 ( .A(B[7]), .Y(n24) );
  XNOR2X2M U40 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U41 ( .A(A[2]), .Y(n37) );
  INVX2M U42 ( .A(A[3]), .Y(n36) );
  INVX2M U43 ( .A(A[4]), .Y(n35) );
  INVX2M U44 ( .A(B[1]), .Y(n30) );
  INVX2M U45 ( .A(A[6]), .Y(n33) );
  INVX2M U46 ( .A(A[7]), .Y(n32) );
  INVX2M U47 ( .A(A[5]), .Y(n34) );
  INVX2M U48 ( .A(B[3]), .Y(n28) );
  INVX2M U49 ( .A(B[5]), .Y(n26) );
  INVX2M U50 ( .A(B[4]), .Y(n27) );
  INVX2M U51 ( .A(B[0]), .Y(n31) );
  INVX2M U52 ( .A(B[2]), .Y(n29) );
  NOR2X1M U54 ( .A(n32), .B(n24), .Y(\ab[7][7] ) );
  NOR2X1M U55 ( .A(n32), .B(n25), .Y(\ab[7][6] ) );
  NOR2X1M U56 ( .A(n32), .B(n26), .Y(\ab[7][5] ) );
  NOR2X1M U57 ( .A(n32), .B(n27), .Y(\ab[7][4] ) );
  NOR2X1M U58 ( .A(n32), .B(n28), .Y(\ab[7][3] ) );
  NOR2X1M U59 ( .A(n32), .B(n29), .Y(\ab[7][2] ) );
  NOR2X1M U60 ( .A(n32), .B(n30), .Y(\ab[7][1] ) );
  NOR2X1M U61 ( .A(n32), .B(n31), .Y(\ab[7][0] ) );
  NOR2X1M U62 ( .A(n24), .B(n33), .Y(\ab[6][7] ) );
  NOR2X1M U63 ( .A(n25), .B(n33), .Y(\ab[6][6] ) );
  NOR2X1M U64 ( .A(n26), .B(n33), .Y(\ab[6][5] ) );
  NOR2X1M U65 ( .A(n27), .B(n33), .Y(\ab[6][4] ) );
  NOR2X1M U66 ( .A(n28), .B(n33), .Y(\ab[6][3] ) );
  NOR2X1M U67 ( .A(n29), .B(n33), .Y(\ab[6][2] ) );
  NOR2X1M U68 ( .A(n30), .B(n33), .Y(\ab[6][1] ) );
  NOR2X1M U69 ( .A(n31), .B(n33), .Y(\ab[6][0] ) );
  NOR2X1M U70 ( .A(n24), .B(n34), .Y(\ab[5][7] ) );
  NOR2X1M U71 ( .A(n25), .B(n34), .Y(\ab[5][6] ) );
  NOR2X1M U72 ( .A(n26), .B(n34), .Y(\ab[5][5] ) );
  NOR2X1M U73 ( .A(n27), .B(n34), .Y(\ab[5][4] ) );
  NOR2X1M U74 ( .A(n28), .B(n34), .Y(\ab[5][3] ) );
  NOR2X1M U75 ( .A(n29), .B(n34), .Y(\ab[5][2] ) );
  NOR2X1M U76 ( .A(n30), .B(n34), .Y(\ab[5][1] ) );
  NOR2X1M U77 ( .A(n31), .B(n34), .Y(\ab[5][0] ) );
  NOR2X1M U78 ( .A(n24), .B(n35), .Y(\ab[4][7] ) );
  NOR2X1M U79 ( .A(n25), .B(n35), .Y(\ab[4][6] ) );
  NOR2X1M U80 ( .A(n26), .B(n35), .Y(\ab[4][5] ) );
  NOR2X1M U81 ( .A(n27), .B(n35), .Y(\ab[4][4] ) );
  NOR2X1M U82 ( .A(n28), .B(n35), .Y(\ab[4][3] ) );
  NOR2X1M U83 ( .A(n29), .B(n35), .Y(\ab[4][2] ) );
  NOR2X1M U84 ( .A(n30), .B(n35), .Y(\ab[4][1] ) );
  NOR2X1M U85 ( .A(n31), .B(n35), .Y(\ab[4][0] ) );
  NOR2X1M U86 ( .A(n24), .B(n36), .Y(\ab[3][7] ) );
  NOR2X1M U87 ( .A(n25), .B(n36), .Y(\ab[3][6] ) );
  NOR2X1M U88 ( .A(n26), .B(n36), .Y(\ab[3][5] ) );
  NOR2X1M U89 ( .A(n27), .B(n36), .Y(\ab[3][4] ) );
  NOR2X1M U90 ( .A(n28), .B(n36), .Y(\ab[3][3] ) );
  NOR2X1M U91 ( .A(n29), .B(n36), .Y(\ab[3][2] ) );
  NOR2X1M U92 ( .A(n30), .B(n36), .Y(\ab[3][1] ) );
  NOR2X1M U93 ( .A(n31), .B(n36), .Y(\ab[3][0] ) );
  NOR2X1M U94 ( .A(n24), .B(n37), .Y(\ab[2][7] ) );
  NOR2X1M U95 ( .A(n25), .B(n37), .Y(\ab[2][6] ) );
  NOR2X1M U96 ( .A(n26), .B(n37), .Y(\ab[2][5] ) );
  NOR2X1M U97 ( .A(n27), .B(n37), .Y(\ab[2][4] ) );
  NOR2X1M U98 ( .A(n28), .B(n37), .Y(\ab[2][3] ) );
  NOR2X1M U99 ( .A(n29), .B(n37), .Y(\ab[2][2] ) );
  NOR2X1M U100 ( .A(n30), .B(n37), .Y(\ab[2][1] ) );
  NOR2X1M U101 ( .A(n31), .B(n37), .Y(\ab[2][0] ) );
  NOR2X1M U102 ( .A(n24), .B(n38), .Y(\ab[1][7] ) );
  NOR2X1M U103 ( .A(n25), .B(n38), .Y(\ab[1][6] ) );
  NOR2X1M U104 ( .A(n26), .B(n38), .Y(\ab[1][5] ) );
  NOR2X1M U105 ( .A(n27), .B(n38), .Y(\ab[1][4] ) );
  NOR2X1M U106 ( .A(n28), .B(n38), .Y(\ab[1][3] ) );
  NOR2X1M U107 ( .A(n29), .B(n38), .Y(\ab[1][2] ) );
  NOR2X1M U108 ( .A(n30), .B(n38), .Y(\ab[1][1] ) );
  NOR2X1M U109 ( .A(n31), .B(n38), .Y(\ab[1][0] ) );
  NOR2X1M U110 ( .A(n24), .B(n39), .Y(\ab[0][7] ) );
  NOR2X1M U111 ( .A(n25), .B(n39), .Y(\ab[0][6] ) );
  NOR2X1M U112 ( .A(n26), .B(n39), .Y(\ab[0][5] ) );
  NOR2X1M U113 ( .A(n27), .B(n39), .Y(\ab[0][4] ) );
  NOR2X1M U114 ( .A(n28), .B(n39), .Y(\ab[0][3] ) );
  NOR2X1M U115 ( .A(n29), .B(n39), .Y(\ab[0][2] ) );
  NOR2X1M U116 ( .A(n30), .B(n39), .Y(\ab[0][1] ) );
  NOR2X1M U117 ( .A(n31), .B(n39), .Y(PRODUCT[0]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16 ( A, B, ALU_FUN, CLK, RST, Enable, ALU_OUT, 
        OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input CLK, RST, Enable;
  output OUT_VALID;
  wire   N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103, N104,
         N105, N106, N107, N108, N109, N110, N111, N112, N113, N114, N115,
         N116, N117, N118, N119, N120, N121, N122, N123, N124, N125, N128,
         N129, N130, N131, N132, N133, N134, N135, N168, N169, N170, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152;
  wire   [15:0] ALU_Comb;

  ALU_OPER_WIDTH8_OUT_WIDTH16_DW_div_uns_0 div_39 ( .a({n15, n14, n13, n12, 
        n11, n10, n9, n8}), .b({n7, n6, B[5:2], n5, B[0]}), .quotient({N135, 
        N134, N133, N132, N131, N130, N129, N128}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_sub_0 sub_37 ( .A({1'b0, n15, n14, n13, n12, 
        n11, n10, n9, n8}), .B({1'b0, n7, n6, B[5:2], n5, B[0]}), .CI(1'b0), 
        .DIFF({N109, N108, N107, N106, N105, N104, N103, N102, N101}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_0 add_36 ( .A({1'b0, n15, n14, n13, n12, 
        n11, n10, n9, n8}), .B({1'b0, n7, n6, B[5:2], n5, B[0]}), .CI(1'b0), 
        .SUM({N100, N99, N98, N97, N96, N95, N94, N93, N92}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW02_mult_0 mult_38 ( .A({n15, n14, n13, n12, 
        n11, n10, n9, n8}), .B({n7, n6, B[5:2], n5, B[0]}), .TC(1'b0), 
        .PRODUCT({N125, N124, N123, N122, N121, N120, N119, N118, N117, N116, 
        N115, N114, N113, N112, N111, N110}) );
  DFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_Comb[15]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[15]) );
  DFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_Comb[14]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[14]) );
  DFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_Comb[13]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[13]) );
  DFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_Comb[12]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[12]) );
  DFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_Comb[11]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[11]) );
  DFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_Comb[10]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[10]) );
  DFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_Comb[9]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[9]) );
  DFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_Comb[8]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[8]) );
  DFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_Comb[7]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_Comb[6]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_Comb[5]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_Comb[4]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_Comb[3]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_Comb[2]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[2]) );
  DFFRQX2M \ALU_OUT_reg[1]  ( .D(ALU_Comb[1]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[1]) );
  DFFRQX2M \ALU_OUT_reg[0]  ( .D(ALU_Comb[0]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[0]) );
  DFFRQX2M OUT_VALID_reg ( .D(Enable), .CK(CLK), .RN(RST), .Q(OUT_VALID) );
  NOR3BX2M U3 ( .AN(n4), .B(n139), .C(n112), .Y(n57) );
  NOR3BX2M U4 ( .AN(n4), .B(n101), .C(ALU_FUN[0]), .Y(n39) );
  NOR3X2M U5 ( .A(n3), .B(ALU_FUN[2]), .C(n142), .Y(n40) );
  BUFX2M U8 ( .A(A[7]), .Y(n15) );
  BUFX2M U9 ( .A(A[6]), .Y(n14) );
  BUFX2M U10 ( .A(A[1]), .Y(n9) );
  OAI2BB1X2M U11 ( .A0N(N124), .A1N(n35), .B0(n36), .Y(ALU_Comb[14]) );
  OAI2BB1X2M U12 ( .A0N(N125), .A1N(n35), .B0(n36), .Y(ALU_Comb[15]) );
  OAI2BB1X2M U13 ( .A0N(N121), .A1N(n35), .B0(n36), .Y(ALU_Comb[11]) );
  OAI2BB1X2M U14 ( .A0N(N122), .A1N(n35), .B0(n36), .Y(ALU_Comb[12]) );
  OAI2BB1X2M U15 ( .A0N(N123), .A1N(n35), .B0(n36), .Y(ALU_Comb[13]) );
  INVX2M U16 ( .A(n97), .Y(n138) );
  INVX2M U17 ( .A(n47), .Y(n137) );
  OAI2BB1X2M U18 ( .A0N(N119), .A1N(n35), .B0(n36), .Y(ALU_Comb[9]) );
  OAI2BB1X2M U19 ( .A0N(N120), .A1N(n35), .B0(n36), .Y(ALU_Comb[10]) );
  NAND2X2M U20 ( .A(Enable), .B(n42), .Y(n36) );
  INVX2M U21 ( .A(n53), .Y(n140) );
  INVX2M U22 ( .A(n102), .Y(n136) );
  INVX2M U23 ( .A(Enable), .Y(n133) );
  OAI21X2M U24 ( .A0(n3), .A1(n112), .B0(n111), .Y(n52) );
  OAI2B1X2M U25 ( .A1N(n110), .A0(n101), .B0(n111), .Y(n97) );
  OAI2BB2X1M U26 ( .B0(n146), .B1(n47), .A0N(N117), .A1N(n40), .Y(n46) );
  NAND2X2M U27 ( .A(n141), .B(n110), .Y(n47) );
  INVX2M U28 ( .A(n112), .Y(n141) );
  INVX2M U29 ( .A(n50), .Y(n135) );
  OAI2B11X2M U30 ( .A1N(N109), .A0(n102), .B0(n140), .C0(n138), .Y(n42) );
  NOR2X2M U31 ( .A(n101), .B(n3), .Y(n53) );
  NOR2BX2M U32 ( .AN(n113), .B(n3), .Y(n41) );
  NAND2X2M U33 ( .A(n113), .B(n110), .Y(n102) );
  NOR2BX2M U34 ( .AN(n40), .B(n133), .Y(n35) );
  AOI31X2M U35 ( .A0(n103), .A1(n104), .A2(n105), .B0(n133), .Y(ALU_Comb[0])
         );
  AOI22X1M U36 ( .A0(N101), .A1(n136), .B0(N92), .B1(n41), .Y(n103) );
  AOI222X1M U37 ( .A0(N110), .A1(n40), .B0(n53), .B1(n152), .C0(n8), .C1(n137), 
        .Y(n104) );
  AOI211X2M U38 ( .A0(n9), .A1(n57), .B0(n106), .C0(n107), .Y(n105) );
  OAI2BB1X2M U39 ( .A0N(N128), .A1N(n48), .B0(n114), .Y(n106) );
  AOI31X2M U40 ( .A0(N168), .A1(n4), .A2(n115), .B0(n100), .Y(n114) );
  NOR3X2M U41 ( .A(n142), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n115) );
  AOI31X2M U42 ( .A0(n90), .A1(n91), .A2(n92), .B0(n133), .Y(ALU_Comb[1]) );
  AOI222X1M U43 ( .A0(N93), .A1(n41), .B0(N111), .B1(n40), .C0(N102), .C1(n136), .Y(n90) );
  AOI222X1M U44 ( .A0(n9), .A1(n137), .B0(n10), .B1(n57), .C0(n53), .C1(n126), 
        .Y(n91) );
  AOI211X2M U45 ( .A0(n8), .A1(n39), .B0(n93), .C0(n94), .Y(n92) );
  OAI2BB1X2M U46 ( .A0N(N129), .A1N(n48), .B0(n98), .Y(n93) );
  AOI31X2M U47 ( .A0(N169), .A1(n4), .A2(n99), .B0(n100), .Y(n98) );
  NOR3X2M U48 ( .A(n139), .B(ALU_FUN[2]), .C(n142), .Y(n99) );
  AOI31X2M U49 ( .A0(n83), .A1(n84), .A2(n85), .B0(n133), .Y(ALU_Comb[2]) );
  AOI22X1M U50 ( .A0(N103), .A1(n136), .B0(N94), .B1(n41), .Y(n83) );
  AOI222X1M U51 ( .A0(N112), .A1(n40), .B0(n53), .B1(n151), .C0(n10), .C1(n137), .Y(n84) );
  AOI221XLM U52 ( .A0(n9), .A1(n39), .B0(n11), .B1(n57), .C0(n86), .Y(n85) );
  AOI31X2M U53 ( .A0(n76), .A1(n77), .A2(n78), .B0(n133), .Y(ALU_Comb[3]) );
  AOI22X1M U54 ( .A0(N104), .A1(n136), .B0(N95), .B1(n41), .Y(n76) );
  AOI222X1M U55 ( .A0(N113), .A1(n40), .B0(n53), .B1(n150), .C0(n11), .C1(n137), .Y(n77) );
  AOI221XLM U56 ( .A0(n10), .A1(n39), .B0(n12), .B1(n57), .C0(n79), .Y(n78) );
  AOI31X2M U57 ( .A0(n69), .A1(n70), .A2(n71), .B0(n133), .Y(ALU_Comb[4]) );
  AOI22X1M U58 ( .A0(N105), .A1(n136), .B0(N96), .B1(n41), .Y(n69) );
  AOI222X1M U59 ( .A0(N114), .A1(n40), .B0(n53), .B1(n149), .C0(n12), .C1(n137), .Y(n70) );
  AOI221XLM U60 ( .A0(n11), .A1(n39), .B0(n57), .B1(n13), .C0(n72), .Y(n71) );
  INVX2M U61 ( .A(n51), .Y(n134) );
  AOI221XLM U62 ( .A0(n52), .A1(n15), .B0(n146), .B1(n135), .C0(n137), .Y(n51)
         );
  OAI2B2X1M U63 ( .A1N(n5), .A0(n95), .B0(n5), .B1(n96), .Y(n94) );
  AOI221XLM U64 ( .A0(n135), .A1(n126), .B0(n9), .B1(n52), .C0(n137), .Y(n95)
         );
  AOI221XLM U65 ( .A0(n9), .A1(n135), .B0(n97), .B1(n126), .C0(n53), .Y(n96)
         );
  NOR2X2M U66 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n113) );
  NAND2X2M U67 ( .A(ALU_FUN[2]), .B(n142), .Y(n112) );
  AOI31X2M U68 ( .A0(n54), .A1(n55), .A2(n56), .B0(n133), .Y(ALU_Comb[6]) );
  AOI22X1M U69 ( .A0(N107), .A1(n136), .B0(N98), .B1(n41), .Y(n54) );
  AOI222X1M U70 ( .A0(N116), .A1(n40), .B0(n53), .B1(n147), .C0(n137), .C1(n14), .Y(n55) );
  AOI221XLM U71 ( .A0(n13), .A1(n39), .B0(n57), .B1(n15), .C0(n58), .Y(n56) );
  AOI31X2M U72 ( .A0(n43), .A1(n44), .A2(n45), .B0(n133), .Y(ALU_Comb[7]) );
  AOI22X1M U73 ( .A0(n14), .A1(n39), .B0(n53), .B1(n146), .Y(n43) );
  AOI222X1M U74 ( .A0(n7), .A1(n134), .B0(N135), .B1(n48), .C0(n49), .C1(n143), 
        .Y(n44) );
  AOI221XLM U75 ( .A0(N108), .A1(n136), .B0(N99), .B1(n41), .C0(n46), .Y(n45)
         );
  OAI221X1M U76 ( .A0(n10), .A1(n138), .B0(n50), .B1(n151), .C0(n140), .Y(n89)
         );
  OAI221X1M U77 ( .A0(n11), .A1(n138), .B0(n50), .B1(n150), .C0(n140), .Y(n82)
         );
  OAI221X1M U78 ( .A0(n12), .A1(n138), .B0(n50), .B1(n149), .C0(n140), .Y(n75)
         );
  OAI221X1M U79 ( .A0(n13), .A1(n138), .B0(n50), .B1(n148), .C0(n140), .Y(n68)
         );
  OAI221X1M U80 ( .A0(n14), .A1(n138), .B0(n50), .B1(n147), .C0(n140), .Y(n61)
         );
  OAI221X1M U81 ( .A0(n15), .A1(n138), .B0(n146), .B1(n50), .C0(n140), .Y(n49)
         );
  NAND3X2M U82 ( .A(n113), .B(ALU_FUN[0]), .C(n4), .Y(n111) );
  NAND3X2M U83 ( .A(n113), .B(n139), .C(n4), .Y(n50) );
  AOI31X2M U84 ( .A0(n62), .A1(n63), .A2(n64), .B0(n133), .Y(ALU_Comb[5]) );
  AOI22X1M U85 ( .A0(N106), .A1(n136), .B0(N97), .B1(n41), .Y(n62) );
  AOI222X1M U86 ( .A0(N115), .A1(n40), .B0(n53), .B1(n148), .C0(n13), .C1(n137), .Y(n63) );
  AOI221XLM U87 ( .A0(n12), .A1(n39), .B0(n57), .B1(n14), .C0(n65), .Y(n64) );
  OAI21X2M U88 ( .A0(n59), .A1(n132), .B0(n60), .Y(n58) );
  AOI221XLM U89 ( .A0(n135), .A1(n147), .B0(n14), .B1(n52), .C0(n137), .Y(n59)
         );
  AOI22X1M U90 ( .A0(N134), .A1(n48), .B0(n61), .B1(n132), .Y(n60) );
  AOI21X2M U91 ( .A0(n37), .A1(n38), .B0(n133), .Y(ALU_Comb[8]) );
  AOI21X2M U92 ( .A0(N100), .A1(n41), .B0(n42), .Y(n37) );
  AOI22X1M U93 ( .A0(n15), .A1(n39), .B0(N118), .B1(n40), .Y(n38) );
  INVX2M U94 ( .A(n6), .Y(n132) );
  NAND2X2M U95 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n101) );
  INVX2M U96 ( .A(ALU_FUN[0]), .Y(n139) );
  INVX2M U97 ( .A(ALU_FUN[1]), .Y(n142) );
  NOR2X2M U98 ( .A(n139), .B(n4), .Y(n110) );
  INVX2M U99 ( .A(n16), .Y(n128) );
  INVX2M U100 ( .A(n27), .Y(n130) );
  OR2X2M U101 ( .A(n4), .B(ALU_FUN[0]), .Y(n3) );
  AND4X2M U102 ( .A(N170), .B(n141), .C(n4), .D(n139), .Y(n100) );
  INVX2M U103 ( .A(n9), .Y(n126) );
  INVX2M U104 ( .A(n15), .Y(n146) );
  INVX2M U105 ( .A(n14), .Y(n147) );
  INVX2M U106 ( .A(n8), .Y(n152) );
  INVX2M U107 ( .A(n10), .Y(n151) );
  INVX2M U108 ( .A(n11), .Y(n150) );
  INVX2M U109 ( .A(n13), .Y(n148) );
  INVX2M U110 ( .A(n12), .Y(n149) );
  INVX2M U111 ( .A(n7), .Y(n143) );
  BUFX2M U112 ( .A(B[6]), .Y(n6) );
  BUFX2M U113 ( .A(B[7]), .Y(n7) );
  BUFX2M U114 ( .A(B[1]), .Y(n5) );
  BUFX2M U115 ( .A(A[5]), .Y(n13) );
  OAI21X2M U116 ( .A0(n87), .A1(n129), .B0(n88), .Y(n86) );
  AOI221XLM U117 ( .A0(n135), .A1(n151), .B0(n10), .B1(n52), .C0(n137), .Y(n87) );
  AOI22X1M U118 ( .A0(N130), .A1(n48), .B0(n89), .B1(n129), .Y(n88) );
  BUFX2M U119 ( .A(A[4]), .Y(n12) );
  BUFX2M U120 ( .A(A[3]), .Y(n11) );
  OAI21X2M U121 ( .A0(n80), .A1(n131), .B0(n81), .Y(n79) );
  AOI221XLM U122 ( .A0(n135), .A1(n150), .B0(n11), .B1(n52), .C0(n137), .Y(n80) );
  AOI22X1M U123 ( .A0(N131), .A1(n48), .B0(n82), .B1(n131), .Y(n81) );
  BUFX2M U124 ( .A(A[2]), .Y(n10) );
  OAI21X2M U125 ( .A0(n73), .A1(n145), .B0(n74), .Y(n72) );
  AOI221XLM U126 ( .A0(n135), .A1(n149), .B0(n12), .B1(n52), .C0(n137), .Y(n73) );
  AOI22X1M U127 ( .A0(N132), .A1(n48), .B0(n75), .B1(n145), .Y(n74) );
  INVX2M U128 ( .A(B[4]), .Y(n145) );
  BUFX2M U129 ( .A(A[0]), .Y(n8) );
  OAI2B2X1M U130 ( .A1N(B[0]), .A0(n108), .B0(B[0]), .B1(n109), .Y(n107) );
  AOI221XLM U131 ( .A0(n135), .A1(n152), .B0(n8), .B1(n52), .C0(n137), .Y(n108) );
  AOI221XLM U132 ( .A0(n8), .A1(n135), .B0(n97), .B1(n152), .C0(n53), .Y(n109)
         );
  OAI21X2M U133 ( .A0(n66), .A1(n144), .B0(n67), .Y(n65) );
  AOI221XLM U134 ( .A0(n135), .A1(n148), .B0(n13), .B1(n52), .C0(n137), .Y(n66) );
  AOI22X1M U135 ( .A0(N133), .A1(n48), .B0(n68), .B1(n144), .Y(n67) );
  INVX2M U136 ( .A(B[5]), .Y(n144) );
  AND3X2M U137 ( .A(n110), .B(ALU_FUN[1]), .C(n116), .Y(n48) );
  AOI21XLM U138 ( .A0(n117), .A1(n118), .B0(ALU_FUN[2]), .Y(n116) );
  NOR4X1M U139 ( .A(n7), .B(n6), .C(B[5]), .D(B[4]), .Y(n118) );
  NOR4X1M U140 ( .A(B[3]), .B(B[2]), .C(n5), .D(B[0]), .Y(n117) );
  BUFX2M U141 ( .A(ALU_FUN[3]), .Y(n4) );
  INVX2M U142 ( .A(B[0]), .Y(n127) );
  INVX2M U143 ( .A(B[2]), .Y(n129) );
  INVX2M U144 ( .A(B[3]), .Y(n131) );
  NOR2X1M U145 ( .A(n146), .B(n7), .Y(n122) );
  NAND2BX1M U146 ( .AN(B[4]), .B(n12), .Y(n31) );
  NAND2BX1M U147 ( .AN(n12), .B(B[4]), .Y(n20) );
  CLKNAND2X2M U148 ( .A(n31), .B(n20), .Y(n33) );
  NOR2X1M U149 ( .A(n131), .B(n11), .Y(n28) );
  NOR2X1M U150 ( .A(n129), .B(n10), .Y(n19) );
  NOR2X1M U151 ( .A(n127), .B(n8), .Y(n16) );
  CLKNAND2X2M U152 ( .A(n10), .B(n129), .Y(n30) );
  NAND2BX1M U153 ( .AN(n19), .B(n30), .Y(n25) );
  AOI21X1M U154 ( .A0(n16), .A1(n126), .B0(n5), .Y(n17) );
  AOI211X1M U155 ( .A0(n9), .A1(n128), .B0(n25), .C0(n17), .Y(n18) );
  CLKNAND2X2M U156 ( .A(n11), .B(n131), .Y(n29) );
  OAI31X1M U157 ( .A0(n28), .A1(n19), .A2(n18), .B0(n29), .Y(n21) );
  NAND2BX1M U158 ( .AN(n13), .B(B[5]), .Y(n120) );
  OAI211X1M U159 ( .A0(n33), .A1(n21), .B0(n20), .C0(n120), .Y(n22) );
  NAND2BX1M U160 ( .AN(B[5]), .B(n13), .Y(n32) );
  XNOR2X1M U161 ( .A(n14), .B(n6), .Y(n119) );
  AOI32X1M U162 ( .A0(n22), .A1(n32), .A2(n119), .B0(n6), .B1(n147), .Y(n23)
         );
  CLKNAND2X2M U163 ( .A(n7), .B(n146), .Y(n123) );
  OAI21X1M U164 ( .A0(n122), .A1(n23), .B0(n123), .Y(N170) );
  CLKNAND2X2M U165 ( .A(n8), .B(n127), .Y(n26) );
  OA21X1M U166 ( .A0(n26), .A1(n126), .B0(n5), .Y(n24) );
  AOI211X1M U167 ( .A0(n26), .A1(n126), .B0(n25), .C0(n24), .Y(n27) );
  AOI31X1M U168 ( .A0(n130), .A1(n30), .A2(n29), .B0(n28), .Y(n34) );
  OAI2B11X1M U169 ( .A1N(n34), .A0(n33), .B0(n32), .C0(n31), .Y(n121) );
  AOI32X1M U170 ( .A0(n121), .A1(n120), .A2(n119), .B0(n14), .B1(n132), .Y(
        n124) );
  AOI2B1X1M U171 ( .A1N(n124), .A0(n123), .B0(n122), .Y(n125) );
  CLKINVX1M U172 ( .A(n125), .Y(N169) );
  NOR2X1M U173 ( .A(N170), .B(N169), .Y(N168) );
endmodule


module CLK_GATE ( CLK, GATE_EN, GATED_CLK );
  input CLK, GATE_EN;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(GATE_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module SYS_CTRL_DATA_WIDTH8_ADDR_WIDTH4_ALU_OUT_WIDTH16 ( CLK, RST, ALU_OUT, 
        ALU_OUT_Valid, ALU_FUN, ALU_Enable, CLK_EN, Rd_DATA, Rd_DATA_Valid, 
        WR_DATA, WR_EN, RD_EN, addr, RX_P_DATA, RX_D_VLD, TX_P_DATA, TX_D_VLD, 
        FIFO_FULL, clk_div_en );
  input [15:0] ALU_OUT;
  output [3:0] ALU_FUN;
  input [7:0] Rd_DATA;
  output [7:0] WR_DATA;
  output [3:0] addr;
  input [7:0] RX_P_DATA;
  output [7:0] TX_P_DATA;
  input CLK, RST, ALU_OUT_Valid, Rd_DATA_Valid, RX_D_VLD, FIFO_FULL;
  output ALU_Enable, CLK_EN, WR_EN, RD_EN, TX_D_VLD, clk_div_en;
  wire   is_alu_op, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n58, n59, n60, n61, n62, n63, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n64, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181;
  wire   [3:0] current_state;
  wire   [15:0] alu_result_reg;

  DFFRQX2M \alu_result_reg_reg[15]  ( .D(n162), .CK(CLK), .RN(n10), .Q(
        alu_result_reg[15]) );
  DFFRQX2M \alu_result_reg_reg[14]  ( .D(n161), .CK(CLK), .RN(n10), .Q(
        alu_result_reg[14]) );
  DFFRQX2M \alu_result_reg_reg[13]  ( .D(n160), .CK(CLK), .RN(n10), .Q(
        alu_result_reg[13]) );
  DFFRQX2M \alu_result_reg_reg[12]  ( .D(n159), .CK(CLK), .RN(n10), .Q(
        alu_result_reg[12]) );
  DFFRQX2M \alu_result_reg_reg[11]  ( .D(n158), .CK(CLK), .RN(n10), .Q(
        alu_result_reg[11]) );
  DFFRQX2M \alu_result_reg_reg[10]  ( .D(n157), .CK(CLK), .RN(n10), .Q(
        alu_result_reg[10]) );
  DFFRQX2M \alu_result_reg_reg[9]  ( .D(n156), .CK(CLK), .RN(n10), .Q(
        alu_result_reg[9]) );
  DFFRQX2M \alu_result_reg_reg[8]  ( .D(n155), .CK(CLK), .RN(n10), .Q(
        alu_result_reg[8]) );
  DFFRX1M \oper_B_reg_reg[7]  ( .D(n146), .CK(CLK), .RN(n9), .QN(n27) );
  DFFRX1M \oper_B_reg_reg[6]  ( .D(n145), .CK(CLK), .RN(n9), .QN(n28) );
  DFFRX1M \oper_B_reg_reg[5]  ( .D(n144), .CK(CLK), .RN(n9), .QN(n29) );
  DFFRX1M \oper_B_reg_reg[4]  ( .D(n143), .CK(CLK), .RN(n9), .QN(n30) );
  DFFRX1M \oper_B_reg_reg[3]  ( .D(n142), .CK(CLK), .RN(n9), .QN(n31) );
  DFFRX1M \oper_B_reg_reg[2]  ( .D(n141), .CK(CLK), .RN(n9), .QN(n32) );
  DFFRX1M \oper_B_reg_reg[1]  ( .D(n140), .CK(CLK), .RN(n9), .QN(n33) );
  DFFRX1M \oper_B_reg_reg[0]  ( .D(n139), .CK(CLK), .RN(n9), .QN(n34) );
  DFFRX1M \oper_A_reg_reg[7]  ( .D(n138), .CK(CLK), .RN(n9), .QN(n35) );
  DFFRX1M \oper_A_reg_reg[6]  ( .D(n137), .CK(CLK), .RN(n9), .QN(n36) );
  DFFRX1M \oper_A_reg_reg[5]  ( .D(n136), .CK(CLK), .RN(n9), .QN(n37) );
  DFFRX1M \oper_A_reg_reg[4]  ( .D(n135), .CK(CLK), .RN(n9), .QN(n38) );
  DFFRX1M \oper_A_reg_reg[3]  ( .D(n134), .CK(CLK), .RN(n10), .QN(n39) );
  DFFRX1M \oper_A_reg_reg[2]  ( .D(n133), .CK(CLK), .RN(n10), .QN(n40) );
  DFFRX1M \oper_A_reg_reg[1]  ( .D(n132), .CK(CLK), .RN(n10), .QN(n41) );
  DFFRX1M \oper_A_reg_reg[0]  ( .D(n131), .CK(CLK), .RN(n10), .QN(n42) );
  DFFRX1M \alu_result_reg_reg[7]  ( .D(n154), .CK(CLK), .RN(n8), .QN(n19) );
  DFFRX1M \alu_result_reg_reg[6]  ( .D(n153), .CK(CLK), .RN(n8), .QN(n20) );
  DFFRX1M \alu_result_reg_reg[5]  ( .D(n152), .CK(CLK), .RN(n8), .QN(n21) );
  DFFRX1M \alu_result_reg_reg[4]  ( .D(n151), .CK(CLK), .RN(n8), .QN(n22) );
  DFFRX1M \alu_result_reg_reg[3]  ( .D(n150), .CK(CLK), .RN(n8), .QN(n23) );
  DFFRX1M \alu_result_reg_reg[2]  ( .D(n149), .CK(CLK), .RN(n8), .QN(n24) );
  DFFRX1M \alu_result_reg_reg[1]  ( .D(n148), .CK(CLK), .RN(n8), .QN(n25) );
  DFFRX1M \alu_result_reg_reg[0]  ( .D(n147), .CK(CLK), .RN(n8), .QN(n26) );
  DFFRX1M \rf_addr_reg_reg[3]  ( .D(n166), .CK(CLK), .RN(n8), .QN(n15) );
  DFFRX1M \rf_addr_reg_reg[2]  ( .D(n165), .CK(CLK), .RN(n8), .QN(n16) );
  DFFSX1M \alu_function_reg_reg[3]  ( .D(n130), .CK(CLK), .SN(n10), .QN(n43)
         );
  DFFSX1M \alu_function_reg_reg[1]  ( .D(n128), .CK(CLK), .SN(n10), .QN(n45)
         );
  DFFSX1M \alu_function_reg_reg[0]  ( .D(n127), .CK(CLK), .SN(n10), .QN(n46)
         );
  DFFRX1M \rf_addr_reg_reg[0]  ( .D(n163), .CK(CLK), .RN(n8), .QN(n18) );
  DFFRX1M \rf_addr_reg_reg[1]  ( .D(n164), .CK(CLK), .RN(n8), .QN(n17) );
  DFFRQX2M is_alu_op_reg ( .D(n171), .CK(CLK), .RN(n11), .Q(is_alu_op) );
  DFFSX1M \alu_function_reg_reg[2]  ( .D(n129), .CK(CLK), .SN(n10), .QN(n44)
         );
  DFFRQX2M \current_state_reg[0]  ( .D(n167), .CK(CLK), .RN(n11), .Q(
        current_state[0]) );
  DFFRQX2M \current_state_reg[1]  ( .D(n168), .CK(CLK), .RN(n11), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[2]  ( .D(n169), .CK(CLK), .RN(n11), .Q(
        current_state[2]) );
  DFFRQX2M \current_state_reg[3]  ( .D(n170), .CK(CLK), .RN(n11), .Q(
        current_state[3]) );
  INVX2M U3 ( .A(1'b0), .Y(clk_div_en) );
  OAI221X1M U5 ( .A0(n45), .A1(n87), .B0(n125), .B1(n179), .C0(n126), .Y(
        ALU_FUN[1]) );
  OAI221X1M U6 ( .A0(n44), .A1(n87), .B0(n125), .B1(n178), .C0(n126), .Y(
        ALU_FUN[2]) );
  OAI221X1M U7 ( .A0(n46), .A1(n87), .B0(n125), .B1(n180), .C0(n126), .Y(
        ALU_FUN[0]) );
  OAI221X1M U8 ( .A0(n18), .A1(n109), .B0(n180), .B1(n108), .C0(n88), .Y(
        addr[0]) );
  OAI22X4M U9 ( .A0(n179), .A1(n108), .B0(n17), .B1(n109), .Y(addr[1]) );
  NAND2X2M U10 ( .A(n64), .B(n65), .Y(n3) );
  OAI22X2M U11 ( .A0(n178), .A1(n108), .B0(n16), .B1(n109), .Y(addr[2]) );
  OAI211X2M U12 ( .A0(Rd_DATA_Valid), .A1(n89), .B0(n93), .C0(n94), .Y(n69) );
  AOI2B1X1M U13 ( .A1N(CLK_EN), .A0(n87), .B0(n72), .Y(n126) );
  NAND2X2M U14 ( .A(n125), .B(n51), .Y(CLK_EN) );
  INVX2M U15 ( .A(n72), .Y(n51) );
  NAND2X2M U16 ( .A(n12), .B(n120), .Y(TX_D_VLD) );
  NAND2X2M U17 ( .A(n51), .B(n109), .Y(WR_EN) );
  NAND2X2M U18 ( .A(n125), .B(n87), .Y(ALU_Enable) );
  INVX2M U19 ( .A(n5), .Y(n53) );
  INVX2M U20 ( .A(n120), .Y(n13) );
  INVX2M U21 ( .A(n4), .Y(n52) );
  INVX2M U22 ( .A(n66), .Y(n49) );
  BUFX2M U23 ( .A(n7), .Y(n10) );
  BUFX2M U24 ( .A(n6), .Y(n9) );
  BUFX2M U25 ( .A(n6), .Y(n8) );
  BUFX2M U26 ( .A(n7), .Y(n11) );
  NOR4X1M U27 ( .A(n50), .B(n55), .C(n57), .D(n56), .Y(n85) );
  NOR2BX2M U28 ( .AN(n65), .B(n85), .Y(n125) );
  NAND3X2M U29 ( .A(n55), .B(n50), .C(n59), .Y(n87) );
  NAND2X2M U30 ( .A(n84), .B(n88), .Y(n72) );
  OR2X2M U31 ( .A(n97), .B(n181), .Y(n109) );
  NOR2BX2M U32 ( .AN(n123), .B(n55), .Y(n99) );
  NAND2X2M U33 ( .A(n123), .B(n55), .Y(n73) );
  NAND2X2M U34 ( .A(n122), .B(n99), .Y(n120) );
  INVX2M U35 ( .A(n108), .Y(RD_EN) );
  INVX2M U36 ( .A(n121), .Y(n12) );
  NOR3X2M U37 ( .A(n86), .B(n92), .C(n71), .Y(n81) );
  OAI22X1M U38 ( .A0(n14), .A1(n57), .B0(n75), .B1(n69), .Y(n168) );
  AOI211X2M U39 ( .A0(n174), .A1(n54), .B0(n76), .C0(n77), .Y(n75) );
  INVX2M U40 ( .A(n79), .Y(n174) );
  NAND3X2M U41 ( .A(n61), .B(n78), .C(n67), .Y(n76) );
  OAI22X1M U42 ( .A0(n14), .A1(n56), .B0(n80), .B1(n69), .Y(n169) );
  AND3X2M U43 ( .A(n81), .B(n82), .C(n51), .Y(n80) );
  OAI22X1M U44 ( .A0(n14), .A1(n55), .B0(n68), .B1(n69), .Y(n167) );
  NOR3X2M U45 ( .A(n70), .B(n71), .C(n72), .Y(n68) );
  OAI211X2M U46 ( .A0(n73), .A1(n47), .B0(n67), .C0(n74), .Y(n70) );
  OAI22X1M U47 ( .A0(n14), .A1(n50), .B0(n83), .B1(n69), .Y(n170) );
  NOR4BX1M U48 ( .AN(n84), .B(n85), .C(n86), .D(n77), .Y(n83) );
  INVX2M U49 ( .A(n69), .Y(n14) );
  NAND3X2M U50 ( .A(n63), .B(n61), .C(n87), .Y(n71) );
  OAI2BB2X1M U51 ( .B0(n100), .B1(n47), .A0N(n101), .A1N(n100), .Y(n171) );
  AOI31X2M U52 ( .A0(n78), .A1(n82), .A2(n74), .B0(n181), .Y(n100) );
  NAND3X2M U53 ( .A(n180), .B(n176), .C(n102), .Y(n74) );
  BUFX2M U54 ( .A(n60), .Y(n5) );
  NOR2X2M U55 ( .A(n61), .B(n181), .Y(n60) );
  AND2X2M U56 ( .A(n59), .B(n50), .Y(n86) );
  NOR2X2M U57 ( .A(n67), .B(n181), .Y(n66) );
  BUFX2M U58 ( .A(n62), .Y(n4) );
  NOR2X2M U59 ( .A(n63), .B(n181), .Y(n62) );
  INVX2M U60 ( .A(n58), .Y(n48) );
  NAND2X2M U61 ( .A(n54), .B(n101), .Y(n82) );
  INVX2M U62 ( .A(n106), .Y(n54) );
  BUFX2M U63 ( .A(RST), .Y(n7) );
  BUFX2M U64 ( .A(RST), .Y(n6) );
  NOR3BX2M U65 ( .AN(n98), .B(current_state[0]), .C(current_state[2]), .Y(n92)
         );
  NOR2X2M U66 ( .A(n56), .B(current_state[1]), .Y(n59) );
  NAND2X2M U67 ( .A(n92), .B(RX_D_VLD), .Y(n108) );
  NOR2X2M U68 ( .A(n57), .B(current_state[3]), .Y(n98) );
  NAND3X2M U69 ( .A(current_state[0]), .B(n59), .C(current_state[3]), .Y(n88)
         );
  NAND3X2M U70 ( .A(n59), .B(n55), .C(current_state[3]), .Y(n84) );
  INVX2M U71 ( .A(current_state[2]), .Y(n56) );
  INVX2M U72 ( .A(current_state[1]), .Y(n57) );
  NOR3X2M U73 ( .A(n57), .B(current_state[2]), .C(n50), .Y(n123) );
  NAND4X2M U74 ( .A(current_state[3]), .B(n55), .C(n57), .D(n56), .Y(n65) );
  INVX2M U75 ( .A(current_state[3]), .Y(n50) );
  NOR2X2M U76 ( .A(n73), .B(n124), .Y(n121) );
  AOI2B1X1M U77 ( .A1N(FIFO_FULL), .A0(Rd_DATA_Valid), .B0(n122), .Y(n124) );
  INVX2M U78 ( .A(current_state[0]), .Y(n55) );
  INVX2M U79 ( .A(RX_P_DATA[0]), .Y(n180) );
  INVX2M U80 ( .A(RX_P_DATA[2]), .Y(n178) );
  OAI22X1M U81 ( .A0(n177), .A1(n108), .B0(n15), .B1(n109), .Y(addr[3]) );
  INVX2M U82 ( .A(RX_D_VLD), .Y(n181) );
  NAND3X2M U83 ( .A(n98), .B(n56), .C(current_state[0]), .Y(n97) );
  OAI221X1M U84 ( .A0(n43), .A1(n87), .B0(n125), .B1(n177), .C0(n126), .Y(
        ALU_FUN[3]) );
  NOR4BX1M U85 ( .AN(n107), .B(RX_P_DATA[2]), .C(RX_P_DATA[6]), .D(n179), .Y(
        n102) );
  NOR2X2M U86 ( .A(n175), .B(n106), .Y(n107) );
  NOR4X1M U87 ( .A(current_state[0]), .B(current_state[1]), .C(
        current_state[2]), .D(current_state[3]), .Y(n96) );
  NAND4X2M U88 ( .A(current_state[0]), .B(n57), .C(n56), .D(n50), .Y(n67) );
  NOR2X2M U89 ( .A(n12), .B(is_alu_op), .Y(n112) );
  NAND2X2M U90 ( .A(n121), .B(is_alu_op), .Y(n110) );
  NAND4X2M U91 ( .A(n87), .B(n88), .C(n89), .D(n90), .Y(n77) );
  AOI21X2M U92 ( .A0(is_alu_op), .A1(n91), .B0(n92), .Y(n90) );
  NAND2X2M U93 ( .A(n73), .B(n65), .Y(n91) );
  OAI222X1M U94 ( .A0(n34), .A1(n88), .B0(n180), .B1(n109), .C0(n42), .C1(n84), 
        .Y(WR_DATA[0]) );
  OAI222X1M U95 ( .A0(n33), .A1(n88), .B0(n179), .B1(n109), .C0(n41), .C1(n84), 
        .Y(WR_DATA[1]) );
  OAI222X1M U96 ( .A0(n32), .A1(n88), .B0(n178), .B1(n109), .C0(n40), .C1(n84), 
        .Y(WR_DATA[2]) );
  OAI222X1M U97 ( .A0(n31), .A1(n88), .B0(n177), .B1(n109), .C0(n39), .C1(n84), 
        .Y(WR_DATA[3]) );
  OAI222X1M U98 ( .A0(n30), .A1(n88), .B0(n176), .B1(n109), .C0(n38), .C1(n84), 
        .Y(WR_DATA[4]) );
  OAI222X1M U99 ( .A0(n29), .A1(n88), .B0(n175), .B1(n109), .C0(n37), .C1(n84), 
        .Y(WR_DATA[5]) );
  OAI222X1M U100 ( .A0(n28), .A1(n88), .B0(n173), .B1(n109), .C0(n36), .C1(n84), .Y(WR_DATA[6]) );
  OAI222X1M U101 ( .A0(n27), .A1(n88), .B0(n172), .B1(n109), .C0(n35), .C1(n84), .Y(WR_DATA[7]) );
  OAI22X1M U102 ( .A0(n180), .A1(n53), .B0(n5), .B1(n42), .Y(n131) );
  OAI22X1M U103 ( .A0(n179), .A1(n53), .B0(n5), .B1(n41), .Y(n132) );
  OAI22X1M U104 ( .A0(n178), .A1(n53), .B0(n5), .B1(n40), .Y(n133) );
  OAI22X1M U105 ( .A0(n177), .A1(n53), .B0(n5), .B1(n39), .Y(n134) );
  NAND3X2M U106 ( .A(current_state[2]), .B(n55), .C(n98), .Y(n61) );
  NOR2X2M U107 ( .A(n47), .B(FIFO_FULL), .Y(n122) );
  INVX2M U108 ( .A(RX_P_DATA[1]), .Y(n179) );
  NAND3X2M U109 ( .A(n98), .B(current_state[2]), .C(current_state[0]), .Y(n63)
         );
  OAI21X2M U110 ( .A0(n26), .A1(n110), .B0(n119), .Y(TX_P_DATA[0]) );
  AOI22X1M U111 ( .A0(n13), .A1(alu_result_reg[8]), .B0(Rd_DATA[0]), .B1(n112), 
        .Y(n119) );
  OAI21X2M U112 ( .A0(n25), .A1(n110), .B0(n118), .Y(TX_P_DATA[1]) );
  AOI22X1M U113 ( .A0(n13), .A1(alu_result_reg[9]), .B0(Rd_DATA[1]), .B1(n112), 
        .Y(n118) );
  OAI21X2M U114 ( .A0(n24), .A1(n110), .B0(n117), .Y(TX_P_DATA[2]) );
  AOI22X1M U115 ( .A0(n13), .A1(alu_result_reg[10]), .B0(Rd_DATA[2]), .B1(n112), .Y(n117) );
  OAI21X2M U116 ( .A0(n23), .A1(n110), .B0(n116), .Y(TX_P_DATA[3]) );
  AOI22X1M U117 ( .A0(n13), .A1(alu_result_reg[11]), .B0(Rd_DATA[3]), .B1(n112), .Y(n116) );
  OAI21X2M U118 ( .A0(n22), .A1(n110), .B0(n115), .Y(TX_P_DATA[4]) );
  AOI22X1M U119 ( .A0(n13), .A1(alu_result_reg[12]), .B0(Rd_DATA[4]), .B1(n112), .Y(n115) );
  OAI21X2M U120 ( .A0(n21), .A1(n110), .B0(n114), .Y(TX_P_DATA[5]) );
  AOI22X1M U121 ( .A0(n13), .A1(alu_result_reg[13]), .B0(Rd_DATA[5]), .B1(n112), .Y(n114) );
  OAI21X2M U122 ( .A0(n20), .A1(n110), .B0(n113), .Y(TX_P_DATA[6]) );
  AOI22X1M U123 ( .A0(n13), .A1(alu_result_reg[14]), .B0(Rd_DATA[6]), .B1(n112), .Y(n113) );
  OAI21X2M U124 ( .A0(n19), .A1(n110), .B0(n111), .Y(TX_P_DATA[7]) );
  AOI22X1M U125 ( .A0(n13), .A1(alu_result_reg[15]), .B0(Rd_DATA[7]), .B1(n112), .Y(n111) );
  OAI2B1X2M U126 ( .A1N(n73), .A0(n99), .B0(FIFO_FULL), .Y(n93) );
  AOI22X1M U127 ( .A0(n95), .A1(n181), .B0(n85), .B1(n64), .Y(n94) );
  NAND4BX1M U128 ( .AN(n96), .B(n81), .C(n97), .D(n67), .Y(n95) );
  NAND3X2M U129 ( .A(RX_P_DATA[7]), .B(RX_P_DATA[3]), .C(n96), .Y(n106) );
  NAND3X2M U130 ( .A(RX_P_DATA[4]), .B(RX_P_DATA[0]), .C(n102), .Y(n78) );
  INVX2M U131 ( .A(RX_P_DATA[3]), .Y(n177) );
  INVX2M U132 ( .A(is_alu_op), .Y(n47) );
  OAI21X2M U133 ( .A0(n103), .A1(n104), .B0(n79), .Y(n101) );
  NAND3X2M U134 ( .A(n179), .B(n175), .C(RX_P_DATA[0]), .Y(n103) );
  NAND3X2M U135 ( .A(RX_P_DATA[4]), .B(RX_P_DATA[2]), .C(RX_P_DATA[6]), .Y(
        n104) );
  NAND3X2M U136 ( .A(n59), .B(n50), .C(RX_D_VLD), .Y(n58) );
  OAI22X1M U137 ( .A0(n58), .A1(n180), .B0(n48), .B1(n46), .Y(n127) );
  OAI22X1M U138 ( .A0(n58), .A1(n179), .B0(n48), .B1(n45), .Y(n128) );
  OAI22X1M U139 ( .A0(n58), .A1(n178), .B0(n48), .B1(n44), .Y(n129) );
  OAI22X1M U140 ( .A0(n58), .A1(n177), .B0(n48), .B1(n43), .Y(n130) );
  OAI22X1M U141 ( .A0(n53), .A1(n176), .B0(n5), .B1(n38), .Y(n135) );
  OAI22X1M U142 ( .A0(n53), .A1(n175), .B0(n5), .B1(n37), .Y(n136) );
  OAI22X1M U143 ( .A0(n53), .A1(n173), .B0(n5), .B1(n36), .Y(n137) );
  OAI22X1M U144 ( .A0(n53), .A1(n172), .B0(n5), .B1(n35), .Y(n138) );
  OAI22X1M U145 ( .A0(n180), .A1(n52), .B0(n4), .B1(n34), .Y(n139) );
  OAI22X1M U146 ( .A0(n179), .A1(n52), .B0(n4), .B1(n33), .Y(n140) );
  OAI22X1M U147 ( .A0(n178), .A1(n52), .B0(n4), .B1(n32), .Y(n141) );
  OAI22X1M U148 ( .A0(n177), .A1(n52), .B0(n4), .B1(n31), .Y(n142) );
  OAI22X1M U149 ( .A0(n176), .A1(n52), .B0(n4), .B1(n30), .Y(n143) );
  OAI22X1M U150 ( .A0(n175), .A1(n52), .B0(n4), .B1(n29), .Y(n144) );
  OAI22X1M U151 ( .A0(n173), .A1(n52), .B0(n4), .B1(n28), .Y(n145) );
  OAI22X1M U152 ( .A0(n172), .A1(n52), .B0(n4), .B1(n27), .Y(n146) );
  OAI22X1M U153 ( .A0(n180), .A1(n49), .B0(n66), .B1(n18), .Y(n163) );
  OAI22X1M U154 ( .A0(n179), .A1(n49), .B0(n66), .B1(n17), .Y(n164) );
  OAI22X1M U155 ( .A0(n178), .A1(n49), .B0(n66), .B1(n16), .Y(n165) );
  OAI22X1M U156 ( .A0(n177), .A1(n49), .B0(n66), .B1(n15), .Y(n166) );
  NAND4X2M U157 ( .A(current_state[3]), .B(current_state[1]), .C(
        current_state[2]), .D(n55), .Y(n89) );
  NAND4X2M U158 ( .A(RX_P_DATA[2]), .B(n180), .C(RX_P_DATA[6]), .D(n105), .Y(
        n79) );
  NOR3X2M U159 ( .A(RX_P_DATA[1]), .B(RX_P_DATA[5]), .C(RX_P_DATA[4]), .Y(n105) );
  OAI2BB2X1M U160 ( .B0(n3), .B1(n26), .A0N(ALU_OUT[0]), .A1N(n3), .Y(n147) );
  OAI2BB2X1M U161 ( .B0(n3), .B1(n25), .A0N(ALU_OUT[1]), .A1N(n3), .Y(n148) );
  OAI2BB2X1M U162 ( .B0(n3), .B1(n24), .A0N(ALU_OUT[2]), .A1N(n3), .Y(n149) );
  OAI2BB2X1M U163 ( .B0(n3), .B1(n23), .A0N(ALU_OUT[3]), .A1N(n3), .Y(n150) );
  OAI2BB2X1M U164 ( .B0(n3), .B1(n22), .A0N(ALU_OUT[4]), .A1N(n3), .Y(n151) );
  OAI2BB2X1M U165 ( .B0(n3), .B1(n21), .A0N(ALU_OUT[5]), .A1N(n3), .Y(n152) );
  OAI2BB2X1M U166 ( .B0(n3), .B1(n20), .A0N(ALU_OUT[6]), .A1N(n3), .Y(n153) );
  OAI2BB2X1M U167 ( .B0(n3), .B1(n19), .A0N(ALU_OUT[7]), .A1N(n3), .Y(n154) );
  INVX2M U168 ( .A(RX_P_DATA[4]), .Y(n176) );
  INVX2M U169 ( .A(RX_P_DATA[5]), .Y(n175) );
  INVX2M U170 ( .A(RX_P_DATA[6]), .Y(n173) );
  INVX2M U171 ( .A(RX_P_DATA[7]), .Y(n172) );
  AO2B2X2M U172 ( .B0(ALU_OUT[8]), .B1(n3), .A0(alu_result_reg[8]), .A1N(n3), 
        .Y(n155) );
  AO2B2X2M U173 ( .B0(ALU_OUT[9]), .B1(n3), .A0(alu_result_reg[9]), .A1N(n3), 
        .Y(n156) );
  AO2B2X2M U174 ( .B0(ALU_OUT[10]), .B1(n3), .A0(alu_result_reg[10]), .A1N(n3), 
        .Y(n157) );
  AO2B2X2M U175 ( .B0(ALU_OUT[11]), .B1(n3), .A0(alu_result_reg[11]), .A1N(n3), 
        .Y(n158) );
  AO2B2X2M U176 ( .B0(ALU_OUT[12]), .B1(n3), .A0(alu_result_reg[12]), .A1N(n3), 
        .Y(n159) );
  AO2B2X2M U177 ( .B0(ALU_OUT[13]), .B1(n3), .A0(alu_result_reg[13]), .A1N(n3), 
        .Y(n160) );
  AO2B2X2M U178 ( .B0(ALU_OUT[14]), .B1(n3), .A0(alu_result_reg[14]), .A1N(n3), 
        .Y(n161) );
  AO2B2X2M U179 ( .B0(ALU_OUT[15]), .B1(n3), .A0(alu_result_reg[15]), .A1N(n3), 
        .Y(n162) );
  INVX2M U180 ( .A(ALU_OUT_Valid), .Y(n64) );
endmodule


module SYS_TOP ( RST_N, UART_CLK, REF_CLK, UART_RX_IN, UART_TX_O, parity_error, 
        framing_error );
  input RST_N, UART_CLK, REF_CLK, UART_RX_IN;
  output UART_TX_O, parity_error, framing_error;
  wire   SYNC_REF_RST, SYNC_UART_RST, RX_Valid, RX_Valid_SYNC, TX_CLK,
         TX_D_VLD, Busy_PULSE, FIFO_FULL, TX_Valid_SYNC, busy, RX_CLK, WR_EN,
         RD_EN, Rd_DATA_Valid, ALU_Gated_CLK, ALU_Enable, ALU_OUT_Valid,
         CLK_EN, n1, n2, n3;
  wire   [7:0] RX_OUT;
  wire   [7:0] Rx_SYNC_OUT;
  wire   [7:0] TX_DATA_IN;
  wire   [7:0] TX_DATA_SYNC;
  wire   [7:0] DIV_Ratio;
  wire   [7:0] UART_Config;
  wire   [7:0] DIV_RATIO_RX;
  wire   [7:0] Rd_DATA;
  wire   [3:0] addr;
  wire   [7:0] WR_DATA;
  wire   [7:0] OP_A;
  wire   [7:0] OP_B;
  wire   [3:0] ALU_FUN;
  wire   [15:0] ALU_OUT;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  RST_SYNC_NUM_STAGES2_0 rst_sync_inst ( .CLK(REF_CLK), .RST(RST_N), 
        .SYNC_RST(SYNC_REF_RST) );
  RST_SYNC_NUM_STAGES2_1 rst_sync2_inst ( .CLK(UART_CLK), .RST(RST_N), 
        .SYNC_RST(SYNC_UART_RST) );
  DATA_SYNC_BUS_WIDTH8_NUM_STAGES2 data_sync_inst ( .CLK(REF_CLK), .RST(
        SYNC_REF_RST), .bus_enable(RX_Valid), .unsyn_bus(RX_OUT), .sync_bus(
        Rx_SYNC_OUT), .enable_pulse(RX_Valid_SYNC) );
  ASYNC_FIFO_DATA_WIDTH8_ADDR_WIDTH3_FIFO_DEPTH8 async_fifo_inst ( .W_CLK(
        REF_CLK), .W_RST(SYNC_REF_RST), .R_CLK(TX_CLK), .R_RST(n2), .w_inc(
        TX_D_VLD), .r_inc(Busy_PULSE), .WR_DATA(TX_DATA_IN), .RD_DATA(
        TX_DATA_SYNC), .w_full(FIFO_FULL), .r_empty(TX_Valid_SYNC) );
  PULSE_GEN pulse_gen_inst ( .clk(TX_CLK), .rst_n(n2), .ASYNC(busy), 
        .pulse_sig(Busy_PULSE) );
  CLK_divider_0 clk_div_inst ( .ref_clk(UART_CLK), .clk_en(1'b1), .rst(n2), 
        .div_ratio(DIV_Ratio), .div_clk(TX_CLK) );
  CLKDIV_MUX mux_clk_div_inst ( .IN(UART_Config[7:2]), .OUT({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, DIV_RATIO_RX[3:0]})
         );
  CLK_divider_1 clk_div2_inst ( .ref_clk(UART_CLK), .clk_en(1'b1), .rst(n2), 
        .div_ratio({1'b0, 1'b0, 1'b0, 1'b0, DIV_RATIO_RX[3:0]}), .div_clk(
        RX_CLK) );
  UART_DATA_WIDTH8 uart_inst ( .TX_CLK(TX_CLK), .RX_CLK(RX_CLK), .RST(n2), 
        .PAR_TYP(UART_Config[1]), .PAR_EN(UART_Config[0]), .Prescale(
        UART_Config[7:2]), .TX_IN_P(TX_DATA_SYNC), .TX_IN_V(n1), .RX_IN_S(
        UART_RX_IN), .TX_OUT_S(UART_TX_O), .TX_OUT_V(busy), .RX_OUT_V(RX_Valid), .RX_OUT_P(RX_OUT), .parity_error(parity_error), .framing_error(framing_error) );
  RegFile_WIDTH8_DEPTH8_ADDR4 regfile_inst ( .clk(REF_CLK), .rst(SYNC_REF_RST), 
        .Address(addr), .WrData(WR_DATA), .WrEn(WR_EN), .RdEn(RD_EN), .RdData(
        Rd_DATA), .RdData_valid(Rd_DATA_Valid), .REG0(OP_A), .REG1(OP_B), 
        .REG2(UART_Config), .REG3(DIV_Ratio) );
  ALU_OPER_WIDTH8_OUT_WIDTH16 alu_inst ( .A(OP_A), .B(OP_B), .ALU_FUN(ALU_FUN), 
        .CLK(ALU_Gated_CLK), .RST(SYNC_REF_RST), .Enable(ALU_Enable), 
        .ALU_OUT(ALU_OUT), .OUT_VALID(ALU_OUT_Valid) );
  CLK_GATE clk_gating_inst ( .CLK(REF_CLK), .GATE_EN(CLK_EN), .GATED_CLK(
        ALU_Gated_CLK) );
  SYS_CTRL_DATA_WIDTH8_ADDR_WIDTH4_ALU_OUT_WIDTH16 sys_ctrl_inst ( .CLK(
        REF_CLK), .RST(SYNC_REF_RST), .ALU_OUT(ALU_OUT), .ALU_OUT_Valid(
        ALU_OUT_Valid), .ALU_FUN(ALU_FUN), .ALU_Enable(ALU_Enable), .CLK_EN(
        CLK_EN), .Rd_DATA(Rd_DATA), .Rd_DATA_Valid(Rd_DATA_Valid), .WR_DATA(
        WR_DATA), .WR_EN(WR_EN), .RD_EN(RD_EN), .addr(addr), .RX_P_DATA(
        Rx_SYNC_OUT), .RX_D_VLD(RX_Valid_SYNC), .TX_P_DATA(TX_DATA_IN), 
        .TX_D_VLD(TX_D_VLD), .FIFO_FULL(FIFO_FULL) );
  INVX2M U2 ( .A(TX_Valid_SYNC), .Y(n1) );
  INVX4M U3 ( .A(n3), .Y(n2) );
  INVX2M U4 ( .A(SYNC_UART_RST), .Y(n3) );
endmodule

