`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2021 07:06:14 PM
// Design Name: 
// Module Name: bin_2_bcd
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


module bin_2_bcd(
    input logic [15:0] bin,
    output logic [3:0] bcd0,
    output logic [3:0] bcd1,
    output logic [3:0] bcd2,
    output logic [3:0] bcd3

    );
    
integer i;

    always_comb 
    begin
        bcd3 = 4'd0;
        bcd2 = 4'd0;
        bcd1 = 4'd0;
        bcd0 = 4'd0;
        
        
        for (i=15; i>=0; i--)
        begin
            if(bcd3 >= 5)
                bcd3 += 3;
            if(bcd2 >= 5)
                bcd2 += 3;
            if(bcd1 >= 5)
                bcd1 += 3;
            if(bcd0 >= 5)
                bcd0 += 3;
            
            bcd3 = bcd3 << 1;
            bcd3[0]=bcd2[3];
            bcd2 = bcd2 << 1;
            bcd2[0]=bcd1[3];
            bcd1 = bcd1 << 1;
            bcd1[0]=bcd0[3];
            bcd0 = bcd0 << 1;
            bcd0[0]=bin[i];
        end
    end
endmodule
