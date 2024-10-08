module counter(q, q_bar, clk, clr);
	output [3:0] q;
	output [3:0] q_bar;
	input clk,clr;
	wire clr1;

	nand(p, q[1], q[3]);
	and(clr1, p, clr);

	JK JK1(1'b1, 1'b1, clr1, clk,  q[0], q_bar[0]);
	JK JK2(1'b1, 1'b1, clr1, q[0], q[1], q_bar[1]);	
	JK JK3(1'b1, 1'b1, clr1, q[1], q[2], q_bar[2]);	
	JK JK4(1'b1, 1'b1, clr1, q[2], q[3], q_bar[3]);
	
endmodule


module MOD_10_Sim;
	reg clk, clr;
	wire [3:0] q, q_bar;
	counter mmm(q, q_bar, clk, clr);
	initial
	clk =1'b0;
	always #10 clk = ~clk;	
	initial	
	begin
		 clr = 1'b0;
		#2 clr = 1'b1;	
	end
	
	always @(negedge clk)
	begin
		if(q == 4'b1010) 
		begin
		clr = 1'b0;
		#2 clr = 1'b1;
		end
	end
	
endmodule
