module DecimalToASCII(
    input [10:0] decimal,
    output reg [7:0] ascii_0, ascii_1, ascii_2
);


always @* begin
		  ascii_0 = decimal % 10 + 48;
		  ascii_1 = (decimal / 10) % 10 + 48;
		  ascii_2 = (decimal / 100) % 10 + 48;
end


endmodule