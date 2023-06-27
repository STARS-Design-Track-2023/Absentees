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
  logic [11:0]time_to_decode, timer_out, time_out;
  logic button4;
  // sync_edge_detect e1 (.clk(hwclk), .nrst(~reset), .async_in(pb[1]), .pos_edge(red));
  // sync_edge_detect e2 (.clk(hwclk), .nrst(~reset), .async_in(pb[0]), .pos_edge(green));

  // sync_edge_detect test (.clk(hwclk), .nrst(~reset), .async_in(pb[5]), .pos_edge(button4));
  output_sel out1 (.timer(timer_out), .stopwatch(time_out), .mem(timer_out), .output_select({pb[1], pb[0]}), .time_to_decode(time_to_decode));
  decoder test1 (.counter_out(time_to_decode), .out0(ss0[6:0]), .out1(ss1[6:0]), .out2(ss2[6:0]), .out3(ss3[6:0])) ;
  timer t1 (.clk(hwclk), .nrst(~reset), .enable_dec(pb[2]), .enable_in(pb[3]), .clk_div(pb[4]), .lap(pb[5]), .clear(pb[6]), .time_up(blue), .timer_out(timer_out));
  counter c1 (.clk(hwclk), .nrst(~reset), .enable(pb[2]), .clock_div(pb[4]), .clear(pb[6]), .time_out(time_out));
  assign {left[5:0], right[5:0]} = time_to_decode;
endmodule



module sync_edge_detect (
    input logic async_in, clk, nrst,
    output logic pos_edge
);

    logic intermediate, sync, edge_signal;

    always_ff @( posedge clk, negedge nrst ) begin : blockName
        if(!nrst) begin
            sync <= 0;
            intermediate <= 0;
            edge_signal <= 0;
        end
        else begin
            sync <= intermediate;
            intermediate <= async_in;
            edge_signal <= sync;
        end
    end
    always_comb begin
        pos_edge = ~(edge_signal) & sync;
    end 

endmodule