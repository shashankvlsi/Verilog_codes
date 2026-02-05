module halfadder1(input a,b,output sum1,carry1);

xor1 gate1(
	.a(a),
	.b(b),
	.y(sum1)
	);
and1 gate2(
	.a(a),
	.b(b),
	.y(carry1)
);

endmodule
 
