   //
   // VGA
   //

   iob_vga vga
     (
      .clk        (clk),
      .rst        (rst),
      .pixel      (pixel),
      .v_sync     (v_sync),
      .h_sync     (h_sync),
      .Red        (Red),
      .Green      (Green),
      .Blue       (Blue),
      .pixel_ADDR (pixel_ADDR)

      );
