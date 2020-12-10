`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2020 11:37:46 AM
// Design Name: 
// Module Name: negate_test
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


module negate_test(
    );
    
    reg[3:0] a;
    wire[3:0] neg;
    
    negate UUT(.a(a), .neg(neg)); 
    
    initial 
    begin
   
    a[0]=0; a[1]=0; a[2]=0; a[3]=0; 
    #10 a[0]=1; a[1]=1;
    #10 a[2]=1; 

    #10 a[3]=1; 
    #10 a[0]=0;a[1]=0;
    #10 a[0]=1; a[1]=1; 

    
   
    end
endmodule
