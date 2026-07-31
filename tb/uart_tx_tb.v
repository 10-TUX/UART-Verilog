`timescale 1ns/1ps

module uart_tx_tb;

    reg clk;
    reg rst;
    reg tx_start;
    reg [7:0] tx_data;

    wire tx;
    wire busy;
    wire baud_tick;

    baud_gen baud (
        .clk(clk),
        .rst(rst),
        .baud_tick(baud_tick)
    );

    uart_tx tx_module (
        .clk(clk),
        .rst(rst),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .baud_tick(baud_tick),
        .tx(tx),
        .busy(busy)
    );

    always #10 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        tx_start = 0;
        tx_data = 8'h00;

        $dumpfile("uart_tx.vcd");
        $dumpvars(0 , uart_tx_tb);

        #100
        rst = 0;

        #100;
        tx_data = 8'h4B;
        tx_start = 1;

        #20;
        tx_start = 0;

        #1100000;
        $finish;
    end
endmodule