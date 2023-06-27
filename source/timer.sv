module timer (input logic clk, input logic nrst, input logic enable_dec, input logic enable_in, input logic clk_div, input logic lap, input logic clear, output logic time_up, output logic [11:0] timer_out);

  logic [11:0] count_next, cnt;
  logic next_time_up;
  assign timer_out = cnt;
  always_ff @ (posedge clk, negedge nrst) begin
    if (!nrst) begin
      cnt <= 0;
      time_up <= 0;
    end 
    else begin
      cnt <= count_next;
      time_up <= next_time_up;
    end
  end

  always_comb begin
    count_next = cnt;
    next_time_up = time_up;
    if (enable_dec) begin
      if (enable_dec && (cnt == 0))
        next_time_up = 1;
      else
      count_next = cnt - {11'b0, clk_div};
    end
    else if (enable_in) begin
      if (lap)
        count_next = cnt + 30;

    end
    else if (clear) begin
        count_next = 0;
        next_time_up = 0;
    end
  end 

endmodule
