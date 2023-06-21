module counter (input logic clk, input logic nrst, input logic enable, input logic clear, input logic clock_div, output [12:0]logic time_out)

  logic [6:0] time_next_s;
  logic [6:0] time_next_m;
  logic [6:0] minutes;
  logic [6:0] time_out_m, time_out_s;
  
  always_ff @ (posedge clk, negedge nrst) begin
    if (!nrst)
      time_next_s = 0;
    else
      time_out_s = time_next_s;
  end

  always_comb begin
    if (enable)
      time_next_s = time_out_s + 1;
    else if (clear)
      time_next_s = 0;
    else if (time_out == 60) begin
      time_next_s = 0;
      minutes = 1;
    end
  end 

  always_comb begin
    if (minutes == 1)
      minutes = minutes + 1;
    else
      time_next_m = minutes;
    time_out = {time_out_m, time_out_s};
  end

endmodule