module output_sel (
    input logic [11:0] timer, stopwatch, mem, 
    input logic [1:0] output_select,
    output logic [11:0] time_to_decode
);

    logic [5:0] sec, min;

    always_comb begin
    min = 0;
    sec = 0;
    case(output_select)
    1:time_to_decode = stopwatch;
    2:begin 
        time_to_decode = timer;
    end 
    3: time_to_decode = mem;
    default:time_to_decode = 0;
    endcase
    end 
endmodule