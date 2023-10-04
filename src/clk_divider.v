module clk_divider (
	input i_clkPin,
	output reg o_clkPin);
	
	parameter n = 5000000;
	
	reg t_internal = 0;
	reg[32:0] counts = 0;
	
	always @ (posedge i_clkPin) begin
		counts = counts + 1;
		if (counts == n) begin
			t_internal = !t_internal;
			counts = 0;
		end
		o_clkPin = t_internal;
	end
	
endmodule
