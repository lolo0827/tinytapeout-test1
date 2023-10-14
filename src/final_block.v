// Final block with case statement
module final_block(

input wire [3:0] num,
output reg [6:0] disp

);

always @(*) begin
case(num)
4'b0000: disp = 7'b1000000;
4'b0001: disp = 7'b1111001;
4'b0010: disp = 7'b0100100;
4'b0011: disp = 7'b0110000;
4'b0100: disp = 7'b0011001;
4'b0101: disp = 7'b0010010;
4'b0110: disp = 7'b0000010;
4'b0111: disp = 7'b1111000;
4'b1000: disp = 7'b1000000;
4'b1001: disp = 7'b0001000;
default: disp = 7'b0000000;
endcase
end

endmodule
