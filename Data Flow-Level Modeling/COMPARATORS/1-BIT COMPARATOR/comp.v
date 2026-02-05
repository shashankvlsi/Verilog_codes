module comp(input a,b,output g,l,e);

assign g=a&~b;
assign l=~a&b;
assign e=a~^b;
endmodule


module comp_tb();
reg a,b;
wire g,l,e;

comp gate (a,b,g,l,e);

initial
repeat(5)
begin
a=$random;b=$random;#10;
end

initial
$monitor("a=%b b=%b g=%B l=%B e=%B time=%0t",a,b,g,l,e,$time);
endmodule

