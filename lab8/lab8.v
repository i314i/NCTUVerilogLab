`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:19:13 11/09/2015 
// Design Name: 
// Module Name:    lab7 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: The sample top module of lab 7: sd card reader. The behavior of
//              this module is as follows
//              1. When the SD card is initialized, turns on all the LEDs.
//              2. The user must hit reset button to properly reset the SD controller
//              2. The user can then press the WEST button to trigger the sd card
//                 controller to read the super block of the sd card (located at
//                 block # 8192) into the SRAM memory.
//              3. The LED will then display the first byte of the super block, 0xeb.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module lab7(
    // General system I/O ports
    input  clk,
    input  reset,
	 input  ROT_A,
	 input  ROT_B,
    output [7:0] led
    );

reg print;
wire roevent;
wire right;
reg [24:0] counter;
reg [24:0] duty_counter;
reg [7:0] duty;
assign led = (print) ? 8'b11111111 : 8'b0;

Rotation_direction r1(
    .CLK(clk),
    .ROT_A(ROT_A),
    .ROT_B(ROT_B),
    .rotary_event(roevent),
    .rotary_right(right)
    );
//50000000 clock
//500000 clock per cycle
always @(posedge clk) begin
  if (reset || counter==500000)
    counter <= 0;
  else
    counter <= counter + 1;
end

always @(posedge clk) begin
  if (reset)
  begin
    duty <= 0;
	 duty_counter<=0;
	end
  else if(roevent && !right)
  begin
	if(duty!=100)
	begin
		duty<=duty+1;
		duty_counter<=duty*5000;
	end
	else
		duty_counter<=500000;
  end
  else if(roevent && right)
  begin
	if(duty!=0)
	begin
		duty<=duty-1;
		duty_counter<=duty*5000;
	end
	else
		duty_counter<=0;
  end
end

always @(posedge clk) begin
  if(counter<duty_counter)
		print<=1;
  else
		print<=0;
end

endmodule
