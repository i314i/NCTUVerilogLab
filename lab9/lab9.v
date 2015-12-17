`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:30:47 11/22/2015 
// Design Name: 
// Module Name:    lcd 
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
module lab9(
    input clk,
    input reset,
    input  button,
    output LCD_E,
    output LCD_RS,
    output LCD_RW,
    output [3:0]LCD_D
    );

    wire btn_level, btn_pressed;
    reg prev_btn_level;
    reg [127:0] row_A, row_B;
	 reg [35:0] counter;
	 
	 reg [10:0] primemap [200:0];
	 
	
	 
	 localparam [3:0] P_IDLE = 3'b000,P_INIT = 3'b001, P_OUT = 3'b010, P_IN = 3'b011;
	 reg  [2:0] P, P_next;
    
	 integer idx;
	 reg [10:0] idxreg;
	 reg [10:0] jdxreg;
	 reg [10:0] kdxreg;
	reg primes [1023:0];
	reg [10:0] ptr;
	reg [10:0] ptr2;
	reg direct;
	 reg primeset;
	 wire primeornot;
	assign primeornot = primes[idxreg];
	
	 wire [7:0] ch[9:0];
	 
    LCD_module lcd0( 
      .clk(clk),
      .reset(reset),
      .row_A(row_A),
      .row_B(row_B),
      .LCD_E(LCD_E),
      .LCD_RS(LCD_RS),
      .LCD_RW(LCD_RW),
      .LCD_D(LCD_D)
    );
    
    debounce btn_db0(
      .clk(clk),
      .btn_input(button),
      .btn_output(btn_level)
   );
	
	dec2char d2(
		.ina1(ptr),
		.ina2(primemap[ptr]),
		.inb1(ptr2),
		.inb2(primemap[ptr2]),
		.o0(ch[0]),
		.o1(ch[1]),
		.o2(ch[2]),
		.o3(ch[3]),
		.o4(ch[4]),
		.o5(ch[5]),
		.o6(ch[6]),
		.o7(ch[7]),
		.o8(ch[8]),
		.o9(ch[9])
	);
    
	 always @(posedge clk) begin
		if (reset)
		P <= P_INIT;
		else
		P <= P_next;
	end
	
	always @(*) begin // FSM next-state logic
  case (P)
	 P_IDLE:
	 if (primeset==0)P_next = P_INIT;
    else P_next = P_IDLE;
	 
    P_INIT: 
		P_next = P_OUT;
		
    P_OUT: 
	 if(idxreg<1024 && !primeornot) P_next = P_OUT;
	 else if(idxreg<1024 && primeornot) P_next = P_IN;
	 else P_next = P_IDLE;
	 
    P_IN: 
		if (jdxreg<1024)P_next = P_IN;
		else P_next = P_OUT;
  
  endcase
end

always @(posedge clk) begin
	if (P == P_INIT) begin
		primeset=0;
		idxreg = 0;
		kdxreg = 1;
		for (idx = 2; idx < 1024; idx = idx + 1)
				primes[idx] = 1;
	end
	else if (P == P_OUT && P_next==P_OUT)
		idxreg = idxreg + 1;
	else if (P == P_OUT && P_next==P_IN)
	begin
		jdxreg = idxreg+idxreg;
		primemap[kdxreg] = idxreg;
		kdxreg = kdxreg + 1;
	end
		
	else if (P == P_OUT && P_next==P_IDLE)
		primeset=1;
	else if (P == P_IN && P_next==P_IN)
	begin
			primes[jdxreg]=0;
			jdxreg = jdxreg+idxreg;
	end
	else if(P == P_IN && P_next==P_OUT)
		idxreg = idxreg + 1;
end
	 
    always @(posedge clk) begin
      if (reset)
        prev_btn_level <= 1;
      else
        prev_btn_level <= btn_level;
    end

    assign btn_pressed = (btn_level == 1 && prev_btn_level == 0)? 1 : 0;

	always @(posedge clk) begin
		if(reset)
		begin
			row_A <= 128'h5072696D652023303120697320303032; 
         row_B <= 128'h5072696D652023303220697320303033;
		end
      else if (counter==35000000 && primeset)
		begin
			row_A <= {56'h5072696D652023,ch[0],ch[1],32'h20697320,ch[2],ch[3],ch[4]};
         row_B <= {56'h5072696D652023,ch[5],ch[6],32'h20697320,ch[7],ch[8],ch[9]};
      end
    end
	 
	 always @(posedge clk) begin
      if (reset)
		begin
		   ptr <= 1;
			ptr2 <= 2;
		end
		else if(counter==35000000 && primeset && !direct)
		begin
			if(ptr==172)
				ptr <= 1;
			else
				ptr <= ptr + 1;
			if(ptr2==172)
				ptr2 <= 1;
			else
				ptr2 <= ptr2 + 1;
			
		end
		else if(counter==35000000 && primeset && direct)
		begin
			
			if(ptr==1)
				ptr <= 172;
			else
				ptr <= ptr - 1;
			if(ptr2==1)
				ptr2 <= 172;
			else
				ptr2 <= ptr2 - 1;

		end
    end
	 
	 always @(posedge clk) begin
      if (reset)
		begin
		   direct<=0;
		end
		else if(btn_pressed && direct)
		begin
			direct<=0;
		end
		else if(btn_pressed && !direct)
		begin
			direct<=1;
		end
    end
	 
	  always @(posedge clk) begin
      if (reset || counter==35000000)
		begin
			counter<=0;
		end
      else
        counter<= counter + 1;
    end

endmodule

module dec2char(
    input [10:0] ina1,
    input [10:0] ina2,
	 input [10:0] inb1,
	 input [10:0] inb2,
	 output [7:0] o0, o1, o2, o3, o4,
	 output [7:0] o5, o6, o7, o8, o9);

wire [7:0] c[0:15];

genvar i;
generate
for (i = 0; i < 10; i = i + 1) begin:number
    assign c[i] = i+48;
end
for (i = 10; i < 16; i = i + 1) begin:letter
    assign c[i] = i+55;
end
endgenerate

assign o0 = c[ina1[7:4]];
assign o1 = c[ina1[3:0]];
assign o2 = c[ina2[10:8]];
assign o3 = c[ina2[7:4]];
assign o4 = c[ina2[3:0]];

assign o5 = c[inb1[7:4]];
assign o6 = c[inb1[3:0]];
assign o7 = c[inb2[10:8]];
assign o8 = c[inb2[7:4]];
assign o9 = c[inb2[3:0]];

endmodule
