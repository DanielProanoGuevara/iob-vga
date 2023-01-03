   // VGA
      input clk,
      input  [15:0] pixel,
      output v_sync,
      output h_sync,
      output [3:0] Red,
      output [3:0] Green,
      output [3:0] Blue,
      output reg[31:0] pixel_ADDR,
