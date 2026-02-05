module halfadder2(input a,b,output sum,carry);

xor1 gate1(
	.a(a),
	.b(b),
	.y(sum)
	);
and1 gate2(
	.a(a),
	.b(b),
	.y(carry)
);

endmodule




module halfadder2_tb();
reg tb_a,tb_b;
wire tb_sum,tb_carry;

halfadder2 gate(
	.a(tb_a),
	.b(tb_b),
	.sum(tb_sum),
	.carry(tb_carry)
);

initial begin
	tb_a=0; tb_b=0; #10;
	tb_a=0; tb_b=1; #10;
	tb_a=1; tb_b=0; #10;
	tb_a=1; tb_b=1; #10;
end

initial
$monitor("tb_a=%b  tb_b=%b  tb_sum=%b tb_carry=%b",tb_a,tb_b,tb_sum,tb_carry);
endmodule
