module mux(input i1,i2,i3,i4,s1,s2,output y);

assign y=s2?(s1?i4:i3):(s1?i2:i1);

endmodule


module mux_tb();
reg i1,i2,i3,i4,s1,s2;
wire y;

mux gate(i1,i2,i3,i4,s1,s2,y);
initial
 repeat(7)
 begin
 i1=$random;i2=$random;i3=$random;i4=$random;s1=$random;s2=$random;#10;
 end

 initial
 $monitor("i1=%b i2=%b i3=%b i4=%b s2=%b s1=%b y=%b Time=%0t",i1,i2,i3,i4,s2,s1,y,$time);
 endmodule

