//Design code
module allcomp(a,b,g,l,e);
parameter width=4;
input[width-1:0]a,b;
output g,l,e;

assign {g,l,e}={a>b,a<b,a==b};
endmodule

//TB code

module allcomp_tb #(parameter width=4)(g,l,e,a,b);
//parameter width=4;
input g,l,e;
output reg[width-1:0]a,b;

initial
repeat(10)
begin
a=$random;b=$random;#10;
end

initial
$monitor("a=%b b=%b g=%b l=%B e=%B Time=%0t",a,b,g,l,e,$time);
endmodule

//Top code
module top();
parameter i=10;
wire[i-1:0]w1,w2;
wire w3,w4,w5;

allcomp #(.width(i))gate1(w1,w2,w3,w4,w5);
allcomp_tb gate2(w3,w4,w5,w1,w2);
defparam gate2.width=i;
endmodule
