module uart_top (
    input  wire clk,
    input  wire rst,

    input  wire [7:0]tx_data,
    input  wire tx_start,

    output wire [7:0]rx_data,
    output wire rx_done,
    output wire busy
);

    wire baud_tick;
    wire serial_line;

    baud_gen baud_inst(
        .clk(clk),
        .rst(rst),
        .baud_tick(baud_tick)
    );

    uart_tx tx_inst(
        .clk(clk),
        .rst(rst),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .baud_tick(baud_tick),
        .tx(serial_line),
        .busy(busy)
    );

    uart_rx rx_inst(
        .clk(clk),
        .rst(rst),
        .rx(serial_line),
        .baud_tick(baud_tick),
        .rx_data(rx_data),
        .rx_done(rx_done)
    );

endmodule