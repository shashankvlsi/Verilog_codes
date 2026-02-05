module ha(input a,b,output sum,carry);

assign sum=a^b;
assign carry=a&b;
endmodule

module ha_tb();
reg a,b;
wire sum,carry;

ha gate(a,b,sum,carry);
initial
begin
a=1;b=1;#10;
a=1;b=0;#10;
a=0;b=1;#10;
a=0;b=0;#10;
end


initial
$monitor("a=%b b=%b sum=%b carry=%b Time=%0t",a,b,sum,carry,$time);
endmodule

