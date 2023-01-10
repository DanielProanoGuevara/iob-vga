/* source file for a clock divider
 in file clock_divider.v
 designed by: Daniel Proaño
              Pedro Faria
 */

`timescale 1ns / 1ps

// Counter based
module clock_divider(
		     input clk, // 100 MHz
		     input rst, // Reset value
		     output reg en// Counter value
		     );

   reg [3:0]  counter_value;
   localparam div_value = 2;
   // division_value = 100MHZ/(2*desired Frequency) counter
   
   // counter
   always@ (posedge clk) begin
      if (rst) begin
	 counter_value <= 0;
         en <= 0;
      end
      else begin      
	 if (counter_value == div_value) begin
	    counter_value <= 0;
	    en <= 1;
	  end
	 else begin
	    counter_value <= counter_value + 1;
	    en <= 0;
	 end
      end 
   end
endmodule // clock_divider
