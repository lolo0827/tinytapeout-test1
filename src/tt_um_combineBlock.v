module tt_um_combineBlock(

input wire clk,
input wire rst_n,

input wire [7:0] ui_in,
output wire [7:0] uo_out,

input wire [7:0] uio_in,
output wire [7:0] uio_out,

output wire [7:0] uio_oe

);

// Pass clock directly
wire clk_div;

// Add register to pipeline clock
(* dont_touch = "true" )
( ASYNC_REG = "true" *)
reg clk_div_reg;

always @(posedge clk or negedge rst_n) begin
if(~rst_n) begin
clk_div_reg <= 1'b0;
end else begin
clk_div_reg <= clk_div;
end
end

assign clk_div = clk_div_reg;

// Instance modules
clk_divider c0(.clk(clk), .clk_out(clk_div));

counters c1(.clk(clk_div));

final_block c2(.clk(clk_div));

// IO assignments
assign uio_oe = 8'b11111111;
assign uio_out = 8'b11111111;

always @(*) begin
if(!rst_n) begin
uo_out <= 8'b00000000;
end else begin
uo_out[0] <= clk_div_reg;
uo_out[7:1] <= c2.disp;
end
end

endmodule
	
