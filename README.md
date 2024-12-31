# Custom 32 Tap FIR Low Pass Filter Design Integrated with Previously Developed Direct Digital Synthesizer

## System Architecture

![System Architecture](Images/architecture.png)

## Filter Design in Matlab

I used the Matlab Filter Designer (Previously FDA Tool) to design a Low Pass Filter which allows frequencies till 75kHz and stops frequencies greater than 125kHz. It is a 31 Order Filter. Sampling Frequency of the filter is kept 1MHz matching that of DDS.

### Configuring LPF in Matlab Filter Designer

![LPF Configuration](Images/lpfconfig.png)

![LPF Phase Response](Images/lpfphase.png)

I have exported the coefficients of the above filter with the name of ’LPF’ in the workspace. I then made all negative coefficients in the LPF matrix equal to zero, in order to not deal with signed binary representation in Verilog.

### Filter after setting negative coefficients to zero

![LPF Mag Response](Images/lpfmag.png)

We can see that the magnitude response is considerably different than what we were getting originally. Which can affect our filtered output.

### Testing the Filter on Matlab Generated Sine Waves

Will be testing for 10kHz, 50kHz, 200kHz and 250kHz frequencies.

#### 10kHz Matlab Generated Sine Wave Results

![10kHz Filtered Result](Images/10kHzfiltered.png)

#### 50kHz Matlab Generated Sine Wave Results

![50kHz Filtered Result](Images/50kHzfiltered.png)

#### 200kHz Matlab Generated Sine Wave Results

![200kHz Filtered Result](Images/200kHzfiltered.png)

#### 250kHz Matlab Generated Sine Wave Results

![250kHz Filtered Result](Images/250kHzfiltered.png)

## Converting Filter Coefficients to 8 Bit Binary Representation



--- 

**Contributions**: All of the code in this repository is written by [Huzaifah Tariq Ahmed](https://github.com/huzaifahtariqahmed). 
