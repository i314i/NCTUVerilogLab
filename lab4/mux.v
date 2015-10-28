`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:51:51 10/16/2015 
// Design Name: 
// Module Name:    data_template 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module data_template(input clk, input rst, output [31:0] sum);

	wire [7:0] in0, in1, in2, in3, in4, in5, in6, in7;
   reg [7:0] data0[0:31];
	reg [7:0] data1[0:31];
	reg [7:0] data2[0:31];
	reg [7:0] data3[0:31];
	reg [7:0] data4[0:31];
	reg [7:0] data5[0:31];
	reg [7:0] data6[0:31];
	reg [7:0] data7[0:31];
   reg data_available=0;
   reg [6:0] count=0;
   wire [31:0] temp;
   assign sum = (data_available) ? 0 : (temp+128)>>8;
	adder_tree add (
		.clk(clk),
		.rst(rst),
		.in_valid(data_available),
		.in0(in0),
		.in1(in1),
		.in2(in2),
		.in3(in3),
		.in4(in4),
		.in5(in5),
		.in6(in6),
		.in7(in7),
		.sum(temp)
	);
   
     Mux mux0(
    .clk(clk),.column(count),.adder(in0),.ava(data_available),
    .i0(data0[0]),
    .i1(data0[1]),
    .i2(data0[2]),
    .i3(data0[3]),
    .i4(data0[4]),
    .i5(data0[5]),
    .i6(data0[6]),
    .i7(data0[7]),
    .i8(data0[8]),
    .i9(data0[9]),
    .i10(data0[10]),
    .i11(data0[11]),
    .i12(data0[12]),
    .i13(data0[13]),
    .i14(data0[14]),
    .i15(data0[15]),
    .i16(data0[16]),
    .i17(data0[17]),
    .i18(data0[18]),
    .i19(data0[19]),
    .i20(data0[20]),
    .i21(data0[21]),
    .i22(data0[22]),
    .i23(data0[23]),
    .i24(data0[24]),
    .i25(data0[25]),
    .i26(data0[26]),
    .i27(data0[27]),
    .i28(data0[28]),
    .i29(data0[29]),
    .i30(data0[30]),
    .i31(data0[31]));
    
  Mux mux1(
      .clk(clk),.column(count),.adder(in1),.ava(data_available),
		.i0(data1[0]),
		.i1(data1[1]),
		.i2(data1[2]),
		.i3(data1[3]),
		.i4(data1[4]),
		.i5(data1[5]),
		.i6(data1[6]),
		.i7(data1[7]),
		.i8(data1[8]),
		.i9(data1[9]),
		.i10(data1[10]),
		.i11(data1[11]),
		.i12(data1[12]),
		.i13(data1[13]),
		.i14(data1[14]),
		.i15(data1[15]),
		.i16(data1[16]),
		.i17(data1[17]),
		.i18(data1[18]),
		.i19(data1[19]),
		.i20(data1[20]),
		.i21(data1[21]),
		.i22(data1[22]),
		.i23(data1[23]),
		.i24(data1[24]),
		.i25(data1[25]),
		.i26(data1[26]),
		.i27(data1[27]),
		.i28(data1[28]),
		.i29(data1[29]),
		.i30(data1[30]),
		.i31(data1[31]));
      
  Mux mux2(
      .clk(clk),.column(count),.adder(in2),.ava(data_available),
		.i0(data2[0]),
		.i1(data2[1]),
		.i2(data2[2]),
		.i3(data2[3]),
		.i4(data2[4]),
		.i5(data2[5]),
		.i6(data2[6]),
		.i7(data2[7]),
		.i8(data2[8]),
		.i9(data2[9]),
		.i10(data2[10]),
		.i11(data2[11]),
		.i12(data2[12]),
		.i13(data2[13]),
		.i14(data2[14]),
		.i15(data2[15]),
		.i16(data2[16]),
		.i17(data2[17]),
		.i18(data2[18]),
		.i19(data2[19]),
		.i20(data2[20]),
		.i21(data2[21]),
		.i22(data2[22]),
		.i23(data2[23]),
		.i24(data2[24]),
		.i25(data2[25]),
		.i26(data2[26]),
		.i27(data2[27]),
		.i28(data2[28]),
		.i29(data2[29]),
		.i30(data2[30]),
		.i31(data2[31]));
      
  Mux mux3(
      .clk(clk),.column(count),.adder(in3),.ava(data_available),
		.i0(data3[0]),
		.i1(data3[1]),
		.i2(data3[2]),
		.i3(data3[3]),
		.i4(data3[4]),
		.i5(data3[5]),
		.i6(data3[6]),
		.i7(data3[7]),
		.i8(data3[8]),
		.i9(data3[9]),
		.i10(data3[10]),
		.i11(data3[11]),
		.i12(data3[12]),
		.i13(data3[13]),
		.i14(data3[14]),
		.i15(data3[15]),
		.i16(data3[16]),
		.i17(data3[17]),
		.i18(data3[18]),
		.i19(data3[19]),
		.i20(data3[20]),
		.i21(data3[21]),
		.i22(data3[22]),
		.i23(data3[23]),
		.i24(data3[24]),
		.i25(data3[25]),
		.i26(data3[26]),
		.i27(data3[27]),
		.i28(data3[28]),
		.i29(data3[29]),
		.i30(data3[30]),
		.i31(data3[31]));
      
  Mux mux4(
      .clk(clk),.column(count),.adder(in4),.ava(data_available),
		.i0(data4[0]),
		.i1(data4[1]),
		.i2(data4[2]),
		.i3(data4[3]),
		.i4(data4[4]),
		.i5(data4[5]),
		.i6(data4[6]),
		.i7(data4[7]),
		.i8(data4[8]),
		.i9(data4[9]),
		.i10(data4[10]),
		.i11(data4[11]),
		.i12(data4[12]),
		.i13(data4[13]),
		.i14(data4[14]),
		.i15(data4[15]),
		.i16(data4[16]),
		.i17(data4[17]),
		.i18(data4[18]),
		.i19(data4[19]),
		.i20(data4[20]),
		.i21(data4[21]),
		.i22(data4[22]),
		.i23(data4[23]),
		.i24(data4[24]),
		.i25(data4[25]),
		.i26(data4[26]),
		.i27(data4[27]),
		.i28(data4[28]),
		.i29(data4[29]),
		.i30(data4[30]),
		.i31(data4[31]));
  Mux mux5(
      .clk(clk),.column(count),.adder(in5),.ava(data_available),
		.i0(data5[0]),
		.i1(data5[1]),
		.i2(data5[2]),
		.i3(data5[3]),
		.i4(data5[4]),
		.i5(data5[5]),
		.i6(data5[6]),
		.i7(data5[7]),
		.i8(data5[8]),
		.i9(data5[9]),
		.i10(data5[10]),
		.i11(data5[11]),
		.i12(data5[12]),
		.i13(data5[13]),
		.i14(data5[14]),
		.i15(data5[15]),
		.i16(data5[16]),
		.i17(data5[17]),
		.i18(data5[18]),
		.i19(data5[19]),
		.i20(data5[20]),
		.i21(data5[21]),
		.i22(data5[22]),
		.i23(data5[23]),
		.i24(data5[24]),
		.i25(data5[25]),
		.i26(data5[26]),
		.i27(data5[27]),
		.i28(data5[28]),
		.i29(data5[29]),
		.i30(data5[30]),
		.i31(data5[31]));   
      
  Mux mux6(
      .clk(clk),.column(count),.adder(in6),.ava(data_available),
		.i0(data6[0]),
		.i1(data6[1]),
		.i2(data6[2]),
		.i3(data6[3]),
		.i4(data6[4]),
		.i5(data6[5]),
		.i6(data6[6]),
		.i7(data6[7]),
		.i8(data6[8]),
		.i9(data6[9]),
		.i10(data6[10]),
		.i11(data6[11]),
		.i12(data6[12]),
		.i13(data6[13]),
		.i14(data6[14]),
		.i15(data6[15]),
		.i16(data6[16]),
		.i17(data6[17]),
		.i18(data6[18]),
		.i19(data6[19]),
		.i20(data6[20]),
		.i21(data6[21]),
		.i22(data6[22]),
		.i23(data6[23]),
		.i24(data6[24]),
		.i25(data6[25]),
		.i26(data6[26]),
		.i27(data6[27]),
		.i28(data6[28]),
		.i29(data6[29]),
		.i30(data6[30]),
		.i31(data6[31]));

        Mux mux7(
      .clk(clk),.column(count),.adder(in7),.ava(data_available),
		.i0(data7[0]),
		.i1(data7[1]),
		.i2(data7[2]),
		.i3(data7[3]),
		.i4(data7[4]),
		.i5(data7[5]),
		.i6(data7[6]),
		.i7(data7[7]),
		.i8(data7[8]),
		.i9(data7[9]),
		.i10(data7[10]),
		.i11(data7[11]),
		.i12(data7[12]),
		.i13(data7[13]),
		.i14(data7[14]),
		.i15(data7[15]),
		.i16(data7[16]),
		.i17(data7[17]),
		.i18(data7[18]),
		.i19(data7[19]),
		.i20(data7[20]),
		.i21(data7[21]),
		.i22(data7[22]),
		.i23(data7[23]),
		.i24(data7[24]),
		.i25(data7[25]),
		.i26(data7[26]),
		.i27(data7[27]),
		.i28(data7[28]),
		.i29(data7[29]),
		.i30(data7[30]),
		.i31(data7[31]));
	
  always @(posedge clk)
    if (rst) begin
      `include "data.dat"
      count<=0;
      data_available = 1;
    end
	 else
    begin
      if(data_available==1)
      count<=count+1;
      if(count==31)
      data_available=0;
    end
endmodule
