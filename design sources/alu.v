`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2020 09:28:01 PM
// Design Name: 
// Module Name: ripple_adder
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

module alu_a_inv(input [3:0]a);
    
    wire [4:0] inv_a;
    assign inv_a = ~a; 
    
endmodule
    
module alu_b_inv(input [3:0]b);
    
    wire [4:0] inv_b;
    assign inv_b = ~b;     
endmodule  

module alu_multiply(input [3:0]a, input[3:0]b, output[3:0]out, output carry_out);

    wire [4:0]w1, w3, w5, w7;
    wire [3:0] w2, w4, w6;
    single_and m0(.a(a[0]),.b(b), .out(w1[3:0]));
    single_and m1(.a(a[1]), .b(b), .out(w2));
    assign out[0] = w1[0];
    ripple_adder m2(.a(w1[4:1]), .b(w2), .c_in(0), .out(w3[3:0]), .carry(w3[4]));
    assign out[1] = w3[0];
    single_and m3(.a(a[2]), .b(b), .out(w4));
    ripple_adder m4(.a(w3[4:1]), .b(w4),.c_in(0), .out(w5[3:0]), .carry(w5[4]));
    assign out[2] = w5[0];
    single_and m5(.a(a[3]), .b(b), .out(w6));
    ripple_adder m6(.a(w5[4:1]), .b(w6),.c_in(0), .out(w7[3:0]), .carry(w7[4]));
    assign out[3] = w7[0];
    or(carry_out, w7[4], w7[3], w7[2], w7[1]);
    
endmodule
  
/**module alu_multiplier (input [3:0]a, input [3:0]b, output [7:0] c_out);

    wire [3:0] temp_product [4:0];
    wire [3:0] temp_a [4:0];
    wire [3:0] temp_carry;
    
genvar i, j;
generate 

for(i = 0; i < 4; i = i + 1) begin: loop_i
assign temp_a[i] =  a & {4{b[i]}};
end
 
assign temp_product[0] = temp_a[0];
assign temp_carry[0] = 1'b0;
assign c_out[0] = temp_product[0][0];
 
for(j = 1; j < 4; j = j + 1) begin: loop_j
carry_look_ahead_adder (.sum(temp_product[j]), .c_out(temp_carry[j]), .c_in(1'b0), .a(temp_a[j]), .b({temp_carry[j-1],temp_product[j-1][3-:3]}));
assign c_out[j] = temp_product[j][0];
end 
 
assign c_out[(7):4] = {temp_carry[3],temp_product[3][3-:3]};
endgenerate

endmodule
**/

module alu_subtract_a(input [3:0]a, input [3:0]b, output [3:0] out);
    
    wire w1,w2,w3;
    
    full_adder s0( .a( a[0] ), .b( ~b[0]), .c_in(1), .sum( out[0]), .c_out( w1 ) );
	full_adder s1( .a( a[1] ), .b( ~b[1]), .c_in( w1 ), .sum( out[1]), .c_out( w2 ) );
	full_adder s2( .a( a[2] ), .b( ~b[2]), .c_in( w2 ), .sum( out[2]), .c_out( w3 ) );
	full_adder s3( .a( a[3] ), .b( ~b[3]), .c_in( w3 ), .sum( out[3]), .c_out( 0 ) );

endmodule

module alu_subtract_b(input [3:0]b, input [3:0]a, output [3:0] out);
    
    wire w1,w2,w3;
    
    full_adder s0( .b( b[0] ), .a( ~a[0]), .c_in(1), .sum( out[0]), .c_out( w1 ) );
	full_adder s1( .b( b[1] ), .a( ~a[1]), .c_in( w1 ), .sum( out[1]), .c_out( w2 ) );
	full_adder s2( .b( b[2] ), .a( ~a[2]), .c_in( w2 ), .sum( out[2]), .c_out( w3 ) );
	full_adder s3( .b( b[3] ), .a( ~a[3]), .c_in( w3 ), .sum( out[3]), .c_out( 0 ) );
	
endmodule

module single_and(input a, input[3:0]b, output[3:0]out);

    and(out[0], a, b[0]);
    and(out[1], a, b[1]);
    and(out[2], a, b[2]);
    and(out[3], a, b[3]);

endmodule

module alu_and(input [3:0]a, input [3:0]b, output [3:0]out);
    
    and(out[0], a[0], b[0]);
    and(out[1], a[1], b[1]);
    and(out[2], a[2], b[2]);
    and(out[3], a[3], b[3]);
    
endmodule

module alu_or(input [3:0]a, input [3:0]b, output [3:0]out);
    
    or(out[0], a[0], b[0]);
    or(out[1], a[1], b[1]);
    or(out[2], a[2], b[2]);
    or(out[3], a[3], b[3]);
    
endmodule

module alu_nand(input [3:0]a, input [3:0]b, output [3:0]out);
    
    nand(out[0], a[0], b[0]);
    nand(out[1], a[1], b[1]);
    nand(out[2], a[2], b[2]);
    nand(out[3], a[3], b[3]);
    
endmodule

module alu_nor(input [3:0]a, input [3:0]b, output [3:0]out);
    
    nor(out[0], a[0], b[0]);
    nor(out[1], a[1], b[1]);
    nor(out[2], a[2], b[2]);
    nor(out[3], a[3], b[3]);
    
endmodule

module alu_xor(input [3:0]a, input [3:0]b, output [3:0]out);
    
    xor(out[0], a[0], b[0]);
    xor(out[1], a[1], b[1]);   
    xor(out[2], a[2], b[2]);
    xor(out[3], a[3], b[3]);
    
endmodule 

module alu_xnor(input [3:0]a, input [3:0]b, output [3:0]out);
    
    xnor(out[0], a[0], b[0]);
    xnor(out[1], a[1], b[1]);   
    xnor(out[2], a[2], b[2]);
    xnor(out[3], a[3], b[3]);
    
endmodule 

module alu_not(input [3:0]a, output [3:0]out);
    
    not(out[0], a[0]);
    not(out[1], a[1]);
    not(out[2], a[2]);
    not(out[3], a[3]);
    
endmodule

module alu_addition(input [3:0]a, input[3:0]b, output[4:0]out);

    ripple_adder m0(.a(a),.b(b),.c_in(0), .out(out[3:0]), .carry(out[4]));

endmodule

module alu_addition_1(input [3:0]a, input[3:0]b, output[4:0]out);

    ripple_adder m0(.a(a), .b(1),.c_in(0), .out(out[3:0]), .carry(out[4]));


endmodule

module alu(input [3:0]a, input [3:0]b, input c_in, input mode, input[2:0]Op, output reg [3:0]out, output reg c_out);
    
    wire [4:0]w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16;
    
    ripple_adder m1(.a(a), .b(b), .c_in(0), .out(w1[3:0]), .carry(w1[4]));
    alu_subtract_a m2(.a(a), .b(b), .out(w2));
    alu_subtract_b m3(.b(b), .a(a), .out(w3));
    alu_and m4(.a(a), .b(b), .out(w4));
    alu_or m5(.a(a), .b(b), .out(w5));
    alu_nand m6(.a(a), .b(b), .out(w6));
    alu_nor m7(.a(a), .b(b), .out(w7));
    alu_xor m8(.a(a), .b(b), .out(w8));
    alu_xnor m9(.a(a), .b(b), .out(w9));
    alu_not m10(.a(a), .out(w10));
    alu_multiply m11(.a(a),.b(b),.out(w11[3:0]),.carry_out(w11[4]));
    alu_addition_1 m12(.a(a), .b(1), .out(w12));
    alu_subtract_a m13(.a(a), .b(1), .out(w13));
    alu_not m14(.a(b), .out(w14));
    alu_subtract_a m15(.a(0), .b(a), .out(w15));
    alu_subtract_a m16(.a(0), .b(b), .out(w16));
    
    always @(*)
    begin
        if(mode == 0) // logical mode
        begin
            if(Op == 3'b000) // a and b
            begin
                out[0] = w4[0];
                out[1] = w4[1];
                out[2] = w4[2];
                out[3] = w4[3];
                c_out = w4[4];
            end
        
            if(Op == 3'b001) // a or b
            begin
                out[0] = w5[0];
                out[1] = w5[1];
                out[2] = w5[2];
                out[3] = w5[3];
                c_out = w5[4];
            end
    
            if(Op == 3'b010) // a nand b
            begin
                out[0] = w6[0];
                out[1] = w6[1];
                out[2] = w6[2];
                out[3] = w6[3];
                c_out = w6[4];
             end
                
            if(Op == 3'b011) // a nor b
            begin
                out[0] = w7[0];
                out[1] = w7[1];
                out[2] = w7[2];
                out[3] = w7[3];  
                c_out = w7[4];     
            end
                
            if(Op == 3'b100) // a xor b
            begin
                out[0] = w8[0];
                out[1] = w8[1];
                out[2] = w8[2];
                out[3] = w8[3];
                c_out = w8[4];
            end
             
            if(Op == 3'b101) // a xnor b
            begin
                out[0] = w9[0];
                out[1] = w9[1];
                out[2] = w9[2];
                out[3] = w9[3];
                c_out = w9[4];
            end
              
             if(Op == 3'b110) // a'
             begin
                out[0] = w10[0];
                out[1] = w10[1];
                out[2] = w10[2];
                out[3] = w10[3];
                c_out = w10[4];
             end
              
             if(Op == 3'b111) // b'
             begin
                out[0] = w14[0];
                out[1] = w14[1];
                out[2] = w14[2];
                out[3] = w14[3];
                c_out = w14[4];
              end
           end
                
        if(mode == 1) // arithmetic mode
        begin
            if(Op == 3'b000) // -b
            begin
                out[0] = w15[3];
                out[1] = w15[2];
                out[2] = w15[1];
                out[3] = w15[0];
                c_out = w15[4];
            end 
             
            if(Op == 3'b001) // -a 
            begin
                out[0] = w16[3];
                out[1] = w16[2];
                out[2] = w16[1];
                out[3] = w16[0];
                c_out = w16[4];
            end
            
            if(Op == 3'b010) // a + b
            begin
                out[0] = w1[0];
                out[1] = w1[1];
                out[2] = w1[2];
                out[3] = w1[3];
                c_out = w1[4];
            end
                
            if(Op == 3'b011) // a - b 
            begin
                out[0] = w2[0];
                out[1] = w2[1];
                out[2] = w2[2];
                out[3] = w2[3];
                c_out = w2[4];
            end
                
            if(Op == 3'b100) // a * b
            begin
                out[0] = w11[0];
                out[1] = w11[1];
                out[2] = w11[2];
                out[3] = w11[3];
                c_out = w11[4];
            end
             
            if(Op == 3'b101) // b - a
            begin
                out[0] = w3[0];
                out[1] = w3[1];
                out[2] = w3[2];
                out[3] = w3[3];
                c_out = w3[4];
            end
              
            if(Op == 3'b110) // a + 1
            begin
                out[0] = w12[0];
                out[1] = w12[1];
                out[2] = w12[2];
                out[3] = w12[3];
                c_out = w12[4];
            end 
              
            if(Op == 3'b111) // a - 1
            begin
                out[0] = w13[0];
                out[1] = w13[1];
                out[2] = w13[2];
                out[3] = w13[3];
                c_out = w13[4];
            end
        end
    end
endmodule
