`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:55:04 11/12/2015 
// Design Name: 
// Module Name:    clk_500khz 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:    Divider the input clock by 100 to generate a 500 khz clock
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clk_500khz(input clk, input reset, input divider output reg clk500k);

reg [7:0] divider;

always @(posedge clk)
begin
  if (reset)
    clk500k <= 0;
  else
    clk500k <= (divider < 50)? 1 : 0;
end

always @(posedge clk)
begin
  if (reset)
    divider <= 0;
  else
    divider <= (divider == 99)? 0 : divider + 1;
end

endmodule
