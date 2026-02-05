module _4to1mux1(input i1,i2,i3,i4,[1:0]s,output y);
wire [3:0]w;
and a1(w[0],~s[1],~s[0],i1);
and a2(w[1],~s[1],s[0],i2);
and a3(w[2],s[1],~s[0],i3);
and a4(w[3],s[1],s[0],i4);
or o1(y,w[0],w[1],w[2],w[3]);
endmodule



module _4to1mux1_tb();
reg i1,i2,i3,i4;
reg [1:0]s;
wire y;
integer x;

_4to1mux1 gate(i1,i2,i3,i4,s,y);

initial
repeat(10)
begin
i1=$random;i2=$random;i3=$random;i4=$random;
for(x=0;x<=3;x=x+1)
    begin
    s=x;#10;
    end
    end

initial
$monitor("i1=%b i2=%b i3=%b i4=%b s=%b y=%b time=%t",i1,i2,i3,i4,s,y,$time);
endmodule

