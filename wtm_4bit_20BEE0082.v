`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2023 15:40:51
// Design Name: 
// Module Name: wtm_4bit_20BEE0082
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
module fa_df(
    input a,b,cin,
    output s,cout
    );
    assign s= a^b^cin;
    assign cout= (a&b)|(b&cin)|(a&cin);
endmodule


module ha_df(
    input a,b,
    output s,cout
    );
    assign s=a^b;
    assign cout=a&b;
endmodule


module wtm_4bit_20BEE0082(
    input [3:0] a,b,
    output [7:0] P
    );
    wire [23:1] w;
    assign P[0]=(a[0]&b[0]);
    
    ha_df ha1((a[1]&b[0]),(a[0]&b[1]),P[1],w[1]);
    fa_df fa1((a[2]&b[0]),(a[1]&b[1]),(a[0]&b[2]),w[2],w[3]);
    fa_df fa2((a[3]&b[0]),(a[2]&b[1]),(a[1]&b[2]),w[4],w[5]);
    fa_df fa3((a[3]&b[1]),(a[2]&b[2]),(a[1]&b[3]),w[6],w[7]);
    ha_df ha2((a[3]&b[2]),(a[2]&b[3]),w[8],w[9]);
    
    ha_df ha3(w[1],w[2],P[2],w[10]);
    fa_df fa4(w[3],w[4],(a[0]&b[3]),w[11],w[12]);
    ha_df ha4(w[5],w[6],w[13],w[14]);
    ha_df ha5(w[7],w[8],w[15],w[16]);
    ha_df ha6(w[9],(a[3]&b[3]),w[17],w[18]);
    
    ha_df ha7(w[10],w[11],P[3],w[19]);
    fa_df fa5(w[12],w[13],w[19],P[4],w[20]);
    fa_df fa6(w[14],w[15],w[20],P[5],w[21]);
    fa_df fa7(w[16],w[17],w[21],P[6],w[22]);
    ha_df ha8(w[18],w[22],P[7],w[23]);
endmodule
