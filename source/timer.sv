module timer (input logic clk, input logic nrst, input logic enable_dec, input logic enable_in, input logic clk_div, input logic lap, input logic clear, output logic time_up, output logic [11:0] timer_out);

  logic [11:0] count_next, cnt, dummy;
  logic next_time_up;
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

    if (clear) begin
        count_next = 0;
        next_time_up = 0;
    end
    else if (enable_dec) begin
      if (enable_dec && (cnt == 0))
        next_time_up = 1;
      else
      count_next = cnt - {11'b0, clk_div};
    end
    else if (enable_in) begin
      if (lap)
        count_next = cnt + 30;

    end

    {dummy[5:0], timer_out[5:0]} = cnt % 60;
    {dummy[5:0], timer_out[11:6]} = cnt / 60;    
  end 

endmodule
