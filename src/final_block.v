
// LED blink with switch

//module final_block ( 
//	i_clock, //50MHz clk
//	i_enable,
//	i_switch_1,
//	i_switch_2,
//	o_led_drive);
//  
//	input i_clock; 
//	input i_enable;
//	input i_switch_1; 
//	input i_switch_2;
//	output o_led_drive;
//  
//	parameter c_CNT_50Hz = 500000;
//	parameter c_CNT_1Hz = 2500000;
//  
//	reg [31:0] r_CNT_50Hz = 0;
//	reg [31:0] r_CNT_1Hz = 0;
//  
//	reg r_TOGGLE_50Hz = 1'b0;
//	reg r_TOGGLE_1Hz  = 1'b0;
//  
//	reg  r_LED_SELECT;
//	wire w_LED_SELECT;
//  
//  
//	always @ (posedge i_clock)
//		begin
//			if (r_CNT_50Hz == c_CNT_50Hz-1)
//				begin
//					r_TOGGLE_50Hz <= !r_TOGGLE_50Hz;
//					r_CNT_50Hz = 0;
//				end
//			else
//				begin
//					r_CNT_50Hz <= r_CNT_50Hz + 1;
//				end
//		end
//  
//	always @ (posedge i_clock)
//		begin
//			if (r_CNT_1Hz == c_CNT_1Hz-1)
//				begin
//					r_TOGGLE_1Hz <= !r_TOGGLE_1Hz;
//					r_CNT_1Hz = 0;
//				end
//			else
//				begin
//					r_CNT_1Hz <= r_CNT_1Hz + 1;
//				end
//		end
//	
//	//MUX
//	always @ (*)
//	begin
//		case ({i_switch_1,i_switch_2})
//			2'b11   : r_LED_SELECT <= r_TOGGLE_50Hz;
//			2'b10   : r_LED_SELECT <= r_TOGGLE_50Hz;
//			2'b01   : r_LED_SELECT <= r_TOGGLE_1Hz;
//			2'b00	  : r_LED_SELECT <= r_TOGGLE_1Hz;
//		endcase
//	end
//	
//	assign o_led_drive = r_LED_SELECT & i_enable;
//
//endmodule

// My trial

//module final_block (
//	o_led,
//	i_en,
//	i_clk);
//
//	input i_en;
//	input i_clk;
//	output o_led;
//
//	parameter c_freq = 25000000;
//	
//	reg [32:0] r_count = 0;
//	
//	reg r_led_toggle = 1'b0;
//
//	always @ (negedge i_clk)
//		begin
//			if(r_count == c_freq-1)
//			begin
//				r_led_toggle <= !r_led_toggle;
//				r_count = 0;
//			end
//			else 
//			begin
//				r_count = r_count + 1;
//			end
//		end
//	
//	
//
//	assign o_led = r_led_toggle & i_en;
//
//endmodule

// Moore Machine Example
module final_block (
	input wire[3:0] num_in,
	output wire[6:0] disp);
		
	reg[7:0] internal;
	
	always @(*) begin
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
	assign disp = internal[6:0];
	
endmodule
