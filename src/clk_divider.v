module clk_divider (
	input i_clkPin,
	input i_ena,
	input wire[7:0] i_indexSelectLine,
	output reg o_clkPin);
	
	// old n = 5000000
	// parameter n = 1000000000;
	reg [32:0] n;
	
	always @(*) begin
		// Change n in respect to i_indexSelectLine
      // Map the 8-bit input range to the desired output range
      // If i_indexSelectLine is 0, set n to a default value (1, which means no division)
		 n = i_indexSelectLine == 0 ? 1 : ((20000000 - 1) * i_indexSelectLine / 255) + 1;
		
		// Change n in respect to i_indexSelectLine
		//case(i_indexSelectLine)
		//	8'b00000001: n = 5000000;
		//	8'b00000010: n = 10000000;
			// Add more cases as needed
		//	default: n = 1000000000; // Default value of n
		//endcase
		
	end
	
	reg t_internal = 0;
	reg[32:0] counts = 0; // [32:0] before
	
	always @ (posedge i_clkPin) begin
		if (i_ena) begin
			counts = counts + 1;
			if (counts == n) begin
				t_internal = !t_internal;
				counts = 0;
			end
			o_clkPin = t_internal;
		end
	end
	
endmodule