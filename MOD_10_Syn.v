// MOD_10 synchronous counte...

module MOD_10(q, q_bar, clk, clr);
	output [3:0] q, q_bar;
	input clk,clr;

	and(x, q_bar[3], q[0]);
	and(y, q[0], q[1]);
	and(z, y, q[2]);

	JK JK1(1'b1, 1'b1, clr, clk, q[0], q_bar[0]);
	JK JK2(x, q[0], clr, clk, q[1], q_bar[1]);	
	JK JK3(y, y, clr, clk, q[2], q_bar[2]);	
	JK JK4(z, q[0], clr, clk, q[3], q_bar[3]);
endmodule


module synMOD;
	wire [3:0] q, q_bar;
	reg clk,clr;
		
	MOD_10 m1(q, q_bar, clk, clr);
	initial 
	clk = 1'b0;
	always #50 clk = ~clk;
	initial 
	begin
	clr = 1'b1;
	#50 clr = 1'b0;
	#50 clr = 1'b1;
	end
endmodule