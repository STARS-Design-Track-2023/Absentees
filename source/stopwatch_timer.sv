module timer (input logic clk, input logic nrst, input logic enable_dec, input logic enable_in, input logic clock_div, input logic lap, input logic clear, output time_up)

  logic [2:0] time_next;
  
  always_ff @ (posedge clk, negedge nrst) begin
    if (!nrst)
      time = 0;
    else
      time = time_next;
  end

  always_comb begin
    if (enable_dec)
      if (enable_dec && (time == 0))
        time_up = 1;
      else
      time_next = time - clk_div;
    if else (enable_in)
      if (lap)
        time_next = time + 30;
      else
        time_next = time - clk_div;
    else if (clear) begin
      time_next = 0;
      time_up = 0;
    end
  end 

endmodule