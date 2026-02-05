module halfsub1(input a,b,output Diff,B);
wire w;
xor x1(Diff,a,b);
not n(w,a);
and aa(B,w,b);
endmodule


module halfsub1_tb();
reg a,b;
wire Diff,B;

halfsub1 gate(a,b,Diff,B);
initial
repeat(5)
begin
a=$random;b=$random;#10;
end
initial
$monitor("a=%b b=%b Diff=%b B=%b Time=%0t",a,b,Diff,B,$time);
endmodule
