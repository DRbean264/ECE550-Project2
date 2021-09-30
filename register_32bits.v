module register_32bits(Q, D, CLK, EN, CLR);
	input [31:0] D;
	input CLK, EN, CLR;
	output [31:0] Q;
	
	genvar i;
	generate
		for (i = 0; i < 32; i = i + 1) begin: dffe_series
			dffe_ref dffe(Q[i], D[i], CLK, EN, CLR);
		end
	endgenerate
endmodule