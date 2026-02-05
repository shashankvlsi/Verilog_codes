module demux(input y,s0,s1,output i0,i1,i2,i3);

assign i0=~s1&~s0&y;
assign i1=~s1&s0&y;
assign i2=s1&~s0&y;
assign i3=s1&s0&y;
endmodule


module demux_tb();
reg y,s0,s1;
wire i0,i1,i2,i3;

demux gate(y,s0,s1,i0,i1,i2,i3);


initial 
repeat(17)
begin
y=$random;s0=$random;s1=$random;
#10;
end

initial
$monitor("y=%B s1=%b s0=%b i0=%b i1=%b i2=%b i3=%b Time=%0b",y,s1,s0,i0,i1,i2,i3,$time);
endmodule
