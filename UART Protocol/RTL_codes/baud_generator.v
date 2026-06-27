`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 10:04:19
// Design Name: 
// Module Name: baud_generator
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

module baud_generator #(
    parameter CLK_FREQ = 50000000,
    parameter BAUD_RATE = 9600
)(
    input  wire clk,
    input  wire rst,
    output reg  baud_tick
);

localparam DIVISOR = CLK_FREQ / BAUD_RATE;

reg [15:0] count;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 0;
        baud_tick <= 0;
    end
    else if (count == DIVISOR-1) begin
        count <= 0;
        baud_tick <= 1;
    end
    else begin
        count <= count + 1;
        baud_tick <= 0;
    end
end

endmodule