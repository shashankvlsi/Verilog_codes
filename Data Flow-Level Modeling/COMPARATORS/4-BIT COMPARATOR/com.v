module comp(input[3:0]a,b,output g,l,e);

assign g=(a[3]&~b[3])|((a[3]~^b[3])&(a[2]&~b[2]))|((a[3]~^b[3])&(a[2]~^b[2])&(a[1]&~b[1]))|((a[3]~^b[3])&(a[2]~^b[2])&(a[1]~^b[1])&(a[0]&~b[0]));
assign l=(~a[3]&b[3])|((a[3]~^b[3])&(~a[2]&b[2]))|((a[3]~^b[3])&(a[2]~^b[2])&(~a[1]&b[1]))|((a[3]~^b[3])&(a[2]~^b[2])&(a[1]~^b[1])&(~a[0]&b[0]));
assign e=(a[3]~^b[3])&(a[2]~^b[2])&(a[1]~^b[1])&(a[0]~^b[0]);

endmodule

module comp_tb();
reg[3:0]a,b;
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


