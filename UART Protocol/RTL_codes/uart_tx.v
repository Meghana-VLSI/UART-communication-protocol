`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 10:05:17
// Design Name: 
// Module Name: uart_tx
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

module uart_tx(
    input  wire       clk,
    input  wire       rst,
    input  wire       baud_tick,
    input  wire       tx_start,
    input  wire [7:0] data_in,

    output reg        tx,
    output reg        tx_busy
);

localparam IDLE  = 2'd0,
           START = 2'd1,
           DATA  = 2'd2,
           STOP  = 2'd3;

reg [1:0] state;
reg [7:0] shift_reg;
reg [2:0] bit_count;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state     <= IDLE;
        tx        <= 1'b1;
        tx_busy   <= 1'b0;
        shift_reg <= 8'd0;
        bit_count <= 3'd0;
    end
    else begin
        case (state)

            IDLE: begin
                tx <= 1'b1;
                tx_busy <= 1'b0;

                // Check tx_start every clock cycle
                if (tx_start) begin
                    shift_reg <= data_in;
                    bit_count <= 3'd0;
                    tx_busy   <= 1'b1;
                    state     <= START;
                end
            end

            START: begin
                if (baud_tick) begin
                    tx <= 1'b0;
                    state <= DATA;
                end
            end

            DATA: begin
                if (baud_tick) begin
                    tx <= shift_reg[0];
                    shift_reg <= shift_reg >> 1;

                    if (bit_count == 3'd7)
                        state <= STOP;
                    else
                        bit_count <= bit_count + 1;
                end
            end

            STOP: begin
                if (baud_tick) begin
                    tx <= 1'b1;
                    tx_busy <= 1'b0;
                    state <= IDLE;
                end
            end

        endcase
    end
end

endmodule