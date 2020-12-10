`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2020 10:30:24 AM
// Design Name: 
// Module Name: ripple_carry
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


module ripple_carry(
    
    input c_in,
    input a1,
    input b1,
    input a2,
    input b2,
    input a3,
    input b3,
    input a4,
    input b4,
    output sum1,
    output sum2,
    output sum3,
    output sum4,
    output c_out
    );
    
    wire w1, w2, w3;
    full_adder f1(.c_in(c_in), .a(a1), .b(b1), .sum(sum1), .c_out(w1));
    full_adder f2(.c_in(w1), .a(a2), .b(b2), .sum(sum2), .c_out(w2));
    full_adder f3(.c_in(w2), .a(a3), .b(b3), .sum(sum3), .c_out(w3));
    full_adder f4(.c_in(w3), .a(a4), .b(b4), .sum(sum4), .c_out(c_out));
    
    
endmodule
