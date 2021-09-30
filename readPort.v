module readPort(data_readReg, ctrl_readReg, registers_out);
	input [4:0] ctrl_readReg;
	input [1023:0] registers_out;
	output [31:0] data_readReg;
	
	wire [31:0] tristate_en;
	
	decoder_5to32 dec(tristate_en, ctrl_readReg, 1'b1);
	
	//  32 32-bit tristate buffers
	genvar i;
	generate
		for (i = 0; i < 32; i = i + 1) begin: tristate_series
			tristate_buffer tb(data_readReg, registers_out[(i + 1) * 32 - 1 -:32], tristate_en[i]);
		end
	endgenerate
endmodule