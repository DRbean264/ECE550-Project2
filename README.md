# Project2 - RegFile Checkpoint 2
**Author: Yuzhe Ding (yd160); Aohua Zhang (az147)**
**Date: 09.30.2021**

## Description of our design implementation
> 

> 5-to-32 Decoder
- First implement a 2-to-4 decoder with an Enable input
- Then use 2 2-to-4 decoders to construct 3-to-8 decoder with the Enable input connected to the MSB of the input
- It's the same for 4-to-16 and 5-to-32 decoder

> Tristate Buffer
- I use the constant 1'bz to implement the tristate buffer
- Use the output of the decoder to enable the tristate buffer to select which data appears on the final output