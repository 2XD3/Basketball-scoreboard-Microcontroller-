module datapath(plus1_H,plus2_H,plus3_H,minus1_H,minus2_H,minus3_H,plus1_G,plus2_G,plus3_G,minus1_G,minus2_G,minus3_G,reset,pause,clk,ascii_0_H, ascii_1_H, ascii_2_H,ascii_0_G, ascii_1_G, ascii_2_G,ascii_0_min, ascii_1_min,ascii_0_sec, ascii_1_sec,ascii_0_period);
    input clk,reset,plus1_H,plus2_H,plus3_H,minus1_H,minus2_H,minus3_H,plus1_G,plus2_G,plus3_G,minus1_G,minus2_G,minus3_G;
    input pause;
    
	 output  [7:0] ascii_0_G, ascii_1_G, ascii_2_G;
    output  [7:0] ascii_0_H, ascii_1_H, ascii_2_H;
	 output  [7:0] ascii_0_min, ascii_1_min;
	 output  [7:0] ascii_0_sec, ascii_1_sec;
	 output  [7:0] ascii_0_period;
    wire [10:0] score_H,score_G;
	 wire [10:0] min,sec,period;
    adder HOME(clk,reset,plus1_H,plus2_H,plus3_H,minus1_H,minus2_H,minus3_H,score_H);
    adder GUEST(clk,reset,plus1_G,plus2_G,plus3_G,minus1_G,minus2_G,minus3_G,score_G);
    timer timer(.clk(clk),.pause(pause),.reset(reset),.min(min),.sec(sec),.period(period));
    DecimalToASCII dectoAsc_H (.decimal(score_H),.ascii_0(ascii_0_H),.ascii_1(ascii_1_H),.ascii_2(ascii_2_H));
    DecimalToASCII dectoAsc_G (.decimal(score_G),.ascii_0(ascii_0_G),.ascii_1(ascii_1_G),.ascii_2(ascii_2_G));
	 DecimalToASCII dectoAsc_min (.decimal(min),.ascii_0(ascii_0_min),.ascii_1(ascii_1_min),.ascii_2());
	 DecimalToASCII dectoAsc_sec (.decimal(sec),.ascii_0(ascii_0_sec),.ascii_1(ascii_1_sec),.ascii_2());
	 DecimalToASCII dectoAsc_period (.decimal(period),.ascii_0(ascii_0_period),.ascii_1(),.ascii_2());

endmodule