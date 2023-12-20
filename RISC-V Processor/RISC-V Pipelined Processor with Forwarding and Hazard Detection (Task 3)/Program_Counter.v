`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2023 08:59:11 PM
// Design Name: 
// Module Name: Program_Counter
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

module Program_Counter
(
    input clk, reset, stall,         // Clock and reset inputs
    input [63:0] PC_In,        // 64-bit input for the new program counter value
    output reg [63:0] PC_Out   // 64-bit output for the current program counter value
);

    initial
        PC_Out = 64'd0;         // Initialize the program counter to zero

    always @(posedge clk or posedge reset)
    begin
        if (reset == 1'b1) PC_Out = 64'b0;
	   else if (stall == 1'b1) PC_Out = PC_Out;
	   else PC_Out = PC_In;    // Update the program counter with the new value when a positive clock edge occurs
    end

endmodule