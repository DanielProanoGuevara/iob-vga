/* source file for vertical counter module
 saved in vertical_counter.v */

`timescale 1ns / 1ps

module vertical_counter #(
   parameter V_Frame = 524 // Vertical Sync time
)(
       input 		 clk,
       input 		 en,
       input 		 rst, 
       input 		 enable_V_counter,
       output reg [15:0] V_Count_Value = 0
			  );

   always@(posedge clk) begin
      if (rst) begin
	 V_Count_Value <= 0;
      end
      else begin
	 if (en) begin
	    if (enable_V_counter) begin
	       if (V_Count_Value < V_Frame -1) begin // VGA standard
		  V_Count_Value = V_Count_Value + 1;
	       end
	       else begin
		  V_Count_Value <= 0; // Reset vertical counter
	       end
	    end
	 end
      end
   end
endmodule // vertical_counter
