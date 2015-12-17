`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:09:27 10/02/2015
// Design Name:   RING_COUNTER
// Module Name:   C:/IC_design_TA/ISE_workspace/class_lab2_solution/RING_COUNTER_tb.v
// Project Name:  class_lab2_solution
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RING_COUNTER
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RING_COUNTER_tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [3:0] counter;

	// Instantiate the Unit Under Test (UUT)
	RING_COUNTER uut (
		.clk(clk), 
		.rst(rst), 
		.t0(counter[0]),
		.t1(counter[1]),
		.t2(counter[2]),
		.t3(counter[3])
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
		rst = 0;


        
		// Add stimulus here
		#1000;
		$finish;

	end
   always
	begin
		#10 clk  = !clk;
		
	end
	
endmodule

