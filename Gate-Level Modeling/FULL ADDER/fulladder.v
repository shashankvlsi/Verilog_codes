module fulladder1(input a,b,cin,output sum,carry);
wire w1,w2,w3;
xor x1(w1,a,b);
xor x2(sum,w1,cin);
and a1(w2,a,b);
and a2(w3,w1,cin);
or o1(carry,w2,w3);
endmodule


//test_bench
 module fulladder1_tb();
 reg a,b,cin;
 wire sum,carry;

 fulladder1 gate(a,b,cin,sum,carry);

 initial
 repeat(12)
 begin
 a=$random;b=$random;cin=1;#10;
 end
 initial
 $monitor("a=%b b=%b cin=%b sum=%b carry=%b Time=%0t",a,b,cin,sum,carry,$time);
 endmodule
