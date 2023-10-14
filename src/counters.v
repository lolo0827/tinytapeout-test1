// Counter with case statement
module counters(

input clk,
output reg [3:0] cout

);

reg [3:0] count;

always @(posedge clk) begin
if(count == 4'd9) begin
  count <= 0;
end else begin
  count <= count + 1;
end
end

always @(*) begin
case(count)
4'd0: cout = 4'b0000;
4'd1: cout = 4'b0001;
4'd2: cout = 4'b0010;
4'd3: cout = 4'b0011;
4'd4: cout = 4'b0100;
4'd5: cout = 4'b0101;
4'd6: cout = 4'b0110;
4'd7: cout = 4'b0111;
4'd8: cout = 4'b1000;
4'd9: cout = 4'b1001;
default: cout = 4'b0000;
endcase
end

endmodule
