`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:05:51 10/02/2015 
// Design Name: 
// Module Name:    traffic_light_hw 
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
module traffic_light_hw(
    input clk,
    input reset,
    output reg green_light , red_light, yellow_light,
	output reg [3:0] cnt 
    );
reg[1:0] state, next_state ;

parameter green = 2'b01 ,
			 red  = 2'b10  ,
			 yellow = 2'b11;
	

// FSM state control block 	
// sequential circuit 
always @ (posedge clk or negedge reset)
begin 
	if(!reset)	state <= green ;
	else 			state <= next_state ;
end 

// determine next state 
// combination circuit 
always @ (*)
begin
	case(state)
		green : 
			if(cnt== 4'd4)	next_state = yellow ;
			else 				next_state = green ;
		yellow:
		   if(cnt== 4'd6)	next_state = red ;
			else 				next_state = yellow ;
		red : 
			if(cnt== 4'd9)	next_state = green ;
			else 				next_state = red ;			
	endcase 
end 

// output 
always @ (*)
begin
	case(state)
		green : 
			begin 
				green_light = 1'b1 ;
				red_light 	= 1'b0 ;
				yellow_light 	= 1'b0 ;
				
			end
			yellow : 
			begin 
				green_light = 1'b0 ;
				red_light 	= 1'b0 ;
				yellow_light 	= 1'b1 ;
				
			end
		red : 
			begin 
				green_light = 1'b0 ;
				red_light 	= 1'b1 ;
				yellow_light 	= 1'b0 ;
			end		
	endcase 
end 

// counter 
always @ (posedge clk or negedge reset)
begin 
	if(!reset)					cnt <= 4'd0 ;
	else if(cnt== 4'd9)		cnt <= 4'd0 ;
	else 							cnt <= cnt + 4'd1 ;
end 

endmodule
