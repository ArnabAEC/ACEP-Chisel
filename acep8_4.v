module fa(
  input   io_a,
  input   io_b,
  input   io_cin,
  output  io_sum,
  output  io_cout
);
  wire  a_xor_b = io_a ^ io_b; // @[fa.scala 13:22]
  wire  a_and_b = io_a & io_b; // @[fa.scala 16:22]
  wire  b_and_cin = io_b & io_cin; // @[fa.scala 17:24]
  wire  a_and_cin = io_a & io_cin; // @[fa.scala 18:24]
  wire  _T_1 = a_and_b | b_and_cin; // @[fa.scala 19:22]
  assign io_sum = a_xor_b ^ io_cin; // @[fa.scala 14:10]
  assign io_cout = _T_1 | a_and_cin; // @[fa.scala 19:11]
endmodule
module block4(
  input  [3:0] io_a,
  input  [3:0] io_b,
  input        io_cin,
  output [3:0] io_sum,
  output       io_cout
);
  wire  f0_io_a; // @[block4.scala 20:16]
  wire  f0_io_b; // @[block4.scala 20:16]
  wire  f0_io_cin; // @[block4.scala 20:16]
  wire  f0_io_sum; // @[block4.scala 20:16]
  wire  f0_io_cout; // @[block4.scala 20:16]
  wire  f1_io_a; // @[block4.scala 27:16]
  wire  f1_io_b; // @[block4.scala 27:16]
  wire  f1_io_cin; // @[block4.scala 27:16]
  wire  f1_io_sum; // @[block4.scala 27:16]
  wire  f1_io_cout; // @[block4.scala 27:16]
  wire  f2_io_a; // @[block4.scala 34:16]
  wire  f2_io_b; // @[block4.scala 34:16]
  wire  f2_io_cin; // @[block4.scala 34:16]
  wire  f2_io_sum; // @[block4.scala 34:16]
  wire  f2_io_cout; // @[block4.scala 34:16]
  wire  f3_io_a; // @[block4.scala 41:16]
  wire  f3_io_b; // @[block4.scala 41:16]
  wire  f3_io_cin; // @[block4.scala 41:16]
  wire  f3_io_sum; // @[block4.scala 41:16]
  wire  f3_io_cout; // @[block4.scala 41:16]
  wire  x = io_a[3]; // @[block4.scala 13:15]
  wire  y = io_b[3]; // @[block4.scala 14:14]
  wire  z = io_a[2]; // @[block4.scala 15:14]
  wire  w = io_b[2]; // @[block4.scala 16:14]
  wire  _T = x & y; // @[block4.scala 18:13]
  wire  _T_1 = y & z; // @[block4.scala 18:19]
  wire  _T_2 = _T_1 & w; // @[block4.scala 18:21]
  wire  _T_3 = _T | _T_2; // @[block4.scala 18:16]
  wire  _T_4 = x & z; // @[block4.scala 18:27]
  wire  _T_5 = _T_4 & w; // @[block4.scala 18:29]
  wire [2:0] s2 = {f2_io_sum,f1_io_sum,f0_io_sum}; // @[Cat.scala 29:58]
  fa f0 ( // @[block4.scala 20:16]
    .io_a(f0_io_a),
    .io_b(f0_io_b),
    .io_cin(f0_io_cin),
    .io_sum(f0_io_sum),
    .io_cout(f0_io_cout)
  );
  fa f1 ( // @[block4.scala 27:16]
    .io_a(f1_io_a),
    .io_b(f1_io_b),
    .io_cin(f1_io_cin),
    .io_sum(f1_io_sum),
    .io_cout(f1_io_cout)
  );
  fa f2 ( // @[block4.scala 34:16]
    .io_a(f2_io_a),
    .io_b(f2_io_b),
    .io_cin(f2_io_cin),
    .io_sum(f2_io_sum),
    .io_cout(f2_io_cout)
  );
  fa f3 ( // @[block4.scala 41:16]
    .io_a(f3_io_a),
    .io_b(f3_io_b),
    .io_cin(f3_io_cin),
    .io_sum(f3_io_sum),
    .io_cout(f3_io_cout)
  );
  assign io_sum = {f3_io_sum,s2}; // @[block4.scala 49:9]
  assign io_cout = _T_3 | _T_5; // @[block4.scala 18:10]
  assign f0_io_a = io_a[0]; // @[block4.scala 21:10]
  assign f0_io_b = io_b[0]; // @[block4.scala 22:10]
  assign f0_io_cin = io_cin; // @[block4.scala 23:12]
  assign f1_io_a = io_a[1]; // @[block4.scala 28:10]
  assign f1_io_b = io_b[1]; // @[block4.scala 29:10]
  assign f1_io_cin = f0_io_cout; // @[block4.scala 31:12]
  assign f2_io_a = io_a[2]; // @[block4.scala 35:10]
  assign f2_io_b = io_b[2]; // @[block4.scala 36:10]
  assign f2_io_cin = f1_io_cout; // @[block4.scala 37:12]
  assign f3_io_a = io_a[3]; // @[block4.scala 42:10]
  assign f3_io_b = io_b[3]; // @[block4.scala 43:10]
  assign f3_io_cin = f2_io_cout; // @[block4.scala 44:12]
