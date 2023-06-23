`timescale 1ns/10ps

module tb_memory();

    parameter CLK_PERIOD = 100;
    //Clock and Reset signal
    logic tb_clk;
    logic tb_n_rst;
    
    //Test Bench Related Signal
    int tb_test_num;
    string tb_test_name;

    //DUT signals
    logic [11:0] tb_count, tb_out;
    logic tb_read, tb_write;    

    //CLK Gen
    always begin
        tb_clk = 0;
        #(CLK_PERIOD / 2);

        tb_clk = 1;
        #(CLK_PERIOD / 2)
    end

    task reset_dut;
    begin
    
        tb_n_rst = 0;
        @(posedge tb_clk);
        @(posedge tb_clk);
    
        @(negedge tb_clk);
        tb_n_rst = 1;

        @(posedge tb_clk);
        @(posedge tb_clk);


    end

    logic tb_mismatch;
    logic tb_expected_out;
    task check_output;
    begin
        asset(tb_out == tb_expected_out) begin
            $display("test num %0d: incorrect output", tb_test_num);
        end
        else 
            $error("test num %0d: incorrect output", tb_test_num);
        
    end

    //Extentiate DUT
    memory DUT (.clk(tb_clk), .nrst(tb_n_rst), .read(tb_read), .write(tb_write), .out(tb_out);

    initial begin
        //Initialize input signals
        tb_test_num = -1;
        tb_n_rst = 1;
        tb_read = 0;
        tb_write = 0;

        //Test 0 reset case
        tb_test_num = tb_test_num + 1;
        reset_dut;
        tb_expected_out = 0;
        check_output;
        #0.25;
        tb_mismatch = 0;
        
        //Test 1 input two mem
        tb_test_num = tb_test_num + 1;
        reset_dut;
        @(negedge tb_clk);
        tb_write = 1;
        tb_count = 12'd1591;
        @(negedge tb_clk);
        tb_count = 12'd2099;
        @(negedge tb_clk);
        tb_write = 0;

        @(negedge tb_clk);
        tb_read = 1;
        
        @(negedge tb_clk);
        tb_read = 0;
        tb_expected_out = 12'd2099;
        check_output;
        #0.25;
        tb_mismatch = 0;
        
        
     


    end


endmodule 

        
        
        
        






    end 

endmodule
