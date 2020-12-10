`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2020 02:22:02 PM
// Design Name: 
// Module Name: alu_test
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


module alu_test(
    );
    
    reg mode;
    reg[2:0] code;
    reg[3:0] a;
    reg[3:0] b;
    reg c_in;
    wire c_out;
    wire[3:0] result;
    
    alu UUT(.mode(mode), .code(code), .a(a), .b(b), .c_in(c_in), .c_out(c_out), .result(result));
    
    initial 
    begin
    a = 4'b0110; b= 4'b0011; c_in = 0; mode=0; code = 3'b000;
    #10 code = 3'b001;
    #10 code = 3'b010;
    #10 code = 3'b011;
    #10 code = 3'b100;
    #10 code = 3'b101;
    #10 code = 3'b110;
    #10 code = 3'b111;
    #10 mode = 1; code = 3'b000;
    #10 code = 3'b001;
    #10 code = 3'b010;
    #10 code = 3'b011;
    #10 code = 3'b100;
    #10 code = 3'b101;
    #10 code = 3'b110;
    #10 code = 3'b111;
    end
endmodule
