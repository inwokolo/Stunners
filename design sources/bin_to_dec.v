`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 04:58:30 PM
// Design Name: 
// Module Name: bin_to_dec
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


module bin_to_dec(
input [3:0] bin_num,
output reg [3:0] dec_num1, dec_num2,
output c_out

    );
    wire [3:0] temp;
    reg [3:0] ten = 4'b1010;
    
        carry_select_subt conv(.a(bin_num), .b(ten), .c_in(0), .sum(temp), .c_out(c_out));

    always@(*)
    begin
        if(bin_num>4'b1001)
        begin
            dec_num2 = temp; // one's place
            //dec_num1 = 4'b0001;
        end
        else
            dec_num2= bin_num;
            dec_num1 = 4'b0000;
    end
endmodule
