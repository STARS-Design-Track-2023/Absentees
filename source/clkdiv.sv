module clkdiv (input logic clk, nrst
               output logic nxt_count, nxt_secpulse, count, pulse, nxt_pulse)
always_ff @ (posedge clk, negedge nrst) begin
    if (!nrst) begin 
        nxt_count = count + 1;
        nxt_secpulse = 0;
        if (count == 10000000) begin
            nxt_count = 0;
            nxt_pulse = 1;
            pulse = nxt_pulse;
        end
    end
end


endmodule