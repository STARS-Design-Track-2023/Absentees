module counter (input logic clk, input logic nrst, input logic enable, input logic clear, input logic clock_div, output logic [11:0] time_out);

  logic [5:0] time_next_s;
  logic [5:0] time_next_m;
  logic  minutes, next_minutes;
  logic [5:0] time_out_m, time_out_s;
  always_ff @ (posedge clk, negedge nrst) begin
    if (!nrst) begin 
      time_out_s <= 0;
      time_out_m <= 0;
      minutes <= 0;
    end
    else begin
      time_out_s <= time_next_s;
      time_out_m <= time_next_m;
      minutes <= next_minutes;
    end
  end

  always_comb begin
    next_minutes = 0;
    time_next_s = time_out_s;
    if (enable)
      time_next_s = time_out_s + 1;
    else if (clear)
      time_next_s = 0;
    else if (time_out_s == 60) begin
      time_next_s = 0;
      next_minutes = 1;
    end
  end 

  always_comb begin
    if (minutes == 1)
      time_next_m = time_out_m + 1;
    else
      time_next_m = time_out_m;
    time_out = {time_out_m, time_out_s};
  end

endmodule