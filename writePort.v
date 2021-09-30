module writePort(EN, ctrl_writeReg, ctrl_writeEnable);
	input [4:0] ctrl_writeReg;
	input ctrl_writeEnable;
	output [31:0] EN;
	
	wire [31:0] decoder_out;
	
	decoder_5to32 dec(decoder_out, ctrl_writeReg, 1'b1);
	
	//  32 and gates
	genvar i;
	generate
		for (i = 0; i < 32; i = i + 1) begin: and_series
			and and_32(EN[i], ctrl_writeEnable, decoder_out[i]);
		end
	endgenerate
endmodule