module memory (input logic [11:0] count, input logic read, input logic write, output logic out)

  logic [4:0] [11:0] mem, next_mem;
  logic signed [3:0] addr, next_addr;

  always_ff @ (posedge clk, negedge nrst) begin
    if (!nrst) begin
      addr <= -1;
      mem <= 0;
    end
    else begin
      addr <= next_addr;
      mem <= next_mem;
    end
  end

  always_comb begin
    next_addr = addr;
    mext_mem = mem;
    if (write) begin
	  next_add = add + 1;
      next_mem[addr] = count;
    end
    if (read) begin
      if (addr == -1) begin
        next_add = 0;
      end
      else begin
        next_addr = add - 1;
      end
    end
	if(addr != -1)
    	out = mem[addr];
	else
		out = mem[0];
  end

endmodule
