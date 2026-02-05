module demux(input y,s,output i0,i1);

assign i0=~s&y;
assign i1=s&y;

endmodule

module demux_tb();
reg y,s;
wire i0,i1;

demux gate(y,s,i0,i1);

initial
repeat(7)
begin 
y=$random;s=$random;#10;

end


initial
$monitor("y=%b s=%b i0=%B i1=%B Time=%0d",y,s,i0,i1,$time);
endmodule
