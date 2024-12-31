`timescale 1ns/1ps

module top_module (clk,
                   reset,
                   fsw,
                   fil_out);

    input clk, reset;
  	input [9:0] fsw;
  
    output [15:0] fil_out;
    
    wire [9:0] dds_sin;
    wire [9:0] counter;

    // Instantiate phase counter and phase-to-amplitude converter
    phase_counter pc(.clk(clk), 
                     .reset(reset), 
                     .fsw(fsw), 
                     .counter(counter));
    phase_to_amplitude pta(.counter(counter), 
                           .reset(reset), 
                           .dds_sin(dds_sin));

    // Instantiate low-pass FIR filter
    fir_low_pass_filter lpf(.Data_in(dds_sin), 
                            .clk(clk), 
                            .rst(reset), 
                            .Data_out(fil_out));

endmodule
