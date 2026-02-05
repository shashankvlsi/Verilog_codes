`include"rca1.v"
module rca2(
            input[15:0] a,b,
            input cin,
            output[15:0]sum,
            output cout
             );
wire c0,c1,c2;
 rca1 gate1 (
            .a(a[3:0]),
            .b(b[3:0]),
            .cin(cin),
            .s(sum[3:0]),
            .cout(c0)
            );
 rca1 gate2 (
            .a(a[7:4]),
            .b(b[7:4]),
            .cin(c0),
            .s(sum[7:4]),
            .cout(c1)
            );
 rca1 gate3 (
            .a(a[11:8]),
            .b(b[11:8]),
            .cin(c1),
            .s(sum[11:8]),
            .cout(c2)
            );
 rca1 gate4 (
            .a(a[15:12]),
            .b(b[15:12]),
            .cin(c2),
            .s(sum[15:12]),
            .cout(cout)
            );
endmodule


module rca2_tb();
reg[15:0] tb_a,tb_b;
reg tb_cin;
wire[15:0] tb_sum;
wire tb_cout;

rca2 gate5(
            .a(tb_a),
            .b(tb_b),
            .cin(tb_cin),
            .sum(tb_sum),
            .cout(tb_cout)
);
initial
repeat(16)
begin
tb_a=$urandom;tb_b=$urandom_range(115,411);tb_cin=0;#10;
end

initial
$monitor("(tb_a=%d tb_b=%d tb_cin=%d tb_sum=%d tb_cout=%d",tb_a,tb_b,tb_cin,tb_sum,tb_cout);
endmodule
