module comp(input[1:0]a,b,output g,l,e);

assign g=(a[1]&~b[1])|((a[1]~^b[1])&(a[0]&~b[0]));
assign l=(~a[1]&b[1])|((a[1]~^b[1])&(~a[0]&b[0]));
assign e=(a[1]~^b[1])&(a[0]~^b[0]);
endmodule

module comp_tb();
reg[1:0]a,b;
wire g,l,e;

comp gate (a,b,g,l,e);

initial
repeat(15)
begin
a=$random;b=$random;#10;
end

initial
$monitor("a=%b b=%b g=%B l=%B e=%B time=%0t",a,b,g,l,e,$time);
endmodule

