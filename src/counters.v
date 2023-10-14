module counters (
	input clk,
	input i_ena,
	output wire[3:0] cout);
	
	reg[3:0] internal = 0;
	
	always @(posedge clk) begin
		if (i_ena) begin
			internal = internal + 1;
			if (internal == 10)
				internal = 0;
		end
	end
	
	assign cout = internal;
	
endmodule

