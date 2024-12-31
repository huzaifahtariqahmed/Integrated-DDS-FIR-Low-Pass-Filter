`timescale 1ns/1ps

module fir_low_pass_filter(Data_out,
                           Data_in,
                           clk,
                           rst);
  
      parameter order = 32;
      parameter word_size_in = 8;
      parameter word_size_out = 2*word_size_in;

      parameter b0 = 8'd0;
      parameter b1 = 8'd2;
      parameter b2 = 8'd3;
      parameter b3 = 8'd4;
      parameter b4 = 8'd4;
      parameter b5 = 8'd2;
      parameter b6 = 8'd0;
      parameter b7 = 8'd0;
      parameter b8 = 8'd0;
      parameter b9 = 8'd0;
      parameter b10 = 8'd0;
      parameter b11 = 8'd5;
      parameter b12 = 8'd18;
      parameter b13 = 8'd32;
      parameter b14 = 8'd44;
      parameter b15 = 8'd50;
      parameter b16 = 8'd50;
      parameter b17 = 8'd44;
      parameter b18 = 8'd32;
      parameter b19 = 8'd18;
      parameter b20 = 8'd5;
      parameter b21 = 8'd0;
      parameter b22 = 8'd0;
      parameter b23 = 8'd0;
      parameter b24 = 8'd0;
      parameter b25 = 8'd0;
      parameter b26 = 8'd2;
      parameter b27 = 8'd4;
      parameter b28 = 8'd4;
      parameter b29 = 8'd3;
      parameter b30 = 8'd2;
      parameter b31 = 8'd0;

      output [word_size_out-1:0] Data_out;

      input [word_size_in-1:0] Data_in;
      input clk,rst;
  
      reg [word_size_in-1:0] Samples [1:order];

      integer k;

      assign Data_out = b0 * Data_in +
                        b1 * Samples[1] +
                        b2 * Samples[2] +
                        b3 * Samples[3] +
                        b4 * Samples[4] +
                        b5 * Samples[5] +
                        b6 * Samples[6] +
                        b7 * Samples[7] +
                        b8 * Samples[8] +
                        b9 * Samples[9] +
                        b10 * Samples[10] +
                        b11 * Samples[11] +
                        b12 * Samples[12] +
                        b13 * Samples[13] +
                        b14 * Samples[14] +
                        b15 * Samples[15] +
                        b16 * Samples[16] +
                        b17 * Samples[17] +
                        b18 * Samples[18] +
                        b19 * Samples[19] +
                        b20 * Samples[20] +
                        b21 * Samples[21] +
                        b22 * Samples[22] +
                        b23 * Samples[23] +
                        b24 * Samples[24] +
                        b25 * Samples[25] +
                        b26 * Samples[26] +
                        b27 * Samples[27] +
                        b28 * Samples[28] +
                        b29 * Samples[29] +
                        b30 * Samples[30] +
        				b31 * Samples[31];
  
      always @ (posedge clk)
        if(rst == 1)
          begin
            for(k=1;k<=order;k=k+1)
              Samples[k] <= 0;
          end
      else
        begin
          Samples[1] <= Data_in;
          for(k=2;k<=order;k=k+1)
            Samples[k] <= Samples[k-1];
        end
  
endmodule
