module counters (
	input clk,
	output wire[3:0] cout);
	
	reg[3:0] internal = 0;
	
	always @(posedge clk) begin
		internal = internal + 1;
		if (internal == 10)
			internal = 0;
	end
	
	assign cout = internal;
	
endmodule

