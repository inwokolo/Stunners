`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2020 01:42:34 PM
// Design Name: 
// Module Name: seven_seg_test
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


module seven_seg_test(

    );
    reg clk;
  
    reg[3:0] num;
    wire A, B, C, D, E, F, G;
    wire[7:0] an;
    
    seven_seg UUT( .clk(clk), .A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .G(G), .Anode_Activate(an));
    
    initial
    begin
    clk=0; 
    clk=1; 
    end
endmodule
