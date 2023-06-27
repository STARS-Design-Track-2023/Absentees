module decoder (input logic [11:0] counter_out,
output logic [5:0] out0, out1, out2, out3
);
  
  logic [5:0] minute, second;
  logic [5:0] m1, m0, s1, s0;
  
  always_comb begin
    minute = counter_out[11:6];
    second = counter_out[5:0];
    out1 = 0;
    out3 = 0;

    if(second > 9) begin
        out1 = second / 10;
        out0 = second % 10;
    end
    
    else
        out0 = second; 
    
    if(minute > 9) begin
        out2 = minute / 10;
        out3 = minute % 10;
    end
    else 
        out2 = minute;
  
  end 

  
endmodule

