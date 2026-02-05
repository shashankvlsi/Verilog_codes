module fs(input a,b,bin,output diff,bout);

assign diff=a^b^bin;
assign bout=(~a&b)|(bin&(a~^b));

endmodule


module fs_tb();
reg a,b,bin;
wire diff,bout;

fs gate (a,b,bin,diff,bout);

initial
repeat(4)
begin
a=$random;b=$random;bin=$random;#10;
end

initial
$monitor("a=%b b=%b bin=%b diff=%b bout=%b Time=%0t",a,b,bin,diff,bout,$time);
endmodule
