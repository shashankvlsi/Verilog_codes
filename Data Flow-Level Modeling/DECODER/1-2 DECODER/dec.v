module dec(input y,output i0,i1);

assign i0=y;
assign i1=~y;
endmodule

module dec_tb();
reg y;
wire i0,i1;

dec gate(y,i0,i1);

initial
begin
y=0;#10;
y=1;#10;
end
initial
$monitor("y=%b i0=%b i1=%b",y,i0,i1);
endmodule

