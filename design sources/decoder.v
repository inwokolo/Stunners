`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2020 07:55:22 PM
// Design Name: 
// Module Name: decoder
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


module decoder(
    input[3:0] mode_d,
    output reg[3:0] mode_a

    );
    
    always @(mode_d)
    begin
    
    
    if (mode_d == 4'b0000)
        mode_a=4'b1000; //negate A
   
    else if (mode_d == 4'b0001)
        mode_a=4'b1001; //negate B
   
    else if (mode_d == 4'b0010)
        mode_a=4'b0110; //invert A
    
    else if (mode_d == 4'b0011)
        mode_a=4'b0111; //invert B
    
    else if (mode_d == 4'b0100)
        mode_a=4'b1010; //A + B

    else if (mode_d == 4'b0101)
        mode_a=4'b1011; //A-B

    else if (mode_d == 4'b0110)
        mode_a=4'b1110; //A+1
   
    else if (mode_d == 4'b0111)
        mode_a=4'b1111; //A-1
    
    else if (mode_d == 4'b1000)
        mode_a=4'b1100; //A*B
    
    else if (mode_d == 4'b1001)
        mode_a=4'b1101; //B-A
    
    else if (mode_d == 4'b1010)
        mode_a=4'b0000; //A & B
   
    else if (mode_d == 4'b1011)
        mode_a=4'b0001; //A or B
    
    else if (mode_d == 4'b1100)
        mode_a=4'b0010; //A nand B
    
    else if (mode_d == 4'b1101)
        mode_a=4'b0011; //A nor B
   
    else if (mode_d == 4'b1110)
        mode_a=4'b0100; //A xor B
    
    else if (mode_d == 4'b1111)
        mode_a=4'b0101; //A xnor B
   
    end
    
endmodule


