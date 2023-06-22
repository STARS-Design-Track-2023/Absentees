module timer (input logic clk, input logic nrst, input logic enable_dec, input logic enable_in, input logic clock_div, input logic lap, input logic clear, output time_up)

  logic [11:0] count_next, count;
  logic next_time_up;
  
  always_ff @ (posedge clk, negedge nrst) begin
    if (!nrst)
      count <= 0;
      time_up <= 0;
    else
      count <= count_next;
      time_up <= next_time_up;
  end

  always_comb begin
    count_next = count;
    next_time_up = time_up;
    if (enable_dec) begin
      if (enable_dec && (count == 0))
        next_time_up = 1;
      else
      count_next = count - clk_div;
    end
    else if (enable_in) begin
      if (lap)
        count_next = count + 30;

    end
    else if (clear) begin
        count_next = 0;
        next_time_up = 0;
    end
  end 

endmodule