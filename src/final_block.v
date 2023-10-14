module final_block (
	input wire[3:0] num_in,
	input i_ena,
	output wire[6:0] disp);
		
	reg[7:0] internal;
	
	always @(*) begin
		if (i_ena) begin
			if (num_in == 4'b0000)
				internal = 8'h40;
			else if (num_in == 4'b0001)
				internal = 8'h79;
			else if (num_in == 4'b0010)
				internal = 8'h24;
			else if (num_in == 4'b0011)
				internal = 8'h30;
			else if (num_in == 4'b0100)
				internal = 8'h19;
			else if (num_in == 4'b0101)
				internal = 8'h12;
			else if (num_in == 4'b0110)
				internal = 8'h02;
			else if (num_in == 4'b0111)
				internal = 8'h78;
			else if (num_in == 4'b1000)
				internal = 8'h00;
			else if (num_in == 4'b1001)
				internal = 8'h18;
			else
				internal = 8'h7F;
		end
	end
	assign disp = internal[6:0];
	
endmodule