endmodule
module acep8_4(
  input        clock,
  input        reset,
  input  [7:0] io_a,
  input  [7:0] io_b,
  output [8:0] io_sum
);
  wire [3:0] b0_io_a; // @[acep8_4.scala 10:16]
  wire [3:0] b0_io_b; // @[acep8_4.scala 10:16]
  wire  b0_io_cin; // @[acep8_4.scala 10:16]
  wire [3:0] b0_io_sum; // @[acep8_4.scala 10:16]
  wire  b0_io_cout; // @[acep8_4.scala 10:16]
  wire [3:0] b1_io_a; // @[acep8_4.scala 19:16]
  wire [3:0] b1_io_b; // @[acep8_4.scala 19:16]
  wire  b1_io_cin; // @[acep8_4.scala 19:16]
  wire [3:0] b1_io_sum; // @[acep8_4.scala 19:16]
  wire  b1_io_cout; // @[acep8_4.scala 19:16]
  wire [1:0] _T_4 = {io_a[1],io_a[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_5 = {io_a[3],io_a[2]}; // @[Cat.scala 29:58]
  wire [1:0] _T_10 = {io_b[1],io_b[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_11 = {io_b[3],io_b[2]}; // @[Cat.scala 29:58]
  wire [3:0] sum1 = {b0_io_sum[3],b0_io_sum[2],b0_io_sum[1],b0_io_sum[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_22 = {io_a[5],io_a[4]}; // @[Cat.scala 29:58]
  wire [1:0] _T_23 = {io_a[7],io_a[6]}; // @[Cat.scala 29:58]
  wire [1:0] _T_28 = {io_b[5],io_b[4]}; // @[Cat.scala 29:58]
  wire [1:0] _T_29 = {io_b[7],io_b[6]}; // @[Cat.scala 29:58]
  wire [4:0] _T_36 = {b1_io_cout,b1_io_sum[3],b1_io_sum[2],b1_io_sum[1],b1_io_sum[0]}; // @[Cat.scala 29:58]
  block4 b0 ( // @[acep8_4.scala 10:16]
    .io_a(b0_io_a),
    .io_b(b0_io_b),
    .io_cin(b0_io_cin),
    .io_sum(b0_io_sum),
    .io_cout(b0_io_cout)
  );
  block4 b1 ( // @[acep8_4.scala 19:16]
    .io_a(b1_io_a),
    .io_b(b1_io_b),
    .io_cin(b1_io_cin),
    .io_sum(b1_io_sum),
    .io_cout(b1_io_cout)
  );
  assign io_sum = {_T_36,sum1}; // @[acep8_4.scala 29:9]
  assign b0_io_a = {_T_5,_T_4}; // @[acep8_4.scala 12:10]
  assign b0_io_b = {_T_11,_T_10}; // @[acep8_4.scala 14:10]
  assign b0_io_cin = 1'h0; // @[acep8_4.scala 15:12]
  assign b1_io_a = {_T_23,_T_22}; // @[acep8_4.scala 22:10]
  assign b1_io_b = {_T_29,_T_28}; // @[acep8_4.scala 24:10]
  assign b1_io_cin = b0_io_cout; // @[acep8_4.scala 25:12]
endmodule
