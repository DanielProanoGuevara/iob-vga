`timescale 1ns / 1ps

module vga_tb;
   
   parameter clk_frequency = 100e6; //100 MHz
   parameter clk_per = 1e9/clk_frequency;
   parameter address = 640*480;
   
   //iterator
   integer			i;

   // Inputs
   reg 			 	clk;
   reg 			 	rst;
   reg [15:0]  		pixel; 
      
   // Outputs
   reg [31:0]  		pixel_ADDR; 
   reg 			 	v_sync;
   reg 			 	h_sync;
   reg [3:0]  		Red;
   reg [3:0]  		Green;
   reg [3:0]  		Blue;

				
   initial begin

`ifdef VCD
      $dumpfile("uut.vcd");
      $dumpvars;
`endif

      // Initialize Inputs
      clk = 1;
      rst = 1;
      
      pixel = 32'hFFFF;
	  	  
      $display("VGA init");

      // deassert hard reset
      #100 @(posedge clk) #1 rst = 0;

      #clk_per;      
      $display("Test completed successfully.");
      #(2000000*clk_per) $finish;

   end // initial begin

   initial begin

      forever    
	 #10 $display("Address: %h", pixel_ADDR);
      	  
   end

   // Instantiate the Unit Under Test (UUT)
   iob_vga uut
     (
      .clk(clk),
      .rst(rst),
      .pixel(pixel),
      .v_sync(v_sync),
      .h_sync(h_sync),
      .Red(Red),
      .Green(Green),
      .Blue(Blue),
      .pixel_ADDR(pixel_ADDR)          
      );

   // system clock
   always #(clk_per/2) clk = ~clk;

endmodule // vga_tb