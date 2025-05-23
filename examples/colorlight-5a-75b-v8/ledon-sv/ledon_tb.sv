//-------------------------------------------------------------------
//-- ledon_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Juan Gonzalez (Obijuan)
//-- GPL license
//-------------------------------------------------------------------
`default_nettype none `timescale 100 ns / 10 ns

module ledon_tb ();

  //-- Simulation time: 1us (10 * 100ns)
  parameter DURATION = 10;

  //-- Leds port
  wire led;

  //-- Instantiate the unit to test
  ledon UUT (.led(led));


  initial begin

    //-- Dump vars to the .vcd output file
    $dumpvars(0, ledon_tb);

    #(DURATION) $display("End of simulation");
    $finish;
  end

endmodule
