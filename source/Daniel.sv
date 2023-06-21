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
//sync_low u1(.clk(hz100), .n_rst(pb[0]), .async_in(pb[1]), .sync_out(right[0]));
//EdgeDetector u2(.clk(hz100), .n_rst(pb[0]), .async_in(pb[1]), .sync_out(right[0]));
decoder u3(.output_select([2:0]),  counter({12:7,6:0}));
endmodule




















// module sync_low ( input logic clk, n_rst, async_in, 
// output logic sync_out);

// always_ff @( posedge clk, negedge n_rst) begin
//   if ( ! n_rst)begin
//     sync_out <= 1'b0 ;
//   end 
//   else begin
//     sync_out <= async_in ;
//   end 
// end
// endmodule




// module EdgeDetector( input wire clk, n_rst, async_in,
//   output wire sync_out);
  
//   always @(posedge clk or posedge n_rst) begin
//     if (n_rst)
//       async_in <= 1'b0;
//     else
//       async_in <= sync_out;
//   end
  
//   assign edge_detected = sync_out & (~asyn_in);
  
// endmodule