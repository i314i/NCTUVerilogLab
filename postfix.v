`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:23:36 10/09/2015 
// Design Name: 
// Module Name:    postfix 
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
module postfix(
	input CLK, RESET, IN_VALID=0, OP_MODE,
   input [3:0] IN,
   
	output reg OUT_VALID=0,
	output reg [15:0] OUT
);

reg[4:0] ptr;
reg[15:0] stack [0:32];
reg [15:0] tmp;
reg [1:0]count=0;

parameter add = 4'b0001,
			 sub  = 4'b0010,
			 mul = 4'b0100;
always @ (*)
begin 
	if(!RESET)
		begin
			ptr<=2'b00000;
		end
end

always @ (posedge CLK or negedge RESET)
begin 
	if(IN_VALID)
	begin
	if(!OP_MODE)
		begin
			stack[ptr]<=IN;
			ptr<=ptr+2'b00001;
		end
	else
		begin
			case(IN)
				add:
					stack[ptr-2]=stack[ptr-1]+stack[ptr-2];				
				sub:
					stack[ptr-2]=stack[ptr-2]-stack[ptr-1];
				mul:
					stack[ptr-2]=stack[ptr-1]*stack[ptr-2];
			endcase
			ptr<=ptr-2'b00001;
		end
	end
end

always @ (negedge IN_VALID)
begin 
	if(!IN_VALID && ptr!=2'b00000)
		OUT_VALID<=1'b1;
end

always @ (*)
begin 
	OUT<=stack[ptr-1];
end

always @ (posedge CLK)
begin 
	if(OUT_VALID)
		count=count+1;
	if(count==2'b10)
		begin
			OUT_VALID=0;
			count=0;
		end
end 

endmodule

