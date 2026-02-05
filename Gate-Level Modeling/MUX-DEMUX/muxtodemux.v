`include"_4to1mux1.v"
`include"_1to4demux.v"
module muxtodemux(input i1,i2,i3,i4,[1:0]s,y1,y2,y3,y4);
//wire w;
_4to1mux1 gate1 (i1,i2,i3,i4,s,y);
_1to4demux gate2 (y,s,y1,y2,y3,y4);
endmodule


module muxtodemux_tb();
reg i1,i2,i3,i4;
reg [1:0]s;
wire y1,y2,y3,y4;
integer x;

muxtodemux gatee1(i1,i2,i3,i4,s,y1,y2,y3,y4);

initial
repeat(4)
begin
i1=$random;i2=$random;i3=$random;i4=$random;
for(x=0;x<4;x=x+1)
    begin
    s=x;#10;
end
end
initial
$monitor("i1=%b i2=%b i3=%b i4=%b s=%b y1=%b y2=%b y3=%b y4=%b Time=%0t",i1,i2,i3,i4,s,y1,y2,y3,y4,$time);
endmodule
