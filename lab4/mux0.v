`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:47:26 10/25/2015 
// Design Name: 
// Module Name:    mux0 
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
module Mux(clk,column,adder,ava,
i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,
i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,
i20,i21,i22,i23,i24,i25,i26,i27,i28,i29,
i30,i31);

input [6:0] column;
input clk,ava;
input [7:0] i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,
i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,
i20,i21,i22,i23,i24,i25,i26,i27,i28,i29,
i30,i31;
output reg [7:0] adder;

always@(posedge clk)
begin
   if(ava==1)
begin
    case(column)
    0: adder<=i0;
    1: adder<=i1;
    2: adder<=i2;
    3: adder<=i3;
    4: adder<=i4;
    5: adder<=i5;
    6: adder<=i6;
    7: adder<=i7;
    8: adder<=i8;
    9: adder<=i9;
    10: adder<=i10;
    11: adder<=i11;
    12: adder<=i12;
    13: adder<=i13;
    14: adder<=i14;
    15: adder<=i15;
    16: adder<=i16;
    17: adder<=i17;
    18: adder<=i18;
    19: adder<=i19;
    20: adder<=i20;
    21: adder<=i21;
    22: adder<=i22;
    23: adder<=i23;
    24: adder<=i24;
    25: adder<=i25;
    26: adder<=i26;
    27: adder<=i27;
    28: adder<=i28;
    29: adder<=i29;
    30: adder<=i30;
    31: adder<=i31;
    default adder<=0;
    endcase
end
end
endmodule
