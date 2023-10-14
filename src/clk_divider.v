module clk_divider(

input clk,
output reg clk_out

);

parameter WIDTH = 32;

reg [WIDTH-1:0] count;

always @(posedge clk) begin
if(count == 32'd5000000) begin
  count <= 0;
  clk_out <= ~clk_out;
end else begin
  count <= count + 1;
end
end

endmodule