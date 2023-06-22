module memory (input logic count, input logic read, input logic write, output logic out)

  logic [4:0] [11:0] mem, next_mem;
  logic signed [3:0] add, next_add;

  always_ff @ (posedge clk, negedge nrst) begin
    if (!nrst) begin
      add <= -1;
      mem <= 0;
    end
    else begin
      add <= next_add;
      mem <= next_mem;
    end
  end

  always_comb begin
    next_add = add;
    mext_mem = mem;
    if (write) begin
      next_mem[add] = count;
      next_add = add + 1;
    end
    if (read) begin
      if (add == -1) begin
        next_add = 0;
      end
      else begin
        next_add = add - 1;
      end
    end
    out = mem[add];
  end

endmodule