module demux(input y,s0,s1,s2,output i0,i1,i2,i3,i4,i5,i6,i7);

assign i0=~s2&~s1&~s0&y;
assign i1=~s2&~s1&s0&y;
assign i2=~s2&s1&~s0&y;
assign i3=~s2&s1&s0&y;
assign i4=s2&~s1&~s0&y;
assign i5=s2&~s1&s0&y;
assign i6=s2&s1&~s0&y;
assign i7=s2&s1&s0&y;

endmodule


module demux_tb();
reg y,s0,s1,s2;
wire i0,i1,i2,i3,i4,i5,i6,i7;

demux gate(y,s0,s1,s2,i0,i1,i2,i3,i4,i5,i6,i7);


initial 
repeat(17)
begin
y=$random;s0=$random;s1=$random;s2=$random;
#10;
end

initial
$monitor("y=%B s2=%b s1=%b s0=%b i0=%b i1=%b i2=%b i3=%b i4=%b i5=%b i6=%b i7=%B Time=%0b",y,s2,s1,s0,i0,i1,i2,i3,i4,i5,i6,i7,$time);
endmodule
