`include"_4to1mux1.v"
module _4to1mux2 (input[3:0]i1,i2,i3,i4,[1:0]s,output[3:0]y);

_4to1mux1 gate1(i1[0],i2[0],i3[0],i4[0],s,y[0]);
_4to1mux1 gate2(i1[1],i2[1],i3[1],i4[1],s,y[1]);
_4to1mux1 gate3(i1[2],i2[2],i3[2],i4[2],s,y[2]);
_4to1mux1 gate4(i1[3],i2[3],i3[3],i4[3],s,y[3]);

endmodule



module _4to1mux2_tb();
reg[3:0]i1,i2,i3,i4;
reg[1:0]s;
wire[3:0]y;
integer x;


_4to1mux2 gateee(i1,i2,i3,i4,s,y);

initial
repeat(9)
begin
i1=$random;i2=$random;i3=$random;i4=$random;
for(x=0;x<4;x=x+1)
    begin
    s=x;#10;
    end
    end

initial
$monitor("i1=%d i2=%d i3=%d i4=%d s=%b y=%d Time=%T",i1,i2,i3,i4,s,y,$time);
endmodule
