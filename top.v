//module top(clk, rs, rw, en,dat,reset,plus2_H, plus2_G, plus3_H,plus3_G,pause);
module top(clk, rs, rw, en,dat,ps2k_clk,ps2k_data,reset);
 input clk,reset; 
 input ps2k_clk,ps2k_data; 
 output [7:0] dat; 
 output  rs,rw,en; 
 
	 //input plus2_H, plus2_G, plus3_H,plus3_G;
    //input pause;
	 wire plus1_H,plus2_H,plus3_H,minus1_H,minus2_H,minus3_H,plus1_G,plus2_G,plus3_G,minus1_G,minus2_G,minus3_G;
    wire pause;
	 //wire rst;
    
    wire [9:0] decimal;
	 wire  [7:0] ascii_0_G, ascii_1_G, ascii_2_G;
    wire  [7:0] ascii_0_H, ascii_1_H, ascii_2_H;
	 wire  [7:0] ascii_0_min, ascii_1_min;
	 wire  [7:0] ascii_0_sec, ascii_1_sec;
	 wire [7:0] ascii_0_period;

	 
	 datapath d(plus1_H,plus2_H,plus3_H,minus1_H,minus2_H,minus3_H,
	 plus1_G,plus2_G,plus3_G,minus1_G,minus2_G,minus3_G,reset,pause,
	 clk,ascii_0_H, ascii_1_H, ascii_2_H,ascii_0_G, ascii_1_G, 
	 ascii_2_G,ascii_0_min, ascii_1_min,ascii_0_sec, ascii_1_sec,ascii_0_period);
		
	 ps2_key p(clk,reset,ps2k_clk,ps2k_data,pause,plus1_G,plus2_G,plus3_G,plus1_H,plus2_H,plus3_H,minus1_G,
	minus2_G,minus3_G,minus1_H,minus2_H,minus3_H	);
	 
	lcd l(clk, rs, rw, en,dat,
	ascii_0_G,ascii_1_G,ascii_2_G,ascii_0_H,
	ascii_1_H,ascii_2_H,ascii_0_min,ascii_1_min,
	ascii_0_sec,ascii_1_sec,ascii_0_period);
endmodule