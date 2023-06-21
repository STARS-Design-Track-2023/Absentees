module fsm (input logic pb0, pb1,
            output logic clear, enable, 
            read, write, enable_increment, 
            enable_decrement,
            output logic [1:0] output_select)
  typedef enum logic [3:0] {s0, s1, s2, s3, s4} state_t;
  logic [2:0] state, next_state;
  always_comb begin
    next_state = state;
    case(state)
      s0: begin //mode select state 
        if (pb0) //select stopwatch mode
            s1; 
        else if (pb1) //select timer mode 
            s2; 
        else //stay in state 
            s0;
      end
      s1: begin //stopwatch mode
        if (pb1) //lap 
            s3; 
        else if (pb0) //stop
            s4;
        else 
            s1;
      end
      s2: begin
        if ()
    endcase

    // if (state = s0)begin
    //     clear = 1; 
    //     enable = 0;
    //     read = 0;
    //     write = 0;
    //     enable_increment = 0;
    //     enable_decrement = 0;
    // end 
    // else if (state = s1)begin 
    //     clear = 0; 
    //     start = 1; 
    //     stop = 0;
    // end 
    // else if (state = s2)begin
    //     clear = 0;
    //     start = 0; 
    //     stop = 1;
    // end
  end
  assign clear = (state == s0);

  always_ff @ (posedge clk, negedge nrst) begin
    if (~nrst)
        state <=0;
    else 
        nextstate <= state;
  end
endmodule

/*
 state: begin
    if(reset)
        go somewhere
    else if(lap)
        go lap state
    else if(start / stop)
        =
    else 
        state = state
end 

*/