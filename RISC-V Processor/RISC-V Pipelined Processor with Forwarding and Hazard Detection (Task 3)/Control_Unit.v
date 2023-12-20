`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2023 10:13:02 PM
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit
(
    input [6:0] Opcode, 
    input stall,
    output reg Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Jal,
    output reg [1:0] ALUOp
);

always @ (Opcode) begin
    case (Opcode)
        //R type
        7'b0110011: begin
            Branch = 0;
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 0;
            ALUSrc = 0;
            RegWrite = 1;
            ALUOp = 2'b10;
            Jal = 1'b0;
        end
        
        // I-type Load Instructions
        7'b0000011: begin
            Branch = 0;
            MemRead = 1;
            MemtoReg = 1;
            MemWrite = 0;
            ALUSrc = 1;
            RegWrite = 1;
            ALUOp = 2'b00;
            Jal = 1'b0;
        end
        
        // I-type instructions like addi
        7'b0010011: begin
            Branch = 0;
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 0;
            ALUSrc = 1;
            RegWrite = 1;
            ALUOp = 2'b00;
            Jal = 1'b0;
        end
        
        // S-type Store Instruction
        7'b0100011: begin
            Branch = 0;
            MemRead = 0;
            MemtoReg = 1'bx;
            MemWrite = 1;
            ALUSrc = 1;
            RegWrite = 0;
            ALUOp = 2'b00;
            Jal = 1'b0;
        end
        
        // B-Type Branch Instruction
        7'b1100011: begin
            Branch = 1;
            MemRead = 0;
            MemtoReg = 1'bx;
            MemWrite = 0;
            ALUSrc = 0;
            RegWrite = 0;
            ALUOp = 2'b01;
            Jal = 1'b0;
        end
        
        // J-Type Jal Instruction
        7'b1101111: begin
            Branch = 1;
            MemRead = 1'bx;
            MemtoReg = 1'bx;
            MemWrite = 1'bx;
            ALUSrc = 1;
            RegWrite = 1;
            ALUOp = 2'b11;
            Jal = 1'b1;
        end
    endcase
     if (stall == 1) begin
        Branch = 1'b0; MemRead = 1'b0; MemtoReg = 1'b0; ALUOp = 2'b00;
        MemWrite = 1'b0; ALUSrc = 1'b0; RegWrite = 1'b0;
        end
end
endmodule

