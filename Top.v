`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:02:50 10/11/2024 
// Design Name: 
// Module Name:    Top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Top(
	input wire tmb_clock0,
	output wire [0:7]led_fp
    );
	wire clk40;
	wire led_clk;
	wire slow_clk40;
	IBUFG uibufg_19p (.I(tmb_clock0),
					  .O(clk40));   // In  40MHz clock
	
	clock_divider #(
					.DIVISOR(28'd1_000) // 40Mhz/1.000 = 4KHz
					) clk40_sync(clk40,
								 slow_clk40);
									
	clock_divider #(
					.DIVISOR(28'd1_000_000) // 40Mhz/1.000.000 = 4Hz
					) clk40_led(clk40,
								 led_clk);
	assign led_fp[0] = led_clk;
	assign led_fp[1] = slow_clk40;
	assign led_fp[2:7] = 5'b0000_0;
endmodule
