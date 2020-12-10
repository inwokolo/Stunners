`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2020 02:59:34 PM
// Design Name: 
// Module Name: combined
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

// combine alu, decoder, 7 segment
module system(
    input mode_ss,
    input[3:0] mode_d, // opcode
    input[3:0] a,
    input[3:0] b,
    input c_in,
    input clk,
    output c_out,
    output[7:0] ss_digit,
   
    output[6:0] segment
    );
    wire[3:0] mode_a; // alu code
   wire[3:0] temp;//change this!

    decoder d1( .mode_d(mode_d), .mode_a(mode_a));
    alu a1(.mode(mode_a[3]), .code(mode_a[2:0]), .a(a), .b(b), .c_in(c_in), .c_out(c_out), .result(temp));
    seven_seg s_s1(.clk(clk), .instruction(mode_d),.numA(a), .numB(b),.Anode_Activate(ss_digit), .hexnum(segment), .mode(mode_ss), .dec_output(temp));
    
 
    
endmodule
