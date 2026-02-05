module _2to1mux1(a,b,s,y);
input a,b;
input s;
output  y;
wire w1,w2;

and a1(w1,a,~s);
and a2(w2,b,s);
or o1(y,w1,w2);
endmodule



module _2to1mux1_tb();
reg a,b;
reg s;
wire y;

_2to1mux1 gate1(a,b,s,y);

initial
repeat(6)
begin
a=1;b=0;s=$random;#10;
end
initial
$monitor("a=%B b=%B s=%B y=%B Time=%t",a,b,s,y,$time );
endmodule
