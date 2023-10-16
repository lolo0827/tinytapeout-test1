module tt_um_combineBlock (

    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset

);

	//input i_clk_in,
	//input ena,
	//input wire[7:0] indexSelectLine,
	//output reg o_clk_out,
	//output wire[6:0] o_disp);
	
	reg  clk_out_reg; 
	
	wire i_clk_in = clk;
    wire[7:0] indexSelectLine = ui_in[7:0];
    wire clk_out;
    wire[3:0] coun_int;
	wire[6:0] o_disp = uo_out[7:1];
	
	assign uio_oe = 8'b11111111;
	assign uio_out = 8'b11111111;
	
	
	// Included enable pin for tapeout purpose
	clk_divider c0 (.i_clkPin(i_clk_in), .o_clkPin(clk_out), .i_indexSelectLine(indexSelectLine), .i_ena(ena), i_rst_n(rst_n));
	counters c1 (.clk(clk_out), .cout(coun_int), .i_ena(ena));
	final_block c2 (.num_in(coun_int), .disp(o_disp), .i_ena(ena));
	
	always @(*) begin
         if (!rst_n)
            clk_out_reg <= 0;  // reset value
        else
            clk_out_reg <= clk_out;
   end
	
	assign uo_out[0] = clk_out_reg;  // continuous assignment from reg to wire
	
endmodule
	
