`timescale 1ns/1ps

module baud_gen_tb;
    reg clk;
    reg rst;
    wire baud_tick;

    baud_gen uut (
        .clk(clk),
        .rst(rst),
        .baud_tick(baud_tick)
    );

    always #10 clk = ~clk;
    
    initial begin
        clk = 0;
        rst = 1;

        $dumpfile("baud_gen.vcd");
        $dumpvars(0,baud_gen_tb);
        
        #100;
        rst = 0;
        
        #110000;
        
        $finish;
    end
endmodule