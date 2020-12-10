`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2020 10:37:27 AM
// Design Name: 
// Module Name: ripple_test
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


module ripple_test(

    );
    reg c_in, a1, b1, a2, b2, a3, b3, a4, b4;
    wire sum1, sum2, sum3, sum4, c_out;
    
    ripple_carry UUT(.c_in(c_in), .a1(a1), .b1(b1), .a2(a2), .b2(b2), .a3(a3), .b3(b3), .a4(a4), .b4(b4), .sum1(sum1), .sum2(sum2), .sum3(sum3), .sum4(sum4), .c_out(c_out));
    
    initial
    begin
    
    
        a1=0; a2=0; a3=0; b1=0; b2=0; b3=0; a4=0; b4=0; c_in=0;
        #10 a1=1;
        #10 a2=1;
        #10 a3=1;
        #10 b1=1;
        #10 b2=1;
        #10 b3=1;
        #10 a4=1; b4=1;
        #10 c_in=1; 
        #10 a1=0;a2=0;a3=0;
    end
endmodule
