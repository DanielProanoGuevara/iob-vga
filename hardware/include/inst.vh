   //
   // VGA
   //

   iob_vga vga
     (
      .clk        (clk),
      .rst        (rst),
      .rgb        (rgb),
      .v_sync     (v_sync),
      .h_sync     (h_sync),
      .Red        (Red),
      .Green      (Green),
      .Blue       (Blue),
      .pixel_x    (pixel_x),
      .pixel_y    (pixel_y)
      );
