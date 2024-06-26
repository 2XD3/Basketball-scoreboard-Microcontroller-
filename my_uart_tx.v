

module my_uart_tx(clk,reset,clk_bps,rx_data,rx_int,rs232_tx,bps_start);

input clk;			
input reset;		
input clk_bps;	// baudrate	
input[7:0] rx_data;	
input rx_int;		
output rs232_tx;	// RS232 uart
output bps_start;
//---------------------------------------------------------
reg rx_int0,rx_int1,rx_int2;	
wire pos_rx_int;				


always @ (posedge clk or negedge reset) begin
	if(!reset) begin
			rx_int0 <= 1'b0;
			rx_int1 <= 1'b0;
			rx_int2 <= 1'b0;
		end
	else begin
			rx_int0 <= rx_int;
			rx_int1 <= rx_int0;
			rx_int2 <= rx_int1;
		end
end

assign pos_rx_int =  rx_int1 & ~rx_int2;	

//---------------------------------------------------------
reg[7:0] tx_data;	
//---------------------------------------------------------
reg bps_start_r;
reg tx_en;	
reg[3:0] num;

always @ (posedge clk or negedge reset) begin
	if(!reset) begin
			bps_start_r <= 1'bz;
			tx_en <= 1'b0;
			tx_data <= 8'd0;
		end
	else if(pos_rx_int) begin	
			bps_start_r <= 1'b1;
			tx_data <= rx_data;	
			tx_en <= 1'b1;		
		end
	else if(num==4'd11) begin	
			bps_start_r <= 1'b0;
			tx_en <= 1'b0;
		end
end

assign bps_start = bps_start_r;

//---------------------------------------------------------
reg  rs232_tx_r;
always @ (posedge clk or negedge reset) begin
	if(!reset) begin
			num <= 4'd0;
			rs232_tx_r <= 1'b1;
		end
	else if(tx_en) begin
			if(clk_bps)	begin
					num <= num+1'b1;
					case (num)
						4'd0:	rs232_tx_r <= 1'b0; 	//start bit
						4'd1:	rs232_tx_r <= tx_data[0];	//bit0
						4'd2:	rs232_tx_r <= tx_data[1];	//bit1
						4'd3: rs232_tx_r <= tx_data[2];	//bit2
						4'd4: rs232_tx_r <= tx_data[3];	//bit3
						4'd5: rs232_tx_r <= tx_data[4];	//bit4
						4'd6: rs232_tx_r <= tx_data[5];	//bit5
						4'd7:	rs232_tx_r <= tx_data[6];	//bit6
						4'd8: rs232_tx_r <= tx_data[7];	//bit7
						4'd9: rs232_tx_r <= 1'b1;	//stop
					 	default: rs232_tx_r <= 1'b1;
						endcase
				end
			else if(num==4'd11) num <= 4'd0;	
		end
end
 assign rs232_tx = rs232_tx_r;  


endmodule