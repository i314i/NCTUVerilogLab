`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:34:12 10/23/2015 
// Design Name: 
// Module Name:    shiftRegister 
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
module shiftRegister(
    input clk,
    input rst,
    output [7:0] led
    );

	wire [7:0] in0, in1, in2, in3, in4, in5, in6, in7;
   reg [7:0] data0[0:31];
	reg [7:0] data1[0:31];
	reg [7:0] data2[0:31];
	reg [7:0] data3[0:31];
	reg [7:0] data4[0:31];
	reg [7:0] data5[0:31];
	reg [7:0] data6[0:31];
	reg [7:0] data7[0:31];

	reg dataokreg = 1;
	reg [6:0] shiftTimes =0;
	reg data_available; // you must modify this in your code
	reg [7:0] outputreg[0:7];
	assign in0=outputreg[0];
	assign in1=outputreg[1];
	assign in2=outputreg[2];
	assign in3=outputreg[3];
	assign in4=outputreg[4];
	assign in5=outputreg[5];
	assign in6=outputreg[6];
	assign in7=outputreg[7];
	
	integer i;
	reg [31:0] sum;
	wire [31:0]sum_wire;
	assign led = sum[15:8];
	
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
		.sum(sum_wire)
	);

  /*always @(posedge clk)
  begin
  sum <= sum_wire;
    if (rst) begin
      `include "data.dat"
		dataokreg<=1;
		shiftTimes<=0;
		outputreg[0]<=0;
		outputreg[1]<=0;
		outputreg[2]<=0;
		outputreg[3]<=0;
		outputreg[4]<=0;
		outputreg[5]<=0;
		outputreg[6]<=0;
		outputreg[7]<=0;
    end
	 else if(dataokreg==1 && shiftTimes<32)
	 begin
		outputreg[0]<=data0[0];
		outputreg[1]<=data1[0];
		outputreg[2]<=data2[0];
		outputreg[3]<=data3[0];
		outputreg[4]<=data4[0];
		outputreg[5]<=data5[0];
		outputreg[6]<=data6[0];
		outputreg[7]<=data7[0];
		for(i=1;i<31;i=i+1)
		begin
			data0[i]<=data0[i+1];
			data1[i]<=data1[i+1];
			data2[i]<=data2[i+1];
			data3[i]<=data3[i+1];
			data4[i]<=data4[i+1];
			data5[i]<=data5[i+1];
			data6[i]<=data6[i+1];
			data7[i]<=data7[i+1];
		end
		shiftTimes<=shiftTimes+1;
	 end
	 
	 else if(shiftTimes==32)
	 begin
		shiftTimes<=0;
		dataokreg<=0;
		sum<=sum+128;
	 end
	end*/
	
	always @(posedge clk)
	begin
		sum <= sum_wire;
    if (rst) begin
      `include "data.dat"
      sum<=0;
      shiftTimes<=0;
      data_available = 1;
	  outputreg[0]<=0;
		outputreg[1]<=0;
		outputreg[2]<=0;
		outputreg[3]<=0;
		outputreg[4]<=0;
		outputreg[5]<=0;
		outputreg[6]<=0;
		outputreg[7]<=0;
    end
	 else
    begin
      if(data_available==1)
	  begin
		outputreg[0]<=data0[0];
		outputreg[1]<=data1[0];
		outputreg[2]<=data2[0];
		outputreg[3]<=data3[0];
		outputreg[4]<=data4[0];
		outputreg[5]<=data5[0];
		outputreg[6]<=data6[0];
		outputreg[7]<=data7[0];
		for(i=0;i<31;i=i+1)
		begin
			data0[i]<=data0[i+1];
			data1[i]<=data1[i+1];
			data2[i]<=data2[i+1];
			data3[i]<=data3[i+1];
			data4[i]<=data4[i+1];
			data5[i]<=data5[i+1];
			data6[i]<=data6[i+1];
			data7[i]<=data7[i+1];
		end
		shiftTimes<=shiftTimes+1;
	 end
      if(data_available==1 && shiftTimes==32)
		begin
         shiftTimes<=0;
			data_available=0;
			sum<=sum+128;
		end
	 end
	end
	 

endmodule
