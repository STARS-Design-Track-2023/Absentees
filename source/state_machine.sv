module fsm (input logic pb0, pb1, flag,
            output logic clear, enable, 
            read, write, enable_increment, 
            enable_decrement,
            output logic [1:0] output_select)
  typedef enum logic [4:0] {mode_select, clear, stop_watch, last_time, _input, timer, time_up} state_t;
  logic [2:0] state, next_state;
  always_comb begin
    next_state = state;
    case(state)
      mode_select: begin
        if (pb0)
            clear;
        else if (pb1)
            _input;
        else 
            mode_select;
      end
      clear: stop_watch;
      stop_watch: begin
        if (pb0)
            last_time;
        else 
            stop_watch;
      end
      last_time: begin
        if (pb0)
            mode_select;
        else
            last_time;
      end
      _input: begin
        if (pb1)
            timer;
        else 
            _input;
      end
      timer: begin
        if (flag)
            time_up;
        else
            timer;
      end
      time_up: begin
        if (pb0)
            mode_select;
        else
            time_up;
      end

    endcase


  end
  assign clear = (state == s0);

  always_ff @ (posedge clk, negedge nrst) begin
    if (~nrst)
        state <=0;
    else 
        nextstate <= state;
  end
endmodule

