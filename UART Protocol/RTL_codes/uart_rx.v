`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 10:06:08
// Design Name: 
// Module Name: uart_rx
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

module uart_rx(
    input  wire       clk,
    input  wire       rst,
    input  wire       baud_tick,
    input  wire       rx,

    output reg [7:0]  data_out,
    output reg        rx_done
);

localparam IDLE = 2'd0,
           DATA = 2'd1,
           STOP = 2'd2,
           DONE = 2'd3;

reg [1:0] state;
reg [2:0] bit_count;
reg [7:0] shift_reg;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state     <= IDLE;
        bit_count <= 3'd0;
        shift_reg <= 8'd0;
        data_out  <= 8'd0;
        rx_done   <= 1'b0;
    end
    else begin
        rx_done <= 1'b0;

        if (baud_tick) begin
            case (state)

                IDLE: begin
                    if (rx == 1'b0) begin
                        bit_count <= 3'd0;
                        state <= DATA;
                    end
                end

                DATA: begin
                    shift_reg[bit_count] <= rx;

                    if (bit_count == 3'd7)
                        state <= STOP;
                    else
                        bit_count <= bit_count + 1;
                end

                STOP: begin
                    if (rx == 1'b1)
                        state <= DONE;
                    else
                        state <= IDLE;
                end

                DONE: begin
                    data_out <= shift_reg;
                    rx_done <= 1'b1;
                    state <= IDLE;
                end

            endcase
        end
    end
end

endmodule