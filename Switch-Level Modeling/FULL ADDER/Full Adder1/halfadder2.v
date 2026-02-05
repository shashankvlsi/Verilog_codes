module halfadder2(input a,b,output sum,carry2);

xor1 gate1(
	.a(a),
	.b(b),
	.y(sum)
	);
and1 gate2(
	.a(a),
	.b(b),
	.y(carry2)
);

endmodule

