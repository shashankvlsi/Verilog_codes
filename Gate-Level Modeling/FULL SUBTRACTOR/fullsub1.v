module fullsub1(input a,b,bin, output diff,bout);
wire w1,w2,w3;
xor x1(w1,a,b);
xor x2(diff,w1,bin);
and a1(w2,~a,b);
and a2(w3,~w1,bin);
or o1(bout,w2,w3);
endmodule



module fullsub1_tb();
reg a,b,bin;
wire diff,bout;

fullsub1 gate(a,b,bin,diff,bout);
initial
repeat(10)
begin
a=$random % 2;b=$random %2;bin=0;#10;
end
initial 
$monitor("a=%b b=%b bin=%b diff=%b bout=%b Time=%t",a,b,bin,diff,bout,$time);
endmodule
