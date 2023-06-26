module output_sel (
    input logic [11:0] timer, stopwatch, mem, 
    input logic [1:0] output_sel,
    output logic [11:0] time_to_decode
);

    logic [6:0] sec, min;
    case(output_sel)
    1:time_to_decode = stopwatch;
    2:time_to_decode = mem;
    3:begin 
        sec = timer % 60;
        min = timer / 60;
        time_to_decode = {min, sec};
    end 
    default:time_to_decode = 0;
    endcase
    
endmodule
