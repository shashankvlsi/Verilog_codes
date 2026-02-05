module enc(input i0,i1,i2,i3,output y0,y1);

assign y1=i3+i2;
assign y0=i1+i3;

endmodule

module enc_tb();
reg i0,i1,i2,i3;
wire y0,y1;

enc gate(i0,i1,i2,i3,y0,y1);

initial
begin

i0=1;i1=0;i2=0;i3=0;#10;
i0=0;i1=1;i2=0;i3=0;#10;
i0=0;i1=0;i2=1;i3=0;#10;
i0=0;i1=0;i2=0;i3=1;#10;
end

initial
$monitor("i0=%b i1=%b i2=%b i3=%b y0=%b y1=%B Time=%0t",i0,i1,i2,i3,y0,y1,$time);
endmodule



