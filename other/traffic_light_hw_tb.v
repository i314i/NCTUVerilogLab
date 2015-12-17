`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:06:19 10/02/2015
// Design Name:   traffic_light_hw
// Module Name:   C:/Users/hung/Desktop/ise/ise/tb_traffic_light_hw.v
// Project Name:  ise
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: traffic_light_hw
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_traffic_light_hw;

	// Inputs 
	reg clk;
	reg reset;

	// Outputs
	wire green_light;
	wire red_light;
	wire yellow_light;
	wire [3:0] cnt;

	// Instantiate the Unit Under Test (UUT)
	traffic_light_hw uut (
		.clk(clk), 
		.reset(reset), 
		.green_light(green_light), 
		.red_light(red_light), 
		.yellow_light(yellow_light), 
		.cnt(cnt)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;

		#10;
      reset = 0;  
		#20 
		reset = 1;
		// Add stimulus here
		
		#500 ;
		$finish ;
	end
	
	always
		begin
		#10 clk = !clk;
	end	
      
endmodule

