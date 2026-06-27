`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 10:08:14
// Design Name: 
// Module Name: uart_tb
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

`timescale 1ns/1ps

module uart_tb;

    reg        clk;
    reg        rst;
    reg        tx_start;
    reg  [7:0] data_in;

    wire       tx;
    wire       rx;
    wire [7:0] data_out;
    wire       rx_done;

    // Loopback connection: TX -> RX
    assign rx = tx;

    // DUT instantiation
    uart_top dut (
        .clk(clk),
        .rst(rst),
        .tx_start(tx_start),
        .data_in(data_in),
        .rx(rx),
        .tx(tx),
        .data_out(data_out),
        .rx_done(rx_done)
    );

    // 50 MHz clock generation (20 ns period)
    initial
        clk = 1'b0;

    always #10 clk = ~clk;

    initial begin

        // Initialize signals
        rst      = 1'b1;
        tx_start = 1'b0;
        data_in  = 8'h00;

        // Hold reset
        #100;
        rst = 1'b0;

        // Wait for stabilization
        #100;

        // Transmit one byte
        data_in  = 8'h55;
        tx_start = 1'b1;

        // Keep tx_start high long enough
        #200000;

        tx_start = 1'b0;

        // Wait for reception
        wait (rx_done == 1'b1);

        $display("Time = %0t ns, Received Data = %h",
                 $time, data_out);

        #1000;
        $finish;
    end

endmodule