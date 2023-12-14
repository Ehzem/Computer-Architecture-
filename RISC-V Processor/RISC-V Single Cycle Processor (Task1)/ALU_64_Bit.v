`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2023 10:40:14 PM
// Design Name: 
// Module Name: ALU_64_Bit
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

module ALU_64_bit
(
    input [63:0]a, b,
    input [3:0] ALUOperation,
    output reg [63:0] Result,
    output ZERO
);
localparam [3:0]
    AND = 4'b0000,
    OR = 4'b0001,
    ADD = 4'b0010,
    Sub = 4'b0110,
    NOR = 4'b1100,
    SLLI = 4'b0011,
    Beq = 4'b0101,
    Blt = 4'b1000,
    Bge = 4'b1010,
    Jal = 4'b1110;
    
reg temp;

always @ (ALUOperation, a, b) begin
    case (ALUOperation)
        AND: Result = a & b;
        OR: Result = a | b;
        ADD: Result = a + b;
        Sub: Result = a - b;
        NOR: Result = ~(a | b);
        SLLI: Result = a << b;
        Beq: begin
            if (a == b) begin
                temp = 1;
            end
            else begin
                temp = 0;
            end
        end
        Blt: begin
            if( a < b) begin
                temp = 1;
            end
            else begin
                temp = 0;
            end
        end
        Bge: begin
            if( a >= b) begin
                temp = 1;
            end
            else begin
                temp = 0;
            end
        end
        
        Jal: temp = 1;
        
        default: Result = 0;
    endcase
end

assign ZERO = temp;

endmodule
