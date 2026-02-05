module _1to4demux(input y,[1:0]s,output i1,i2,i3,i4);

and a1(i1,~s[1],~s[0],y);
and a2(i2,~s[1],s[0],y);
and a3(i3,s[1],~s[0],y);
and a4(i4,s[1],s[0],y);

endmodule


module _1to4demux_tb();
reg y;
reg[1:0]s;
wire i1,i2,i3,i4;

_1to4demux gatee(y,s,i1,i2,i3,i4);

initial
repeat(7)
begin
y=$random;
s=0;#10;
s=1;#10;
s=2;#10;
s=3;#10;
end
initial
$monitor("y=%b s=%B i1=%b i2=%b i3=%b i4=%b Time=%0t",y,s,i1,i2,i3,i4,$time);

endmodule

