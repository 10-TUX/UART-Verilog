module uart_top (
    input clk,
    input rst,

    input [7:0]tx_data,
    input tx_start,
    output tx,

    input rx,
    output [7:0]rx_data,
    output rx,valid
);

endmodule