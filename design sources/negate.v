`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2020 11:32:32 AM
// Design Name: 
// Module Name: negate
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


module negate(
    input[3:0] a,
    output [3:0] neg
    );
    wire[3:0] b;
    xor(b[0], a[0], 1);
    xor(b[1], a[1], 1);
    xor(b[2], a[2], 1);
    xor(b[3], a[3], 1);
    
    assign neg = b + 4'b0001;
    
    
    
    
endmodule
