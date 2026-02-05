module hs(input a,b,output diff,bout);

assign diff=a^b;
assign bout=~a&b;

endmodule


module hs_tb();
reg a,b;
wire diff,bout;

hs gate (a,b,diff,bout);

initial
repeat(4)
begin
a=$random;b=$random;#10;
end

initial
$monitor("a=%b b=%b diff=%b bout=%b Time=%0t",a,b,diff,bout,$time);
endmodule
