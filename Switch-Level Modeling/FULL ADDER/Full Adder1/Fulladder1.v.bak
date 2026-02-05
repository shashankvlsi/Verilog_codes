module fulladder1(input a,b,cin,output sum, carry);

halfadder1 gate1(
        .a(a),
        .b(b),
        .sum1(sum1),
        .carry1(carry1)
        );
halfadder2 gate2(
        .a(sum1),
        .b(cin),
        .sum(sum),
        .carry2(carry2)
        );
or1 gate3(
        .a(carry1),
        .b(carry2),
        .y(carry)
);
        
endmodule


module fulladder1_tb();
reg tb_a,tb_b,tb_cin;
wire tb_sum,tb_carry;

fulladder1 gate3(
        .a(tb_a),
        .b(tb_b),
        .cin(tb_cin),
        .sum(tb_sum),
        .carry(tb_carry)
);

initial begin
    tb_a=0; tb_b=0;tb_cin=0; #10;
	tb_a=0; tb_b=0;tb_cin=1; #10;
	tb_a=0; tb_b=1;tb_cin=0; #10;
	tb_a=0; tb_b=1;tb_cin=1; #10;
    tb_a=1; tb_b=0;tb_cin=0; #10;
	tb_a=1; tb_b=0;tb_cin=1; #10;
	tb_a=1; tb_b=1;tb_cin=0; #10;
	tb_a=1; tb_b=1;tb_cin=1; #10;

end

initial 
$monitor("tb_a=%b tb_b=%b tb_cin=%b tb_sum=%b tb_carry=%b",tb_a,tb_b,tb_cin,tb_sum,tb_carry);
endmodule
