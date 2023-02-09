`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2023 15:41:34
// Design Name: 
// Module Name: wtm_4bit_tb_20BEE0082
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


module wtm_4bit_tb_20BEE0082(

    );
    reg [3:0] a,b;
    wire [7:0] P;
    reg [7:0] check;
    wtm_4bit_20BEE0082 uut(a,b,P);
    
    initial repeat(10) 
    begin
    a=$random;
    b=$random;
    check=(a*b);
    #10;
    $display($time,"%d * %d = %d (%d) ",a,b,P,check);
    end
endmodule
