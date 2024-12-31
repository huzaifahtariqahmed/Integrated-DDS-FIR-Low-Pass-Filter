`timescale 1ns/1ps

`include "fir_lpf.v"
`include "phase_counter.v"
`include "phase_to_amplitude.v"
`include "top_module.v"

module tb_top_module();

  reg clk;
  reg reset;
  reg [9:0] fsw;
  wire [15:0] fil_out;

  // Instantiate the top module
  top_module uut(
    .clk(clk),
    .reset(reset),
    .fsw(fsw),
    .fil_out(fil_out)
  );

  // Clock generation (1 MHz)
  initial begin
    clk = 0;
    forever #500 clk = ~clk; // 1 MHz clock period
  end

  // Reset generation
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    reset = 1;
    #10 reset = 0; // Deassert reset after 10 time units
  end

  // Stimulus generation
  initial begin
    // Wait for a few clock cycles for initialization
    #100;

    // Apply frequency sweep of 10
    fsw = 205;

    // Simulate for a duration
    #135500;

    // Stop the simulation
    $finish;
  end

  // Monitor for observing signals
  always @(posedge clk) begin
    $display("Time=%t, 
              Counter=%d, 
              DDS_Sin=%d, 
              Filtered_Output=%d", 
              $time, 
              uut.pc.counter, 
              uut.pta.dds_sin, 
              fil_out); 
  end

endmodule
