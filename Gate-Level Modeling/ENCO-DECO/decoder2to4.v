module decoder2to4(input y1,y2,output i1,i2,i3,i4);

and a1(i1,~y1,~y2);
and a2(i2,~y1,y2);
and a3(i3,y1,~y2);
and a4(i4,y1,y2);

endmodule


module decoder2to4_tb();
reg y1,y2;
wire i1,i2,i3,i4;

decoder2to4 gate1(y1,y2,i1,i2,i3,i4);

initial
repeat(4)
begin
y1=0;y2=0;#10;
y1=0;y2=1;#10;
y1=1;y2=0;#10;
y1=1;y2=1;#10;
end

initial
$monitor("y1=%d y2=%D i1=%D i2=%d i3=%d i4=%d Time=%0t",y1,y2,i1,i2,i3,i4,$time);
endmodule
