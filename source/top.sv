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
//   logic [11:0]time_to_decode, timer_out, time_out;
//   logic [5:0] out0,out1,out2,out3;
//   logic button4, button5, edge5, edge4, intermediate5, intermediate4, nrst, clk_div;
//   logic clear, enable, enable_decrement, enable_increment, read, write, time_up;
//   logic [1:0] output_select;
//         assign nrst = ~reset;
        // always_ff @(posedge hwclk, negedge nrst) begin 
        // if(!nrst) begin

        //     intermediate5 <= 0;
        //     button5 <= 0;
        //     intermediate4 <= 0;
        //     button4 <= 0;

        // end else begin

        //     intermediate5 <= pb[5];
        //     button5 <= intermediate5;
        //     intermediate4 <= pb[4];
        //     button4 <= intermediate4;

        // end
        // end
 stopwatch s1 (.clk(hwclk), .nrst(~reset), .pb0(pb[0]), .pb1(pb[1]), .out_0(ss0[6:0]), .out_1(ss1[6:0]), .out_2(ss2[6:0]), .out_3(ss3[6:0]));
//   clkdiv ck (.clk(hwclk), .nrst(~reset), .secpulse(clk_div));
//   edge_detect test (.clk(hwclk), .nrst(~reset), .async_in(pb[5]), .pos_edge(edge5));
//   edge_detect testx (.clk(hwclk), .nrst(~reset), .async_in(pb[4]), .pos_edge(edge4));
//   output_sel o1 (.timer(timer_out), .stopwatch(time_out), .mem(0), .output_select(output_select), .time_to_decode(time_to_decode));
//   decoder test2 (.counter_out(time_to_decode), .out0(out0), .out1(out1), .out2(out2), .out3(out3));
//   timer t1 (.clk(hwclk), .nrst(~reset), .enable_dec(enable_decrement), .enable_in(enable_increment), .clk_div(clk_div), .lap(edge5), .clear(clear), .time_up(time_up), .timer_out(timer_out));
//   counter c1 (.clk(hwclk), .nrst(~reset), .enable(enable), .clock_div(clk_div), .clear(clear), .time_out(time_out));
//   fsm f1 (.pb0(edge4), .pb1(edge5), .flag(time_up), .clear(clear), .enable(enable), .read(read), .write(write), .enable_increment(enable_increment), .enable_decrement(enable_decrement), .output_select(output_select), .clk(hwclk), .nrst(nrst) );
//   encode e1 (.binary(out0), .sv_seg(ss0[6:0]));
//   encode e2 (.binary(out1), .sv_seg(ss1[6:0]));
//   encode e3 (.binary(out2), .sv_seg(ss2[6:0]));
//   encode e4 (.binary(out3), .sv_seg(ss3[6:0]));
//   assign {left[5:0], right[5:0]} = time_to_decode;
//   assign red = enable;
//   assign blue = time_up;
endmodule

