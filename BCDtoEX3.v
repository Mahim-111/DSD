module BCDtoEX3(E, B);

	input [3:0] B;
	output [3:0] E;
	
	not(E[0], B[0]);
	xnor(E[1], B[0], B[1]);
	or(x, B[0], B[1]);
	xor(E[2], B[2], x);
	and(y, B[2], x);
	or(E[3], B[3], y);

endmodule

module testBCDtoEX;
	reg [3:0] B;
	wire [3:0] E;

	BCDtoEX3  BX3(E, B);
	initial 
	begin
	B[3] = 1'b0; B[2] = 1'b0; B[1] = 1'b0; B[0] = 1'b0; // can write B = 4'b0000 and continue...
	#100
	B[3] = 1'b0; B[2] = 1'b0; B[1] = 1'b0; B[0] = 1'b1;
	#100
	B[3] = 1'b0; B[2] = 1'b0; B[1] = 1'b1; B[0] = 1'b0;
	#100
	B[3] = 1'b0; B[2] = 1'b0; B[1] = 1'b1; B[0] = 1'b1;
	#100	
	B[3] = 1'b0; B[2] = 1'b1; B[1] = 1'b0; B[0] = 1'b0;
	#100
	B[3] = 1'b0; B[2] = 1'b1; B[1] = 1'b0; B[0] = 1'b1;
	#100
	B[3] = 1'b0; B[2] = 1'b1; B[1] = 1'b1; B[0] = 1'b0;
	#100
	B[3] = 1'b0; B[2] = 1'b1; B[1] = 1'b1; B[0] = 1'b1;
	#100	
	B[3] = 1'b1; B[2] = 1'b0; B[1] = 1'b0; B[0] = 1'b0;
	#100
	B[3] = 1'b1; B[2] = 1'b0; B[1] = 1'b0; B[0] = 1'b1;
	end
endmodule
	
