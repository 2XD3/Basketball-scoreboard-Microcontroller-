module timer(clk,pause,min,sec,reset,period);
input clk,pause,reset;
output reg [10:0] min,sec;
output reg [10:0] period;

reg [31:0] tick;
reg clkt,p,stop;
wire reset_n=~reset;
always @(posedge clk)
begin
	 if (reset_n) begin
        tick <= 0;
        clkt <= 0;
    end else begin
        tick <= tick + 1;
        if (tick == 25000000) begin	//tick=25000000
            clkt <= ~clkt;
            tick <= 0;
        end
    end
end
always @(posedge pause) begin
	p <= ~p;
end

always @(posedge clkt or posedge reset_n) begin
    if (reset_n) begin
        min <= 10;
        sec <= 0;	  
    end else begin   
        if (!p^!stop) begin
		  stop=0;
            if (min > 0 || sec > 0) begin
                if (sec == 0) begin
                    if (min > 0) beginstop
                        min <= min - 1;
                        sec <= 59;
                    end
                end else begin
                    sec <= sec - 1;
                end
            end else if (period<4) begin period<=period + 1; min<=10; sec<=0; stop=1;  end
        end
    end
	 //if ((min==0) && (sec==0) && (period<5)) period= period+1;
end

initial begin
    min <= 10;
    sec <= 0;
	 clkt = 0;
	 period <=1;
end
endmodule