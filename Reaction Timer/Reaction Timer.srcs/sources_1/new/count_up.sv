`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2021 08:57:22 PM
// Design Name: 
// Module Name: count_up
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


module count_up(
    input logic clk,
    input logic rst,
    output logic [15:0] time_elapsed
    );
    
    parameter time_up  = 20'b00011000011010100000;
    logic [31:0] counting;
    logic [31:0] ncount;
    logic [15:0] next_time_elapsed;
    
    always_ff @(posedge clk, posedge rst)
        if (rst)
            begin 
            time_elapsed <= 0;
            counting <= 0;
            end
        else
            begin
            counting <= ncount;
            time_elapsed <= next_time_elapsed;
            end
            
    always_comb 
        if (counting == time_up)
            begin 
                ncount = 0;
                next_time_elapsed = time_elapsed + 1;
            end
        else
            begin
                ncount = counting +1;
                next_time_elapsed = time_elapsed;
            end
            
        
            
            
            
            
     
endmodule
