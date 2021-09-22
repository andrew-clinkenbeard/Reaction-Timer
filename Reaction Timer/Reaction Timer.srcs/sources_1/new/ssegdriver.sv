`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2021 02:55:47 PM
// Design Name: 
// Module Name: ssegdriver
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


module ssegdriver(
    input logic clk,
    input logic rst,
    input logic [7:0] ss0,
    input logic [7:0] ss1,
    input logic [7:0] ss2,
    input logic [7:0] ss3,
    output logic [7:0] an,
    output logic [7:0] sseg
    );
    logic [1:0] count;
    
    counter# (.N(18), .M(2)) mycounter(
    .clk(clk),
    .rst(rst),
    .count(count)
    );
    
    always_comb 
    case(count)
    0: begin 
        sseg = ss0;
        an=4'b1110;
        end
    1: begin 
        sseg = ss1;
        an=4'b1101;
        end
    2: begin 
        sseg = ss2;
        an=4'b1011;
        end
    default: begin 
        sseg = ss3;
        an=4'b0111;
        end
    endcase 
    
    assign an[7:4] = 4'b1111;
endmodule
