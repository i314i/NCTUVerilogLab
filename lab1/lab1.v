`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:12:41 09/24/2015 
// Design Name: 
// Module Name:    lab1project 
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
module lab1project(
    );


endmodule

//-----------new subtractor-------------------
module sub(A,B,Comin,Cin,S,comover);
input [7:0] A, B;
input Comin;
input Cin;
output [8:0] S;
output comover;
wire [8:0] Bout;
wire [7:0] t;
wire [7:0] t2;
wire temp;

com_1bit com0(.B(B[0]), .Comin(Comin), .Bout(Bout[0]), .Comout(t[0]) );
com_1bit com1(.B(B[1]), .Comin(t[0]), .Bout(Bout[1]), .Comout(t[1]) );
com_1bit com2(.B(B[2]), .Comin(t[1]), .Bout(Bout[2]), .Comout(t[2]) );
com_1bit com3(.B(B[3]), .Comin(t[2]), .Bout(Bout[3]), .Comout(t[3]) );
com_1bit com4(.B(B[4]), .Comin(t[3]), .Bout(Bout[4]), .Comout(t[4]) );
com_1bit com5(.B(B[5]), .Comin(t[4]), .Bout(Bout[5]), .Comout(t[5]) );
com_1bit com6(.B(B[6]), .Comin(t[5]), .Bout(Bout[6]), .Comout(t[6]) ); 
com_1bit com7(.B(B[7]), .Comin(t[6]), .Bout(Bout[7]), .Comout(t[7]) );
com_1bit com8(.B(B[7]), .Comin(t[7]), .Bout(Bout[8]), .Comout(comover) );
FA_1bit FA0(.A(A[0]), .B(Bout[0]), .Cin(Cin), .S(S[0]), .Cout(t2[0]));
FA_1bit FA1(.A(A[1]), .B(Bout[1]), .Cin(t2[0]), .S(S[1]), .Cout(t2[1]));
FA_1bit FA2(.A(A[2]), .B(Bout[2]), .Cin(t2[1]), .S(S[2]), .Cout(t2[2]));
FA_1bit FA4(.A(A[3]), .B(Bout[3]), .Cin(t2[2]), .S(S[3]), .Cout(t2[3]));
FA_1bit FA5(.A(A[4]), .B(Bout[4]), .Cin(t2[3]), .S(S[4]), .Cout(t2[4]));
FA_1bit FA6(.A(A[5]), .B(Bout[5]), .Cin(t2[4]), .S(S[5]), .Cout(t2[5]));
FA_1bit FA7(.A(A[6]), .B(Bout[6]), .Cin(t2[5]), .S(S[6]), .Cout(t2[6]));
FA_1bit FA8(.A(A[7]), .B(Bout[7]), .Cin(t2[6]), .S(S[7]), .Cout(t2[7])); 
FA_1bit FA9(.A(A[7]), .B(Bout[8]), .Cin(t2[7]), .S(S[8]), .Cout(temp));

endmodule


// ----------------- A 1-bit full adder ----------------------------- 
module FA_1bit(A, B, Cin, S, Cout);
input A, B, Cin;
output S, Cout;
assign S = Cin ^ A ^ B;
assign Cout = (A & B) | (Cin & B) | (Cin & A);
endmodule

// ----------------- A 1-bit complement ----------------------------- 
module com_1bit(B, Comin, Bout, Comout);
input B, Comin;
output Bout, Comout;
assign Bout=B^Comin;
assign Comout=(B^Comin)|Comin;
endmodule
