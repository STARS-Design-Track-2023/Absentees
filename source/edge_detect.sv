module edge_detect (
    input logic async_in, clk, nrst,
    output logic pos_edge
);

    logic intermediate, edge_signal;

    always_ff @(posedge clk, negedge nrst) begin : blockName
        if(!nrst) begin

            intermediate <= 0;

        end else begin

            intermediate <= async_in;

        end
    end

    assign pos_edge = ~(intermediate) & async_in;

endmodule