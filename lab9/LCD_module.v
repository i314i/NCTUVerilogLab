module LCD_module(
    input clk,
    input reset,
    input [127:0] row_A,
    input [127:0] row_B,
    output reg LCD_E,
    output reg LCD_RS,     // register select 
    output reg LCD_RW,     // read / write 
    output reg [3:0] LCD_D // data
    );
    
    reg [23:0] count;
    
    always @ (posedge clk) begin 
      if (reset) begin
        count <= 0;
        LCD_D <= 4'h8;
        LCD_RW <= 1;
        LCD_RS <= 0;
        LCD_E <= 0;
      end
      else begin
        count <= (count[23:17] == 80) ? {7'd12, 17'd0} : (count + 1);
        case (count[23:17])
          //power on init 
          0  : LCD_D <= 4'h3;
          1  : LCD_D <= 4'h3;
          2  : LCD_D <= 4'h3;
          3  : LCD_D <= 4'h2;
          //function set 
          //send 00 and uper nibble 0010 then the lower nibble 10xx
          4  : LCD_D <= 4'h2;
          5  : LCD_D <= 4'h8;
          //entry mode 
          //send 00 and upper nibble 0000, then 00 and lower nibble 0 1 I/D S
          //last 2 bits of lower nibble : I/D bit (Incr 1, Decr 0) , S bit (shift 1 , no shift 0 )
          6  : LCD_D <= 4'h0;
          7  : LCD_D <= 4'h6;    // 0110 : Incr , shift disable 
          //Display On/Off
          //send 00 and uper nibble 0000, then 00 and lower nibble 1 D C B
          //D : 1 show char represented by code in DDR, 0 don't, but code remain ??
          //C : 1 show cursor, 0 don't 
          //B : 1 cursor blinks (if shown), 0 don't (if shown)
          8  : LCD_D <= 4'h0;    
          9  : LCD_D <= 4'hC;    // lower nibble 1100 (1 D C B)
          //clear display , 00 and upper nibble 0000, 00 and lower nibble 0001
          10 : LCD_D <= 4'h0;    // Clear Display, 00 and upper nibble 0000 
          11 : LCD_D <= 4'h1;    // 00 and lower nibble 0001
          //Characters are given out, the cursor will advance to the right
          //write data to DDRAM (or CG RAM)
          12 : LCD_D <= row_A[127:124];
          13 : LCD_D <= row_A[123:120];
          14 : LCD_D <= row_A[119:116];
          15 : LCD_D <= row_A[115:112];
          16 : LCD_D <= row_A[111:108];
          17 : LCD_D <= row_A[107:104];
          18 : LCD_D <= row_A[103:100];
          19 : LCD_D <= row_A[99 :96 ];
          20 : LCD_D <= row_A[95 :92 ];
          21 : LCD_D <= row_A[91 :88 ];
          22 : LCD_D <= row_A[87 :84 ];
          23 : LCD_D <= row_A[83 :80 ];
          24 : LCD_D <= row_A[79 :76 ];
          25 : LCD_D <= row_A[75 :72 ];
          26 : LCD_D <= row_A[71 :68 ];
          27 : LCD_D <= row_A[67 :64 ];
          28 : LCD_D <= row_A[63 :60 ];
          29 : LCD_D <= row_A[59 :56 ];
          30 : LCD_D <= row_A[55 :52 ];
          31 : LCD_D <= row_A[51 :48 ];
          32 : LCD_D <= row_A[47 :44 ];
          33 : LCD_D <= row_A[43 :40 ];
          34 : LCD_D <= row_A[39 :36 ];
          35 : LCD_D <= row_A[35 :32 ];
          36 : LCD_D <= row_A[31 :28 ];
          37 : LCD_D <= row_A[27 :24 ];
          38 : LCD_D <= row_A[23 :20 ];
          39 : LCD_D <= row_A[19 :16 ];
          40 : LCD_D <= row_A[15 :12 ];
          41 : LCD_D <= row_A[11 :8  ];
          42 : LCD_D <= row_A[7  :4  ];
          43 : LCD_D <= row_A[3  :0  ];
          //set RAM address 
          //position the cursor onto the start of  the 2nd line 
          //send 00 and upper nibble 1???, ??? is the hightest 3 bits of the DDR
          //address to move the cursor to, then 00 and lower 4 bits of the address
          //so ??? is 100 and then 0000 for h40
          44 : LCD_D <= 4'hC;
          45 : LCD_D <= 4'h0;
          //Characters are given out, the cursor will advance to the right
          //write data to DDRAM (or CG RAM)            
          46 : LCD_D <= row_B[127:124];
          47 : LCD_D <= row_B[123:120];
          48 : LCD_D <= row_B[119:116];
          49 : LCD_D <= row_B[115:112];
          50 : LCD_D <= row_B[111:108];
          51 : LCD_D <= row_B[107:104];
          52 : LCD_D <= row_B[103:100];
          53 : LCD_D <= row_B[99 :96 ];
          54 : LCD_D <= row_B[95 :92 ];
          55 : LCD_D <= row_B[91 :88 ];
          56 : LCD_D <= row_B[87 :84 ];
          57 : LCD_D <= row_B[83 :80 ];
          58 : LCD_D <= row_B[79 :76 ];
          59 : LCD_D <= row_B[75 :72 ];
          60 : LCD_D <= row_B[71 :68 ];
          61 : LCD_D <= row_B[67 :64 ];
          62 : LCD_D <= row_B[63 :60 ];
          63 : LCD_D <= row_B[59 :56 ];
          64 : LCD_D <= row_B[55 :52 ];
          65 : LCD_D <= row_B[51 :48 ];
          66 : LCD_D <= row_B[47 :44 ];
          67 : LCD_D <= row_B[43 :40 ];
          68 : LCD_D <= row_B[39 :36 ];
          69 : LCD_D <= row_B[35 :32 ];
          70 : LCD_D <= row_B[31 :28 ];
          71 : LCD_D <= row_B[27 :24 ];
          72 : LCD_D <= row_B[23 :20 ];
          73 : LCD_D <= row_B[19 :16 ];
          74 : LCD_D <= row_B[15 :12 ];
          75 : LCD_D <= row_B[11 :8  ];
          76 : LCD_D <= row_B[7  :4  ];
          77 : LCD_D <= row_B[3  :0  ];
          //set RAM address back
          78 : LCD_D <= 4'h8;
          79 : LCD_D <= 4'h0;
          //read busy flag
          default: LCD_D <= 4'h8;
        endcase 
        LCD_E <= count[16];
        LCD_RS <= ( (count[23:17] > 11 && count[23:17] < 44) || (count[23:17] > 45 && count[23:17] < 78) ) ? 1 : 0;
        LCD_RW <= (count[23:17] == 80) ? 1 : 0;
      end
    end 
endmodule 