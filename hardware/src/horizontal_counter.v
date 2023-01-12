/* source file for horizontal counter module
 saved in horizontal_counter.v */

`timescale 1ns / 1ps

module horizontal_counter#(
	parameter H_Frame = 800 //Horizontal Sync time
)(
       input 		 clk,
       input 		 en,
       input 		 rst,
       output reg 	 enable_V_counter = 0,
       output reg [15:0] H_Count_Value = 0
			  );
 
   always@(posedge clk) begin
      if (rst) begin
	 enable_V_counter <= 0;
	 H_Count_Value <= 0;
      end
      else begin
	 if (en) begin
	    if (H_Count_Value < H_Frame -1) begin // VGA standard
	       H_Count_Value <= H_Count_Value + 1;
	       enable_V_counter <= 0;
	    end
	    else begin
	       H_Count_Value <= 0; // Reset horizontal counter
	       enable_V_counter <= 1; // Enable vertical counter
	    end
	 end
      end
   end 
endmodule // horizontal_counter
