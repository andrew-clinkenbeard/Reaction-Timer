`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2021 03:10:12 PM
// Design Name: 
// Module Name: debounce_delay
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


module debounce_delay# (parameter N=7)(
    input logic clk,
    input logic rst,
    input logic in,
    output logic out
    );
    
    logic [N-1:0] window, nwindow;
    logic state,nstate;
    
    always_ff@ (posedge clk, posedge rst)
    if(rst)
    begin 
        state<=0;
        window<=0;
    end
    else
    begin 
        state <=nstate;
        window <=nwindow;
    end
    
    
    always_comb 
    case(state)
    0:begin
        nwindow = {in,window[N-1:1]};
        if (&nwindow)
            nstate = 1;
        else
            nstate = 0;
    end
    1: begin 
        nwindow = {in,window[N-1:1]};
        if (!(|nwindow))
            nstate = 1;
        else
            nstate = 0;
    
    end
    endcase 
    
endmodule
