`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2020 11:29:31 AM
// Design Name: 
// Module Name: carry_select_subt
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


module carry_select_subt(
    input[3:0] a,
    input[3:0] b,
    input c_in,
    output reg [3:0] sum,
    output c_out
    );
    
    
    wire[3:0] c;
    wire [3:0] tsum1;
    reg [3:0] tsum2;
    
    
    negate neg1(.a(b), .neg(c));
    //ripple_carry subt(.c_in(0), .a1(a[0]), .a2(a[1]), .a3(a[2]), .a4(a[3]), .b1(c[0]), .b2(c[1]), .b3(c[2]), .b4(c[3]), .sum1(sum[0]), .sum2(sum[1]), .sum3(sum[2]), .sum4(sum[3]), .c_out(c_out));
    carry_select_adder subt(.a(a), .b(c), .c_in(c_in), .sum(tsum1), .c_out(c_out));
    
    always@(*)
    begin
    if(a<b)
        begin
        tsum2 = tsum1 - 4'b0001;
        sum = ~tsum2;
        end
    else
    sum = tsum1;
    end
    
    
    
endmodule
