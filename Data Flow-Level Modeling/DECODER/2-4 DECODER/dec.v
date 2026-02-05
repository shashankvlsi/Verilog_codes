module dec(input y0,y1,output i0,i1,i2,i3);

assign i0=~y0&~y1;
assign i1=~y0&y1;
assign i2=y0&~y1;
assign i3=y0&y1;
endmodule

module dec_tb();
reg y0,y1;
wire i0,i1,i2,i3;

dec gate(y0,y1,i0,i1,i2,i3);

initial
begin
y0=0;y1=0;#10;
y0=1;y1=0;#10;
y0=0;y1=1;#10;
y0=1;y1=1;#10;
end
initial
$monitor("y0=%b y1=%b i0=%b i1=%b i2=%B i3=%B",y0,y1,i0,i1,i2,i3);
endmodule

