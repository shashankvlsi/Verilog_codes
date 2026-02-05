`include"fulladder3.v"
module rca1(input [3:0] a,
            input [3:0] b,
            input cin,
            output [3:0] s,
            output cout);
wire c0,c1,c2;
 
 fulladder3 gate1(
                    .a(a[0]),
                    .b(b[0]),
                    .cin(cin),
                    .sum(s[0]),
                    .carry(c0)
 );
 fulladder3 gate2(
                    .a(a[1]),
                    .b(b[1]),
                    .cin(c0),
                    .sum(s[1]),
                    .carry(c1)
 );
 fulladder3 gate3(
                    .a(a[2]),
                    .b(b[2]),
                    .cin(c1),
                    .sum(s[2]),
                    .carry(c2)
 );
 fulladder3 gate4(
                    .a(a[3]),
                    .b(b[3]),
                    .cin(c2),
                    .sum(s[3]),
                    .carry(cout)
 );
 endmodule




 module rac1_tb();
 reg [3:0] tb_a;
 reg [3:0] tb_b;
 reg tb_cin;
 wire [3:0] tb_s;
 wire tb_cout;

 rca1 gate5 (
            .a(tb_a),
            .b(tb_b),
            .cin(tb_cin),
            .s(tb_s),
            .cout(tb_cout)
 );

 initial begin

    tb_a=4'b1010;
    tb_b=4'b0101;
    tb_cin=0;#100;
    tb_a=4'b1110;
    tb_b=4'b1101;
    tb_cin=0;#100;
    tb_a=4'b1100;
    tb_b=4'b0111;
    tb_cin=1;#100;

 end
//initial
//$monitor("tb_s0=%b tb_s1=%b tb_s2=%b tb_s3=%b tb_cout=%b",tb_s0,tb_s1,tb_s2,tb_s3,tb_cout);
initial
$monitor("tb_a=%b tb_b=%b tb_cin=%b tb_s=%b tb_cout=%b",tb_a,tb_b,tb_cin,tb_s,tb_cout);
endmodule
