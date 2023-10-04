module tt_um_fullSys (
	input i_clk_in,
	output wire[6:0] o_disp);
	
	wire clk_out;
	wire[3:0] coun_int;
	
	clk_divider c0 (.i_clkPin(i_clk_in), .o_clkPin(clk_out));
	counters c1 (.clk(clk_out), .cout(coun_int));
	final_block c2 (.num_in(coun_int), .disp(o_disp));
	
endmodule
