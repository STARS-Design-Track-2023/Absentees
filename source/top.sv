`default_nettype none

module top 
(
  // I/O ports
  input  logic hwclk, reset,
  input  logic [20:0] pb,
  output logic [7:0] left, right,
         ss7, ss6, ss5, ss4, ss3, ss2, ss1, ss0,
  output logic red, green, blue,

  // UART ports
  output logic [7:0] txdata,
  input  logic [7:0] rxdata,
  output logic txclk, rxclk,
  input  logic txready, rxready
);
       logic pb1, pb2;
       edge_detect e1 (.clk(hwclk), .nrst(~reset), .async_in(pb[0]), .pos_edge(pb0));
       edge_detect e2 (.clk(hwclk), .nrst(~reset), .async_in(pb[1]), .pos_edge(pb0));
       fsm FSM (.clk(hwclk), .nrst(~reset), .pb1(pb1), .pb0(pb0), .clear(red), .read(blue), .write(green), .enable_increment(right[0]), .enable_decrement(right[1]), 
       .output_select(right[3:2]));

endmodule

