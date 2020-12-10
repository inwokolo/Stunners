`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2020 07:28:27 PM
// Design Name: 
// Module Name: divider
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


module divider(a,b,Q,R);

input [7:0]a;
input [7:0]b;
output [7:0]Q;
output [7:0]R;

reg [7:0]Q = 0;
reg [7:0]R = 0;
reg a1,b1;
reg x;
integer i;

always@*
begin
    a1 = a;
    b1 = b;
    x = 0;
    
    if (a1[7]==1)
    a1=0-a1;
    if(b1[7]==1)
    b1=0-b1;
    if(b1[7]==1) begin
    b1=0-b1; 
    a1=0-a1;
    end
    
for(i=0; i<8; i=i+1)   begin
        x = {x[6:0],a1[7]};
        a1[7:1] = a1[6:0];
        x = x-b1;
        if(x[7]==1) begin
            a1[0]=0;
            x=x+b1;
            end
        else
            a1[0]=1;
    end
    Q=a1;
    R=x;
    
endmodule
