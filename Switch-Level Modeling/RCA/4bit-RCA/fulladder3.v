`include "orgate1.v"
`include "xorgate1.v"
`include "andgate.v"
`include "halfadder1.v"
module fulladder3(input a,b,cin,output sum,carry);
wire w1,w2,w3;
halfadder gate1(
        .a(a),
        .b(b),
        .sum(w1),
        .carry(w2)
        );
halfadder gate2(
        .a(w1),
        .b(cin),
        .sum(sum),
        .carry(w3)
        );
or1 gate3(
        .a(w2),
        .b(w3),
        .y(carry)
);
        
endmodule
 

 module fulladder3_tb();
reg tb_a,tb_b,tb_cin;
wire tb_sum,tb_carry;

fulladder3 gate3(
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


