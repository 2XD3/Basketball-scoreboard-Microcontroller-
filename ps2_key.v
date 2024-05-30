
module ps2_key(
	input clk,
	input reset,
	//input[3:0] switch,
	input ps2k_clk,
	input ps2k_data,
	//output rs232_tx,
	output  pause,
	output plus1_G,
	output  plus2_G,
	output  plus3_G,
	output plus1_H,
	output  plus2_H,
	output  plus3_H,
	output minus1_G,
	output  minus2_G,
	output  minus3_G,
	output minus1_H,
	output  minus2_H,
	output  minus3_H	);

wire[7:0] ps2_byte;	// last byte read from PS/2 device
wire ps2_state;		// state of PS/2 port (low = resetting)

//wire bps_start;		
//wire clk_bps;		

ps2scan			ps2scan(	.clk(clk),
								.reset(reset),
								.ps2k_clk(ps2k_clk),
								.ps2k_data(ps2k_data),
								.ps2_byte(ps2_byte),
								.ps2_state(ps2_state),
								);
/*
speed_select	speed_select(	.clk(clk),
										.reset(reset),
										.bps_start(bps_start),
										.clk_bps(clk_bps)
										);

my_uart_tx		my_uart_tx(		.clk(clk),
										.reset(reset),
										.clk_bps(clk_bps),
										.rx_data(ps2_byte),
										.rx_int(ps2_state),
										.rs232_tx(rs232_tx),
										.bps_start(bps_start)
										);
										*/
receive			digits(	//.clk(clk),
								.state(ps2_state),
								.code(ps2_byte),
								.plus1_G(plus1_G),
								.plus2_G(plus2_G),
								.plus3_G(plus3_G),
								.plus1_H(plus1_H),
								.plus2_H(plus2_H),
								.plus3_H(plus3_H),
								.minus1_G(minus1_G),
								.minus2_G(minus2_G),
								.minus3_G(minus3_G),
								.minus1_H(minus1_H),
								.minus2_H(minus2_H),
								.minus3_H(minus3_H),
								.pause(pause)
								);

endmodule
