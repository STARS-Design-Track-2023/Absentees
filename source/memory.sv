module memory (
  input logic clk, nrst,
  input logic [11:0] count, input logic read, input logic write, output logic [11:0] out);
  
  logic  [2:0][11:0] mem;
  logic  [2:0][11:0] next_mem;
  logic signed [3:0] addr, next_addr;
  logic [11:0]next_out;

  always_ff @ (posedge clk, negedge nrst) begin
    if (!nrst) begin
      addr <= -1;
      mem <= 'b0;
      //out <= 0;
    end
    else begin
      addr <= next_addr;
      mem <= next_mem;
      //out <= next_out;
    end
  end

  always_comb begin
    next_addr = addr;
    next_mem = mem;
    if (write) begin
	    next_addr = addr + 1;
      next_mem[addr + 1] = count;
    end
    if (read) begin
      if (addr == -1) begin
        next_addr = 0;
      end
      else begin
        next_addr = addr - 1;
      end
    end
	  if(addr >= 0)
    	  out = mem[addr + 1];
	  else
		    out = mem[0];
    end


endmodule
