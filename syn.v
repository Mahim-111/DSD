// 0 -> 1 -> 3 -> 7 -> 15 -> 14 -> 12  -> 8 -> 0 ...
module syn(q, q_bar, clk, clr);
	output [3:0] q;
	output [3:0] q_bar;
	input clk;
	input clr;

	JK JK0(q_bar[3], q[3], clr, clk, q[0], q_bar[0]);
	JK JK1(q[0], q_bar[0], clr, clk, q[1], q_bar[1]);	
	JK JK2(q[1], q_bar[1], clr, clk, q[2], q_bar[2]);	
	JK JK3(q[2], q_bar[2], clr, clk, q[3], q_bar[3]);
	
endmodule