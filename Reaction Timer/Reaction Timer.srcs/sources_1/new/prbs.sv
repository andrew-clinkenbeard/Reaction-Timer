`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2021 02:42:24 PM
// Design Name: 
// Module Name: prbs
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


module prbs# (parameter N=25, parameter M=1)(
    input logic clk,
    input logic rst,
    output logic [M-1:0] rdm_num
    );
    
    logic [N-1:0] state, nstate;
    logic tapResult;
    
    assign rdm_num = state[M-1:0];
    
    always_ff @(posedge clk, posedge rst)
        if(rst)
            state <= {N{1'b1}};
        else
            state <= nstate;
            
            
    assign nstate = {tapResult, state[N-1:1]}; // shift reister
    
    assign tapResult = state[3]^state[0]; // 25 bit
    
    
    
endmodule
