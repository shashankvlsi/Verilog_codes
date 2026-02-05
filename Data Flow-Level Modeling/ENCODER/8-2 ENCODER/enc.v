module enc(input i0,i1,i2,i3,i4,i5,i6,i7 ,output y0,y1,y2);
assign y2=i4|i5|i6|i7;
assign y1=i3|i2|i6|i7;
assign y0=i1|i3|i5|i7;


endmodule

module enc_tb();
reg i0,i1,i2,i3,i4,i5,i6,i7;
wire y0,y1,y2;

enc gate(i0,i1,i2,i3,i4,i5,i6,i7,y0,y1,y2);

initial
begin

i0=1;i1=0;i2=0;i3=0;i4=0;i5=0;i6=0;i7=0;#10;
i0=0;i1=1;i2=0;i3=0;i4=0;i5=0;i6=0;i7=0;#10;
i0=0;i1=0;i2=1;i3=0;i4=0;i5=0;i6=0;i7=0;#10;
i0=0;i1=0;i2=0;i3=1;i4=0;i5=0;i6=0;i7=0;#10;
i0=0;i1=0;i2=0;i3=0;i4=1;i5=0;i6=0;i7=0;#10;
i0=0;i1=0;i2=0;i3=0;i4=0;i5=1;i6=0;i7=0;#10;
i0=0;i1=0;i2=0;i3=0;i4=0;i5=0;i6=1;i7=0;#10;
i0=0;i1=0;i2=0;i3=0;i4=0;i5=0;i6=0;i7=1;#10;
end
initial
$monitor("i0=%b i1=%b i2=%b i3=%b i4=%b i5=%b i6=%B i7=%b y2=%b y1=%B y0=%b  Time=%0t",i0,i1,i2,i3,i4,i5,i6,i7,y2,y1,y0,$time);
endmodule


