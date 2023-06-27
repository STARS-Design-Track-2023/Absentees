module sync_edge_detect (
    input logic async_in, clk, nrst,
    output logic pos_edge
);

    logic intermediate, sync, edge_signal;

    always_ff @(posedge clk, negedge nrst) begin : blockName
        if(!nrst) begin
            sync <= 0;
            intermediate <= 0;
            edge_signal <= 0;
        end else begin
            sync <= intermediate;
            intermediate <= async_in;
            edge_signal <= sync;
        end
    end

    assign pos_edge = ~(edge_signal) & sync;

endmodule