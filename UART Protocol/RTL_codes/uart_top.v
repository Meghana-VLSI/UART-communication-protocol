`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 10:07:03
// Design Name: 
// Module Name: uart_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module uart_top(
    input  wire       clk,
    input  wire       rst,
    input  wire       tx_start,
    input  wire [7:0] data_in,
    input  wire       rx,

    output wire       tx,
    output wire [7:0] data_out,
    output wire       rx_done
);

wire baud_tick;

baud_generator baud_gen (
    .clk(clk),
    .rst(rst),
    .baud_tick(baud_tick)
);

uart_tx tx_inst (
    .clk(clk),
    .rst(rst),
    .baud_tick(baud_tick),
    .tx_start(tx_start),
    .data_in(data_in),
    .tx(tx),
    .tx_busy()
);

uart_rx rx_inst (
    .clk(clk),
    .rst(rst),
    .baud_tick(baud_tick),
    .rx(rx),
    .data_out(data_out),
    .rx_done(rx_done)
);

endmodule