module tt_um_fullSys #( parameter MAX_COUNT = 24'd10_000_000 ) (
	//input i_clk_in,
	//output wire[6:0] o_disp
	input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
	);
	
	wire clk_out;
	wire[3:0] coun_int;

    wire i_clk_in;
    wire[6:0] o_disp;

	assign clk = i_clk_in;
	assign uo_out[6:0] = o_disp[6:0];
	
	clk_divider c0 (.i_clkPin(i_clk_in), .o_clkPin(clk_out));
	counters c1 (.clk(clk_out), .cout(coun_int));
	final_block c2 (.num_in(coun_int), .disp(o_disp));
	
endmodule
