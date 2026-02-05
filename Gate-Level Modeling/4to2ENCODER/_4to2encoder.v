module encoder4to2(input i1,i2,i3,i4,output y1,y2);

or o1(y2,i2,i4);
or o2(y1,i3,i4);

endmodule


module encoder4to2_tb();
reg i1,i2,i3,i4;
wire y1,y2;

encoder4to2 gate(i1,i2,i3,i4,y1,y2);

initial
repeat(3)
begin
i1=1;i2=0;i3=0;i4=0;#10;
i2=1;i1=0;i3=0;i4=0;#10;
i3=1;i1=0;i2=0;i4=0;#10;
i4=1;i1=0;i3=0;i2=0;#10;
end

initial
$monitor("i1=%d i2=%D i3=%d i4=%d y1=%d y2=%d Time=%0t ",i1,i2,i3,i4,y1,y2,$time);
endmodule
