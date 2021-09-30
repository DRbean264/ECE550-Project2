module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;
	
	wire [31:0] registers_en, registers_clr;
	wire [1023:0] registers_out;
	
   /* YOUR CODE HERE */
	//  connect other reset
	genvar i;
	generate
		for (i = 0; i < 32; i = i + 1) begin: clr_series
			assign registers_clr[i] = ctrl_reset;
		end
	endgenerate
	
	//  32 32-bit registers
	genvar j;
	generate
		for (j = 1; j < 32; j = j + 1) begin: reg_series
			register_32bits regs(registers_out[j * 32 +:32], data_writeReg, clock, registers_en[j], registers_clr[j]);
		end
	endgenerate
	//  reg0 is always 0
	assign registers_out[31:0] = 32'd0;
	
	//  write port
	writePort wp(registers_en, ctrl_writeReg, ctrl_writeEnable);
	
	//  read port
	readPort rp1(data_readRegA, ctrl_readRegA, registers_out);
	readPort rp2(data_readRegB, ctrl_readRegB, registers_out);
	
endmodule
