`default_nettype none

//------------------------------------------------------------------
//-- Using a PLL for a 200 MHz system clock.
//------------------------------------------------------------------

module main #(
    parameter integer DIV = 100_000_000
) (
    input  wire ext_clk,  // 100 MHz board clock
    output reg  LED       // LED to blink
);

  // PLL 100 MHz -> 200 MHz
  //
  // Generated with:
  //   apio raw -- xc7pll -i 100 -o 200 -m -f pll.v
  //   apio format pll.v
  //
  // (See pll.v for the simulation support that was added manually.)

  // 200 MHz clock from the PLL.
  wire sys_clk;

  // Generates the system clock.
  pll pll (
      .clk_in  (ext_clk),  // In 100 MHz
      .clk_out0(sys_clk),  // Out 200 MHz
      .locked  ()
  );

  reg initialized = 1'b0;

  reg [31:0] counter;

  always @(posedge sys_clk) begin
    if (!initialized) begin
      // One time initialization.
      initialized <= 1'b1;
      LED <= 1'b1;
      counter <= 0;
    end else if (counter >= (DIV - 1)) begin
      // Delay reached, flip LED and reset counter.
      LED <= !LED;
      counter <= 0;
    end else begin
      // Incrementing the delay counter.
      counter <= counter + 1;
    end
  end

endmodule
