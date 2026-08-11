// A testbench of main.v.

`include "apio_testing.vh"

`timescale 10 ns / 1 ns

module main_tb ();

  // This defines a managed signal called 'clk'.
  `DEF_CLK

  // Module's output.
  wire [3:0] leds;

  main #(
      .CLK_DIV(6)
  ) main (
      .CLK (clk),
      .LEDS(leds)
  );

  initial begin
    `TEST_BEGIN(main_tb)

    // Free run for 16 clocks.
    `CLKS(16)

    // Assert on expected led value.
    `EXPECT(leds, 'b1000)

    `TEST_END
  end

endmodule
