`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2021 01:11:03 PM
// Design Name: 
// Module Name: Patterns
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


module Patterns(
    input logic [15:0] number,
    output logic [7:0] sseg_pattern3,
    output logic [7:0] sseg_pattern2,
    output logic [7:0] sseg_pattern1,
    output logic [7:0] sseg_pattern0
    );
    
    parameter ZERO = 4'b0000;
    parameter ONE = 4'b0001;
    parameter TWO = 4'b0010;
    parameter THREE = 4'b0011;
    parameter FOUR = 4'b0100;
    parameter FIVE = 4'b0101;
    parameter SIX= 4'b0110;
    parameter SEVEN= 4'b0111;
    parameter EIGHT= 4'b1000;
    parameter NINE= 4'b1001;
    parameter H = 4'b1010;
    parameter I = 4'b1011;
    parameter BLANK  = 4'b1100;
    
    
    always_comb 
        begin
        case(number[15:12])
        ZERO: 
            sseg_pattern3 = 8'b11000000;
        ONE:
            sseg_pattern3 = 8'b11111001;
        TWO:
            sseg_pattern3 = 8'b10100100;
        THREE:
            sseg_pattern3 = 8'b10110000;
        FOUR:
            sseg_pattern3 = 8'b10011001;
        FIVE:
            sseg_pattern3 = 8'b10010010;
        SIX:
            sseg_pattern3 = 8'b10000010;
        SEVEN:
            sseg_pattern3 = 8'b11111000;
        EIGHT:
            sseg_pattern3 = 8'b10000000;
        NINE:
            sseg_pattern3 = 8'b10011000;
        H:
            sseg_pattern3 = 8'b10001001;
        I:
            sseg_pattern3 = 8'b11001111;
        default: 
            sseg_pattern3 = 8'b11111111;
        endcase
        case(number[11:8])
        ZERO: 
            sseg_pattern2 = 8'b11000000;
        ONE:
            sseg_pattern2 = 8'b11111001;
        TWO:
            sseg_pattern2 = 8'b10100100;
        THREE:
            sseg_pattern2 = 8'b10110000;
        FOUR:
            sseg_pattern2 = 8'b10011001;
        FIVE:
            sseg_pattern2 = 8'b10010010;
        SIX:
            sseg_pattern2 = 8'b10000010;
        SEVEN:
            sseg_pattern2 = 8'b11111000;
        EIGHT:
            sseg_pattern2 = 8'b10000000;
        NINE:
            sseg_pattern2 = 8'b10011000;
        H:
            sseg_pattern2 = 8'b10001001;
        I:
            sseg_pattern2 = 8'b11001111;
        default: 
            sseg_pattern2 = 8'b11111111;
        endcase
        case(number[7:4])
        ZERO: 
            sseg_pattern1 = 8'b11000000;
        ONE:
            sseg_pattern1 = 8'b11111001;
        TWO:
            sseg_pattern1 = 8'b10100100;
        THREE:
            sseg_pattern1 = 8'b10110000;
        FOUR:
            sseg_pattern1 = 8'b10011001;
        FIVE:
            sseg_pattern1 = 8'b10010010;
        SIX:
            sseg_pattern1 = 8'b10000010;
        SEVEN:
            sseg_pattern1 = 8'b11111000;
        EIGHT:
            sseg_pattern1 = 8'b10000000;
        NINE:
            sseg_pattern1 = 8'b10011000;
        H:
            sseg_pattern1 = 8'b10001001;
        I:
            sseg_pattern1 = 8'b11001111;
        default: 
            sseg_pattern1 = 8'b11111111;
        endcase
        case(number[3:0])
        ZERO: 
            sseg_pattern0 = 8'b11000000;
        ONE:
            sseg_pattern0 = 8'b11111001;
        TWO:
            sseg_pattern0 = 8'b10100100;
        THREE:
            sseg_pattern0 = 8'b10110000;
        FOUR:
            sseg_pattern0 = 8'b10011001;
        FIVE:
            sseg_pattern0 = 8'b10010010;
        SIX:
            sseg_pattern0 = 8'b10000010;
        SEVEN:
            sseg_pattern0 = 8'b11111000;
        EIGHT:
            sseg_pattern0 = 8'b10000000;
        NINE:
            sseg_pattern0 = 8'b10011000;
        H:
            sseg_pattern0 = 8'b10001001;
        I:
            sseg_pattern0 = 8'b11001111;
        default: 
            sseg_pattern0 = 8'b11111111;
        endcase
        end
    
    
    
    

endmodule
