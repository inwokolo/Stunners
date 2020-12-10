`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2020 11:19:49 AM
// Design Name: 
// Module Name: carry_select_test
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


module carry_select_test(
    );
    
    reg[3:0] a,b;
    reg c_in;
    wire[3:0] sum;
    wire c_out;
    
    carry_select_adder UUT(.a(a), .b(b), .c_in(c_in), .sum(sum), .c_out(c_out));
    
     initial
    begin
    
    a[0]=0; a[1]=0; a[2]=0; a[3]=0; b[0]=0; b[0]=0; b[1]=0; b[2]=0; b[3]=0; c_in = 1;
    #10 a[0]=1; a[1]=1;
    #10 a[2]=1; b[0]=1;
    #10 b[1]=1;
    #10 b[2]=1; a[3]=1; b[3]=1; c_in=0;
    #10 a[0]=0;a[1]=0;
    #10 a[0]=1; a[1]=1; 
    #10 b[0]=0; b[2]=1;
    
    #10 b[0]=1; 
    
    
    
    end
endmodule
