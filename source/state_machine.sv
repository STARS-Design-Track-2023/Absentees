module fsm (input logic pb0, pb1, flag, clk, nrst,
            output logic clear, enable, 
            read, write, enable_increment, 
            enable_decrement,
            output logic [1:0] output_select); 

  typedef enum logic [4:0] {mode_select, clear, stop_watch, last_time, cycle_through, wait, _input, timer, time_up} state_t;
  logic [2:0] state, next_state;
  
  


  always_comb begin
    next_state = state;
    case(state)
      mode_select: begin
        if (pb0)
            next_state = clear;
        else if (pb1)
            next_state = _input;
        else 
            next_state = mode_select;
      end
      clear: next_state = stop_watch;
      stop_watch: begin
        if (pb0)
            next_state = last_time;
        else if (pb1)
            next_state = save;
        else 
            next_state =stop_watch;
      end
      save: next_state = stop_watch;
      last_time: begin
        if (pb0)
            next_state = cycle_through;
        else
            next_state = last_time;
      end
      cycle_through: next_state = wait;
      wait: begin
        if (pb0)
          next_state = mode_select;
        else if (pb1)
          next_state = cycle_through;
        else
          next_sate = wait;
      end 
      _input: begin
        if (pb1)
            next_state = timer;
        else 
            next_state = _input;
      end
      timer: begin
        if (flag)
            next_state = time_up;
        else
            next_state = timer;
      end
      time_up: begin
        if (pb0)
            next_state = mode_select;
        else
            next_state = time_up;
      end

    endcase


  end
  assign clear = (state == clear) || (state == mode_select);
  assign enable = (state == stopwatch) || (state == save);
  assign read = (state == cycle_through);
  assign write = (state == save);
  assign enable_increment = (state == _input);
  assign enable_decrement = (state == timer);
  assign output_select [0] = (state == stopwatch) || (state == stopwatch) || ((state == timer) || (state == _input));
  assign output_select [1] = (state == cycle_through || wait) || ((state == timer) || (state == _input));
  assign output_select = 2'b11 ? ((state == timer) || (state == _input)); 

  always_ff @ (posedge clk, negedge nrst) begin
    if (~nrst)
        state <=0;
    else 
        state <= next_state;
  end
endmodule

