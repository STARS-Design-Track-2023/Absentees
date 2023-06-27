module decoder (input logic [11:0] counter_out,
output logic [6:0] out0, out1, out2, out3
);
  
  logic [5:0] minute, second;
  logic [5:0] m1, m0, s1, s0;
  
  always_comb begin
    minute = counter_out[11:6];
    second = counter_out[5:0];
    s1 = 0;
    m1 = 0;

    if(second > 9) begin
        s1 = second / 10;
        s0 = second % 10;
    end
    
    else
        s0 = second; 
    
    if(minute > 9) begin
        m1 = minute / 10;
        m0 = minute % 10;
    end
    else 
        m0 = minute;
  
  end 
    encode x1 (.in(s0), .out(out0));
    encode x2 (.in(s1), .out(out1));
    encode x3 (.in(m0), .out(out2));
    encode x4 (.in(m1), .out(out3));
  
endmodule

module encode (input logic [5:0] in, output logic [6:0] out);
  always_comb begin
    case(in)
     0: out = 7'b0111111;
     1: out = 7'b0000110;
     2: out = 7'b1011011;
     3: out = 7'b1001111;
     4: out = 7'b1100110;
     5: out = 7'b1101101;
     6: out = 7'b1111101;
     7: out = 7'b0000111;
     8: out = 7'b1111111;
     9: out = 7'b1101111;
     default: out = 0;
    endcase
  end
endmodule