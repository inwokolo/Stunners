`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2020 01:01:17 PM
// Design Name: 
// Module Name: seven_seg
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


module seven_seg(
    input mode,
    input clk,
    input [3:0] instruction,
    input [3:0] numA,
    input [3:0] numB,
    input [3:0] dec_output,

    output reg[6:0] hexnum,
    output reg[7:0] Anode_Activate
    );

    reg[19:0] refresh;
    reg[4:0] num;
    wire[1:0] counter;
    wire[3:0] dec_num1, dec_num2;
    wire c_out;
    
    bin_to_dec(.bin_num(dec_output), .dec_num1(dec_num1), .dec_num2(dec_num2), .c_out(c_out));
   
    always @(posedge clk )
    begin 
        if(refresh ==1048576 )
            refresh <= 0;
        else
            refresh <= refresh + 1;
    end 
     assign counter = refresh[19:18];
    // anode activating signals for 4 LEDs, digit period of 2.6ms
    // decoder to generate anode signals 
    always @(*)
    begin
        if(mode ==0) 
        begin
        case(counter)
        
          2'b00: begin
            Anode_Activate = 8'b00000111; 
            // activate LED4 and Deactivate LED2, LED3, LED1
            num = 4'b0000;
            // the fourth digit of the 16-bit number    
               end
               
        2'b01: begin
          Anode_Activate = 8'b11111011; 
            // activate LED3 and Deactivate LED2, LED1, LED4
            num = instruction;
         
            // the first digit of the 16-bit number
              end
        2'b10: begin
            Anode_Activate = 8'b11111101; 
            // activate LED2 and Deactivate the rest
            num = numA;
            // the second digit of the 16-bit number
              end
        2'b11: begin
           Anode_Activate = 8'b11111110; 
            // activate LED1 and Deactivate the rest
            num = numB;
          
            // the third digit of the 16-bit number
                end
      
        endcase
        end
        
        else // show decimal output
        begin
            case(counter)
        
          2'b00: begin
            Anode_Activate = 8'b00000111; 
            // activate LED4 and Deactivate LED2, LED3, LED1
            num = 5'b00000;
            // the fourth digit of the 16-bit number    
               end
         2'b01: begin
          Anode_Activate = 8'b11111011;
          if(instruction == 4'b0000)

         num = 5'b10000;
   
          else if(instruction == 4'b0001) 
  
         num = 5'b10000;   //0000001
 
          else if ((instruction == 4'b0101) && (numA<numB)) 
      
           num = 5'b10000; 
           
          else if ((instruction == 4'b1001) && (numB<numA))
          num = 5'b10000;
          
          else
          num = 5'b00000;
          end
        2'b10: begin
          Anode_Activate = 8'b11111101; 
            // activate LED3 and Deactivate LED2, LED1, LED4
            if(dec_output < 4'b1010) 
            num = 5'b00000;
            else
            num = 5'b00001;
         
            // the first digit of the 16-bit number
              end
         2'b11: begin
      Anode_Activate = 8'b11111110; 
        // activate LED3 and Deactivate LED2, LED1, LED4
        num = dec_num2;
     
        // the first digit of the 16-bit number
          end
          
         
         
        endcase
       
       end
       end

    always @(*)
    begin
        case (num)
       5'b00000 : hexnum <= 7'h01;  
       5'b00001 : hexnum <= 7'h4F;
       5'b00010 : hexnum <= 7'h12;
       5'b00011 : hexnum <= 7'h06;
       5'b00100 : hexnum <= 7'h4C;          
       5'b00101 : hexnum <= 7'h24;
       5'b00110 : hexnum <= 7'h20;
       5'b00111 : hexnum <= 7'h0F;
       5'b01000 : hexnum <= 7'h00;
       5'b01001 : hexnum <= 7'h04;
       5'b01010 : hexnum <= 7'h08; // 0001000
       5'b01011 : hexnum <= 7'h60; //1100000
       5'b01100 : hexnum <= 7'h31; //0110001
       5'b01101 : hexnum <= 7'h42; //1000010
       5'b01110 : hexnum <= 7'h30; //0110000
       5'b01111 : hexnum <= 7'h38; //0111000
       5'b10000 : hexnum <= 7'h7E; // negative dash 1111110
        
        
        endcase
    end
    
//    assign A = ~hexnum[6];
//    assign B = ~hexnum[5];
//    assign C = ~hexnum[4];
//    assign D = ~hexnum[3];
//    assign E = ~hexnum[2];
//    assign F = ~hexnum[1];
//    assign G = ~hexnum[0];
    
endmodule
