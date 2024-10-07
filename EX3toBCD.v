module EX3toBCD(B, E);
 	input [3:0] E;
	output [3:0] B;
	
	not(B[0], E[0]);
	xor(B[1], E[0], E[1]);
	and(x, E[0], E[1]);
	xnor(B[2], E[2], x);
	or(y, E[2], x);
	and(B[3], E[3], y);
endmodule

module testEXtoBCD;
	reg [3:0] E;
	wire [3:0] B;
	
	EX3toBCD XB(B, E);
	initial
	begin
	E[3] = 1'b0; E[2] = 1'b0; E[1] = 1'b1; E[0] = 1'b1;// can write E = 4'b0011 and continue...
	#100	
	E[3] = 1'b0; E[2] = 1'b1; E[1] = 1'b0; E[0] = 1'b0;
	#100
	E[3] = 1'b0; E[2] = 1'b1; E[1] = 1'b0; E[0] = 1'b1;
	#100
	E[3] = 1'b0; E[2] = 1'b1; E[1] = 1'b1; E[0] = 1'b0;
	#100
	E[3] = 1'b0; E[2] = 1'b1; E[1] = 1'b1; E[0] = 1'b1;
	#100	
	E[3] = 1'b1; E[2] = 1'b0; E[1] = 1'b0; E[0] = 1'b0;
	#100
	E[3] = 1'b1; E[2] = 1'b0; E[1] = 1'b0; E[0] = 1'b1;
	#100
	E[3] = 1'b1; E[2] = 1'b0; E[1] = 1'b1; E[0] = 1'b0;
	#100
	E[3] = 1'b1; E[2] = 1'b0; E[1] = 1'b1; E[0] = 1'b1;
	#100
	E[3] = 1'b1; E[2] = 1'b1; E[1] = 1'b0; E[0] = 1'b0;
	end
endmodule

