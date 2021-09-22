`timescale 1ns / 1ps


module state(
    input logic clk,
    input logic reset_n,
    input logic [0:4] btn,
    output logic [7:0] sseg,
    output logic [7:0] an,
    output logic LED0
    );
    
    // display parameters
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
    
    
    typedef enum logic [2:0] {HI, WAIT_REACT, START_REACTION, EARLY, TEST, LATE, DONE} State;  
    State current_state;
    State next_state;  
    logic start_btn;
    logic react_btn;
    logic rest_btn;
    
    logic [15:0] display_num;
    logic [7:0] pattern_2_sseg3;
    logic [7:0] pattern_2_sseg2;
    logic [7:0] pattern_2_sseg1;
    logic [7:0] pattern_2_sseg0;
    

    logic time_rest;
    logic [15:0] ms_ticks;
    logic [15:0] bcd_2_pattern;
    logic [15:0] random = 16'b0000010111011100;       
                                                      
   
    logic [15:0] score;
    logic [7:0] my_random;

  
    assign rst = rest_btn;
    always_ff @(posedge clk, posedge rst)
        if (rst)
            current_state <= HI;
        else
            current_state <= next_state;
    
    
    always_comb @(posedge clk)
    case(current_state)
    HI:
        begin
        display_num = {H,I, BLANK , BLANK };
        LED0 = 0;
        time_rest = 1'b1;
        if (start_btn)
            begin
            next_state = WAIT_REACT;
            time_rest = 1'b1;
            random = {3'b000, my_random, 5'b11000};
            end
        else
            next_state = HI;
        end
    WAIT_REACT:
        begin
        time_rest = 1'b0;
        display_num = { BLANK , BLANK , BLANK , BLANK};
        if (ms_ticks >= random)
            begin
            next_state = START_REACTION;
            LED0 = 1;
            //time_rest = 1'b1;
            end
        else if (react_btn)
            next_state = EARLY;
        else
            next_state = WAIT_REACT;
        end
    START_REACTION:
        begin 
        LED0 = 1;
        display_num = bcd_2_pattern;
        time_rest = 1'b1;
        next_state = TEST;
        
        end
    
    EARLY:
        begin
            LED0 = 0;
            display_num = { NINE,NINE,NINE,NINE};
        end
  
    TEST:
        begin
        display_num = bcd_2_pattern;
        time_rest = 0;
        if (react_btn)
            begin
            score = bcd_2_pattern;
            next_state = DONE;
            end

            if (ms_ticks > 1000)
                next_state = LATE;
        end
   
    LATE:
        begin
            LED0 = 0;
            display_num = { ONE,ZERO,ZERO,ZERO}; 
        end
    
    DONE:
        begin
            LED0 = 0;
            display_num = score;
        end   
    
    endcase 
    
    count_up ms_counter(
    .clk(clk),
    .rst(time_rest),
    .time_elapsed(ms_ticks)
    );
    
    

    bin_2_bcd my_bin2bcd   (
    .bin(ms_ticks),
    .bcd0(bcd_2_pattern[3:0]), 
    .bcd1(bcd_2_pattern[7:4]), 
    .bcd2(bcd_2_pattern[11:8]), 
    .bcd3(bcd_2_pattern[15:12])
    );
    
    ssegdriver myssegdriver(
    .clk(clk),
    .rst(!reset_n),
    .ss0(pattern_2_sseg0),
    .ss1(pattern_2_sseg1),
    .ss2(pattern_2_sseg2),
    .ss3(pattern_2_sseg3),
    .an(an),
    .sseg(sseg)
    );
    
    
    Patterns myPattern(
    .number(display_num),
    .sseg_pattern3(pattern_2_sseg3),
    .sseg_pattern2(pattern_2_sseg2),
    .sseg_pattern1(pattern_2_sseg1),
    .sseg_pattern0(pattern_2_sseg0)
    );
    
    
    
    // debounce buttons
    // start button
    debounce_imm# (.N(4)) debounce0(
    .clk(clk),
    .rst(!reset_n),
    .in(btn[3]),
    .out(start_btn)
    );
    
    // react button
    debounce_imm# (.N(4)) debounce1( // start button
    .clk(clk),
    .rst(!reset_n),
    .in(btn[4]),
    .out(react_btn)
    );
    
    // reset button
    debounce_imm# (.N(4)) debounce2( // stop button
    .clk(clk),
    .rst(!reset_n),
    .in(btn[1]),
    .out(rest_btn)
    );
    
    
    prbs#  (.N(25), .M(8))my_rdm_number(
    .clk(clk),
    .rst(!reset_n) ,
    .rdm_num(my_random)
    );
   
endmodule
