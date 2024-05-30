module lcd(clk, rs, rw, en,dat,ascii_0_G,ascii_1_G,ascii_2_G,ascii_0_H,ascii_1_H,ascii_2_H,ascii_0_min,ascii_1_min,ascii_0_sec,ascii_1_sec,ascii_0_period);  
 input clk;  
 input  [7:0] ascii_0_G, ascii_1_G, ascii_2_G;
 input  [7:0] ascii_0_H, ascii_1_H, ascii_2_H;
 input  [7:0] ascii_0_min, ascii_1_min;
 input  [7:0] ascii_0_sec, ascii_1_sec;
 input  [7:0] ascii_0_period;
 output [7:0] dat; 
 output  rs,rw,en; 
 reg [7:0] g0,g1,g2,h0,h1,h2,m0,m1,s0,s1,p;
 //tri en; 
 reg e; 
 reg [7:0] dat; 
 reg rs;   
 reg  [31:0] counter; 
 reg [4:0] current,next; 
 reg clkr; 
 reg [3:0] cnt; 
 parameter  set0=4'h0; 
 parameter  set1=4'h1; 
 parameter  set2=4'h2; 
 parameter  set3=4'h3; 
 parameter  dat0=4'h4; 
 parameter  dat1=4'h5; 
 parameter  dat2=4'h6; 
 parameter  dat3=4'h7; 
 parameter  set4=4'h8; 
 parameter  dat4=4'h9; 

 parameter  dat5=4'hA; 
 parameter  dat6=4'hB; 
 parameter  dat7=4'hC; 
 parameter  dat8=4'hD; 
 parameter  set5=4'hE; 
 parameter  dat9=5'hF; 
 parameter  dat10=5'h10; 
 parameter  dat11=5'h11;
 parameter  dat12=5'h12;
 parameter  dat13=5'h13; 
 parameter  dat14=5'h14;  
 parameter  dat15=5'h15;
 parameter  dat16=5'h16;
 parameter  dat17=5'h17; 
 parameter  dat18=5'h18; 
 parameter  dat19=5'h19;
 parameter  dat20=5'h1A; 
 parameter  dat21=5'h1B; 
 parameter  dat22=5'h1C;
 parameter  dat23=5'h1D;
 parameter  dat24=5'h1F;
 parameter  nul=4'h1E; 
always @(posedge clk)      
 begin 
  counter=counter+1; 
  //if(counter==16'h000f)  
  if(counter== 16'hffff) 
  begin
  clkr=~clkr;
  counter = 0;
  end

end 

always @(posedge clkr) 
begin 
 g0 <= ascii_0_G;
 g1 <= ascii_1_G;
 g2 <= ascii_2_G;
 h0 <= ascii_0_H;
 h1 <= ascii_1_H;
 h2 <= ascii_2_H;
 s0 <= ascii_0_sec;
 s1 <= ascii_1_sec;
 m0 <= ascii_0_min;
 m1 <= ascii_1_min;
 p  <= ascii_0_period;

end
reg [15:0] dl;
always @(negedge clkr) 
begin 
	current=next; 
  case(current) 
    set0:   begin  rs<=0; dat<=8'h38; next<=set1; end 
    set1:   begin  rs<=0; dat<=8'h0c; next<=set2; end 
    set2:   begin  rs<=0; dat<=8'h6; next<=set3; end 
    set3:   begin  rs<=0; dat<=8'h1; next<=dat0; end 
    dat0:   begin  rs<=1; dat<="H"; next<=dat1; end 
    dat1:   begin  rs<=1; dat<="O"; next<=dat2; end 
    dat2:   begin  rs<=1; dat<="M"; next<=dat3; end 
    dat3:   begin  rs<=1; dat<="E"; next<=set4; end
	 
    set4:   begin  rs<=0; dat<=8'h8b; next<=dat4; end 
    dat4:   begin  rs<=1; dat<="G"; next<=dat5; end 
    dat5:   begin  rs<=1; dat<="U"; next<=dat6; end 
    dat6:   begin  rs<=1; dat<="E"; next<=dat7; end 
    dat7:   begin  rs<=1; dat<="S"; next<=dat8; end 
    dat8:   begin  rs<=1; dat<="T"; next<=set5; end 
	 
	 set5:   begin  rs<=0; dat<=8'hc0; next<=dat9; end 
	 
    dat9:   begin  rs<=1; dat<=h2; next<=dat10; end 
	 dat10:   begin  rs<=1; dat<=h1; next<=dat11; end
	 dat11:   begin  rs<=1; dat<=h0; next<=dat12; end
	 dat12:   begin  rs<=1; dat<=" "; next<=dat13; end
	 
	 dat13:   begin  rs<=1; dat<=p; next<=dat14; end 
	 dat14:   begin  rs<=1; dat<="-"; next<=dat15; end
	 dat15:   begin  rs<=1; dat<=m1; next<=dat16; end
	 
	 dat16:   begin  rs<=1; dat<=m0; next<=dat17; end
	 dat17:   begin  rs<=1; dat<=":"; next<=dat18; end
	 dat18:   begin  rs<=1; dat<=s1; next<=dat19; end
	 dat19:   begin  rs<=1; dat<=s0; next<=dat20; end
	 dat20:   begin  rs<=1; dat<=" "; next<=dat21; end

	 dat21:   begin  rs<=1; dat<=" "; next<=dat22; end
	 dat22:   begin  rs<=1; dat<=g2; next<=dat23; end
	 dat23:   begin  rs<=1; dat<=g1; next<=dat24; end
	 dat24:   begin  rs<=1; dat<=g0; next<=nul; end
	 
     nul:   begin rs<=0;  dat<=8'h00;                    //ÐÐÒ»±é È»ºó °ÑÒº¾§µÄE ½Å À­¸ß 
              if(cnt!=2'h2)  
                  begin  
                       e<=0;next<=set0;cnt<=cnt+1;  
                  end  
                   else  
                     begin next<=nul; e<=1; 
                    end    
              end 
   default:   next=set0; 
    endcase 
 end 
assign en=clkr|e; 
assign rw=0; 
endmodule