`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 08:43:25 PM
// Design Name: 
// Module Name: system_test
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
module system_test(
    );
    
    reg mode_ss;
    reg[3:0] mode_d;
    reg[3:0] a;
    reg[3:0] b;
    reg c_in;
    reg clk;
   
    wire c_out;
    wire[7:0] ss_digit;
    wire[6:0] segment;
    
    system UUT(.mode_ss(mode_ss), .mode_d(mode_d), .a(a), .b(b), .c_in(c_in), .clk(clk),  .c_out(c_out), .ss_digit(ss_digit), .segment(segment));
    
    initial 
    begin
    a = 4'b0110; b= 4'b0011; c_in = 0; mode_d=4'b0000; mode_ss=0;
    #10 mode_d = 4'b0001;
    #10 mode_d = 4'b0010;
    #10 mode_d = 4'b0011;
    #10 mode_d = 4'b0100;
    #10 mode_d = 4'b0101;
    #10 mode_d = 4'b0110;
    #10 mode_d = 4'b0111;
    #10 mode_d = 4'b1000; mode_ss = 1;
    #10 mode_d = 4'b1001;
    #10 mode_d = 4'b1010;
    #10 mode_d = 4'b1011;
    #10 mode_d = 4'b1100;
    #10 mode_d = 4'b1101;
    #10 mode_d = 4'b1110;
    #10 mode_d = 4'b1111;
    end
endmodule

