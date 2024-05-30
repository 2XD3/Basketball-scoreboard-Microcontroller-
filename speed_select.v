module speed_select(
    input clk,           // System clock: 50 MHz
    input reset,         // Reset signal
    input bps_start,     // Signal to start baud rate clock generation
    output clk_bps       // Baud rate clock signal for UART communication
);

parameter BPS = 5207;    // 9600 baud rate (50 MHz / 9600) ≈ 5207
parameter BPS_half = 2603; // Half of 9600 baud rate

reg [12:0] cnt;         // Counter for clock cycles
reg clk_bps_r;          // Temporary register for clk_bps

         // Active-low reset



always @(posedge clk or negedge reset) begin
    if (!reset) 
        cnt <= 13'd0;
    else if ((cnt == BPS) || !bps_start)
        cnt <= 13'd0;
    else
        cnt <= cnt + 1'b1;
end

always @(posedge clk or negedge reset) begin
    if (!reset)
        clk_bps_r <= 1'b0;
    else if (cnt == BPS_half)
        clk_bps_r <= 1'b1;
    else
        clk_bps_r <= 1'b0;
end

assign clk_bps = clk_bps_r;

endmodule