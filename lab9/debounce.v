
module debounce(input  clk, input btn_input, output btn_output);

parameter DEBOUNCE_PERIOD = 1000000; /* 20 msec @ 50MHz */

reg [20:0] counter;
reg debounced_btn_state;
reg pressed;

assign btn_output = debounced_btn_state;

always@(posedge clk) begin
  if (btn_input == 0) begin
    counter <= 0;
    pressed <= 0;
  end else begin
    counter <= counter + 1;
    pressed <= (debounced_btn_state == 1)? 1 : 0;
  end
end

always@(posedge clk) begin
  // wait until the button is pressed continuously for 20 msec
  if (counter == DEBOUNCE_PERIOD && pressed == 0)
    debounced_btn_state <= 1;
  else
    debounced_btn_state <= (btn_input == 0)? 0 : btn_output;
end

endmodule
