module stopwatch (
    input logic clk, nrst, pb0, pb1,
    output logic [6:0] out_0, out_1, out_2, out_3
);

  logic [11:0]time_to_decode, timer_out, time_out;
  logic [5:0] out0,out1,out2,out3;
  logic button4, button5, edge5, edge4, intermediate5, intermediate4, clk_div;
  logic clear, enable, enable_decrement, enable_increment, read, write, time_up;
  logic [1:0] output_select;




  clkdiv ck (.clk(clk), .nrst(nrst), .secpulse(clk_div));
  edge_detect test (.clk(clk), .nrst(nrst), .async_in(pb1), .pos_edge(edge5));
  edge_detect testx (.clk(clk), .nrst(nrst), .async_in(pb0), .pos_edge(edge4));
  output_sel o1 (.timer(timer_out), .stopwatch(time_out), .mem(0), .output_select(output_select), .time_to_decode(time_to_decode));
  decoder test2 (.counter_out(time_to_decode), .out0(out0), .out1(out1), .out2(out2), .out3(out3));
  timer t1 (.clk(clk), .nrst(nrst), .enable_dec(enable_decrement), .enable_in(enable_increment), .clk_div(clk_div), .lap(edge5), .clear(clear), .time_up(time_up), .timer_out(timer_out));
  counter c1 (.clk(clk), .nrst(nrst), .enable(enable), .clock_div(clk_div), .clear(clear), .time_out(time_out));
  fsm f1 (.pb0(edge4), .pb1(edge5), .flag(time_up), .clear(clear), .enable(enable), .read(read), .write(write), .enable_increment(enable_increment), .enable_decrement(enable_decrement), .output_select(output_select), .clk(clk), .nrst(nrst) );
  encode e1 (.binary(out0), .sv_seg(out_0));
  encode e2 (.binary(out1), .sv_seg(out_1));
  encode e3 (.binary(out2), .sv_seg(out_2));
  encode e4 (.binary(out3), .sv_seg(out_3));
endmodule