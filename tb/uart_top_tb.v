`timescale 1ns/1ps

module uart_top_tb;

reg clk;
reg rst;
reg tx_start;
reg [7:0] tx_data;

wire [7:0] rx_data;
wire rx_done;
wire busy;

uart_top dut(
    .clk(clk),
    .rst(rst),
    .tx_start(tx_start),
    .tx_data(tx_data),
    .rx_data(rx_data),
    .rx_done(rx_done),
    .busy(busy)
);

initial begin
    $dumpfile("uart_top.vcd");
    $dumpvars(0,uart_top_tb);
end

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    rst = 1'b1;
    tx_start = 1'b0;
    tx_data = 8'h00;

    #100;
    rst = 1'b0;

    #100;

    tx_data = 8'h4B;
    tx_start = 1'b1;

    #20;
    tx_start = 1'b0;

    #1200000;

    $finish;
end

endmodule