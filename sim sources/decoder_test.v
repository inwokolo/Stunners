`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 08:38:32 PM
// Design Name: 
// Module Name: decoder_test
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


module decoder_test(

    );

    reg[3:0] mode_d;
    wire [3:0] mode_a;
   
    
    decoder UUT( .mode_d(mode_d), .mode_a(mode_a));
    
    initial 
    begin
    mode_d=4'b0000; 
    #10 mode_d = 4'b0001;
    #10 mode_d = 4'b0010;
    #10 mode_d = 4'b0011;
    #10 mode_d = 4'b0100;
    #10 mode_d = 4'b0101;
    #10 mode_d = 4'b0110;
    #10 mode_d = 4'b0111;
    #10 mode_d = 4'b1000;
    #10 mode_d = 4'b1001;
    #10 mode_d = 4'b1010;
    #10 mode_d = 4'b1011;
    #10 mode_d = 4'b1100;
    #10 mode_d = 4'b1101;
    #10 mode_d = 4'b1110;
    #10 mode_d = 4'b1111;
    
    
    
    
    end
endmodule
