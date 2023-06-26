module stopwatch (
	input logic clk, nrst,
	input logic pb0, pb1,
	output logic [6:0] seg0, seg1, seg2, seg3 
);

	logic sync_pb0, sync_pb1;
	logic  read, write, clear, enable, enable_increment, enable_decrement;
	logic secpulse;

	sync_edge_detect PB0 (.clk(clk), .nrst(nrst), .async(pb0), .pos_edge(sync_pb0)); 
	sync_edge_detect PB1 (.clk(clk), .nrst(nrst), .async(pb1), .pos_edge(sync_pb1));

	state_machine FSM(
	.clk(clk),
	.nrst(nrst),
	.pb0(sync_pb0),
	.pb1(sync_pb1),
	.clear(clear),
	.read(read),
	.write(write),
	.enable_increment(enable_increment),
	.enable_decrement(enable_decrement),
	.output_select(output_sel),
	.enable(enable)
	);

	
	clkdiv CLK_DIV (
	.clk(clk),
	.nrst(nrst),
	.secpulse(secpulse)
	);

		
		
