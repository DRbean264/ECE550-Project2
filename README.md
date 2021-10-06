# Project2 - RegFile Checkpoint 2
**Author: Yuzhe Ding (yd160); Aohua Zhang (az147)**
**Date: 09.30.2021**

## Description of our design implementation
> 32-bit registers
- Implement 32 32-bit registers with DFFE

> Write/Read Port
- Use tristate buffer and decoder to realize customizing output
- Using and gate to enable writing the registers

> 5-to-32 Decoder
- First implement a 2-to-4 decoder with an Enable input
- Then use 2 2-to-4 decoders to construct 3-to-8 decoder with the Enable input connected to the MSB of the input
- It's the same for 4-to-16 and 5-to-32 decoder

> Tristate Buffer
- I use the constant 1'bz to implement the tristate buffer
- Use the output of the decoder to enable the tristate buffer to select which data appears on the final output

## How fast our register file can be clocked
According to the testbench, it will wait one clock cycle to read out the value stored in the registers. 
Thus, the minimum reading time can be determined by the minimum clock cycle. After experimenting, I found 
that when I set the clock cycle to 5ns, the latency would surpass one clock cycle, while the clock cycle 
is set to 6ns, the latency is shorter than one clock cycle. (See the following picture)


