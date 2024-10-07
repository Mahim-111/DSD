module UP_DOWN_COUNTER(q, clk, clr, m);
	input clk, clr, m;
	output [2:0] q;
	wire [2:0] qbar;
		
	JK jk1(1'b1, 1'b1, clr, clk, q[0], qbar[0]);
	xor(x, m, q[0]);
	JK jk2(1'b1, 1'b1, clr, x, q[1], qbar[1]);
	xor(y, m, q[1]);
	JK jk3(1'b1, 1'b1, clr, y, q[2], qbar[2]);

endmodule


module UP_DOWN_SIMULATION;
	reg clk, clr, m;
	wire [2:0] q;
	wire [2:0] qbar;

	UP_DOWN_COUNTER up1(q, clk, clr, m);
	initial 
	clk = 0;
	always #10 clk = ~clk;

	initial
	begin
	clr = 1;
	#5 clr = 0;
	#15 clr = 1;
	end
	
	initial 
	begin
	m = 1'b0;
	#500 m = 1'b1;
	#500 m = 1'b0;
	end
endmodule