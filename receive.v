module receive(
	//input clk,
	input state,
	input [7:0] code,
	output reg pause,
	output reg plus1_G,
	output reg plus2_G,
	output reg plus3_G,
	output reg plus1_H,
	output reg plus2_H,
	output reg plus3_H,
	output reg minus1_G,
	output reg minus2_G,
	output reg minus3_G,
	output reg minus1_H,
	output reg minus2_H,
	output reg minus3_H
	
	);
	//reg [7:0] choose;
	initial begin
		pause=1;
		plus1_G=1;
		plus2_G=1;
		plus3_G=1;
		plus1_H=1;
		plus2_H=1;
		plus3_H=1;
		minus1_G=1;
		minus2_G=1;
		minus3_G=1;
		minus1_H=1;
		minus2_H=1;
		minus3_H=1;
	end
	parameter space=8'h29,
				 A=8'h1c,//+1 HOME
				 S=8'h1b,//+2 HOME
				 D=8'h23,//+3 HOME
				 J=8'h3b,//+1 GUEST
				 K=8'h42,//+2 GUEST
				 L=8'h4b,//+3 GUEST
				 X=8'h22,//-1 HOME
				 C=8'h21,//-2 HOME
				 V=8'h2a, //-3 HOME
				 B=8'h32, //-1 GUEST
				 N=8'h31, //-2 GUEST
				 M=8'h3a; //-3 GUEST
				 
	always@(*) begin
	
	//if(state==1) begin
		
		case(code) 
			A: begin
						pause=0;
						plus1_G=1;
						plus2_G=1;
						plus3_G=1;
						plus1_H=0;
						plus2_H=1;
						plus3_H=1;
						minus1_G=1;
						minus2_G=1;
						minus3_G=1;
						minus1_H=1;
						minus2_H=1;
						minus3_H=1;
						
					end
			S: begin
						pause=0;
						plus1_G=1;
						plus2_G=1;
						plus3_G=1;
						plus1_H=1;
						plus2_H=0;
						plus3_H=1;
						minus1_G=1;
						minus2_G=1;
						minus3_G=1;
						minus1_H=1;
						minus2_H=1;
						minus3_H=1;
					end
			D: begin
						pause=0;
						plus1_G=1;
						plus2_G=1;
						plus3_G=1;
						plus1_H=1;
						plus2_H=1;
						plus3_H=0;
						minus1_G=1;
						minus2_G=1;
						minus3_G=1;
						minus1_H=1;
						minus2_H=1;
						minus3_H=1;
					end
			J: begin
						pause=1;
						plus1_G=0;
						plus2_G=1;
						plus3_G=1;
						plus1_H=1;
						plus2_H=1;
						plus3_H=1;
						minus1_G=1;
						minus2_G=1;
						minus3_G=1;
						minus1_H=1;
						minus2_H=1;
						minus3_H=1;
					end
			K: begin
						pause=0;
						plus1_G=1;
						plus2_G=0;
						plus3_G=1;
						plus1_H=1;
						plus2_H=1;
						plus3_H=1;
						minus1_G=1;
						minus2_G=1;
						minus3_G=1;
						minus1_H=1;
						minus2_H=1;
						minus3_H=1;
					end
			L: begin
						pause=0;
						plus1_G=1;
						plus2_G=1;
						plus3_G=0;
						plus1_H=1;
						plus2_H=1;
						plus3_H=1;
						minus1_G=1;
						minus2_G=1;
						minus3_G=1;
						minus1_H=1;
						minus2_H=1;
						minus3_H=1;
					end
				X: begin
						pause=0;
						plus1_G=1;
						plus2_G=1;
						plus3_G=1;
						plus1_H=1;
						plus2_H=1;
						plus3_H=1;
						minus1_G=1;
						minus2_G=1;
						minus3_G=1;
						minus1_H=0;
						minus2_H=1;
						minus3_H=1;
						
					end
			C: begin
						pause=0;
						plus1_G=1;
						plus2_G=1;
						plus3_G=1;
						plus1_H=1;
						plus2_H=1;
						plus3_H=1;
						minus1_G=1;
						minus2_G=1;
						minus3_G=1;
						minus1_H=1;
						minus2_H=0;
						minus3_H=1;
					end
			V: begin
						pause=0;
						plus1_G=1;
						plus2_G=1;
						plus3_G=1;
						plus1_H=1;
						plus2_H=1;
						plus3_H=1;
						minus1_G=1;
						minus2_G=1;
						minus3_G=1;
						minus1_H=1;
						minus2_H=1;
						minus3_H=0;
					end
			B: begin
						pause=0;
						plus1_G=1;
						plus2_G=1;
						plus3_G=1;
						plus1_H=1;
						plus2_H=1;
						plus3_H=1;
						minus1_G=0;
						minus2_G=1;
						minus3_G=1;
						minus1_H=1;
						minus2_H=1;
						minus3_H=1;
					end
			N: begin
						pause=0;
						plus1_G=1;
						plus2_G=1;
						plus3_G=1;
						plus1_H=1;
						plus2_H=1;
						plus3_H=1;
						minus1_G=1;
						minus2_G=0;
						minus3_G=1;
						minus1_H=1;
						minus2_H=1;
						minus3_H=1;
					end
			M :begin
						pause=0;
						plus1_G=1;
						plus2_G=1;
						plus3_G=1;
						plus1_H=1;
						plus2_H=1;
						plus3_H=1;
						minus1_G=1;
						minus2_G=1;
						minus3_G=0;
						minus1_H=1;
						minus2_H=1;
						minus3_H=1;
					end	
			
					
			space: begin
						pause=0;
						plus1_G=1;
						plus2_G=1;
						plus3_G=1;
						plus1_H=1;
						plus2_H=1;
						plus3_H=1;
						minus1_G=1;
						minus2_G=1;
						minus3_G=1;
						minus1_H=1;
						minus2_H=1;
						minus3_H=1;
					end
					
					
			default:  begin
						pause=1;
						plus1_G=1;
						plus2_G=1;
						plus3_G=1;
						plus1_H=1;
						plus2_H=1;
						plus3_H=1;
						minus1_G=1;
						minus2_G=1;
						minus3_G=1;
						minus1_H=1;
						minus2_H=1;
						minus3_H=1;
					end
			endcase
		
		
	end
endmodule