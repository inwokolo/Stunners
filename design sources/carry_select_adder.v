`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2020 10:47:55 AM
// Design Name: 
// Module Name: carry_select_adder
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


module carry_select_adder(
    input[3:0] a,
    input[3:0] b,
    input c_in,
    output reg[3:0] sum,
    output reg c_out
    );
    wire[3:0] s1, s2;
    wire c_out1, c_out2;
    //for c_in = 0
    ripple_carry r1(.c_in(0), .a1(a[0]), .a2(a[1]), .a3(a[2]), .a4(a[3]), .b1(b[0]), .b2(b[1]), .b3(b[2]), .b4(b[3]), .sum1(s1[0]), .sum2(s1[1]), .sum3(s1[2]), .sum4(s1[3]), .c_out(c_out1));
    
    
    //for c_in = 1;
    ripple_carry r2(.c_in(1), .a1(a[0]), .a2(a[1]), .a3(a[2]), .a4(a[3]), .b1(b[0]), .b2(b[1]), .b3(b[2]), .b4(b[3]), .sum1(s2[0]), .sum2(s2[1]), .sum3(s2[2]), .sum4(s2[3]), .c_out(c_out2));
    
    always @ (*)
    begin
    if (c_in == 1'b0)
    begin 
    sum[0]=s1[0];
    sum[1]=s1[1];
    sum[2]=s1[2];
    sum[3]=s1[3];
    c_out = c_out1;
    end
    else if (c_in == 1'b1)
    begin 
    sum[0]=s2[0];
    sum[1]=s2[1];
    sum[2]=s2[2];
    sum[3]=s2[3];
    c_out = c_out2;
    end
    end
endmodule
