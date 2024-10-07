module halfAdder(s, c, a, b);
	input a, b;
	output s, c;

	xor(s, a, b);
	and(c, a, b);	
endmodule

module fullAdder(s, c_out, a, b, c_in);
	input a, b, c_in;
	output s, c_out;

	halfAdder h1(x, y, a, b);
	halfAdder h2(s, z, x, c_in);
	or(c_out, y, z);
endmodule 

module add_sub(S, C_out, A, B, C_in);
	input [3:0] A, B;
	input C_in;
	output [3:0] S;
	output C_out;
	
	xor (d3, B[3], C_in);
	xor (d2, B[2], C_in);
	xor (d1, B[1], C_in);
	xor (d0, B[0], C_in);

	fullAdder fa1(S[0], c,     A[0], d0, C_in);
	fullAdder fa2(S[1], b,     A[1], d1, c);
	fullAdder fa3(S[2], a,     A[2], d2, b);
	fullAdder fa4(S[3], C_out, A[3], d3, a);	
endmodule


module testAddSub();

	reg [3:0] A, B;
	reg C_in;
	wire C_out;
	wire [3:0] S;

	add_sub as(S, C_out, A, B, C_in);
	initial
	begin
	A = 4'b0001; B = 4'b0101; C_in = 1'b0; //output = 0110
	#100
	A = 4'b0011; B = 4'b0011; C_in = 1'b0; //output = 0110
	#100
	A = 4'b0101; B = 4'b0101; C_in = 1'b1; //output = 0000
	end
endmodule
