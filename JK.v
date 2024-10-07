module JK(J,K,Clear,clock,q,qbar);

	input J,K,Clear,clock;
	output q,qbar;
	wire a,b,y,ybar,c,cbar,d;
	nand(a,J,Clear,clock,qbar);
	nand(b,K,q,clock);
	nand(y,ybar,a);
	nand(ybar,Clear,y,b);
	not(cbar,clock);
	nand(c,y,cbar);
	nand(d,ybar,cbar);
	nand(q,c,qbar);
	nand(qbar,q,Clear,d);

endmodule