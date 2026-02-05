`include"encoder4to2.v"
`include"decoder2to4.v"
module enco_deco(input i1,i2,i3,i4,output g1,g2,g3,g4);
encoder4to2 gate1(i1,i2,i3,i4,y1,y2);

decoder2to4 gate2(y1,y2,g1,g2,g3,g4);

endmodule



module enco_deco_tb();
reg i1,i2,i3,i4;
wire g1,g2,g3,g4;

enco_deco gate3(i1,i2,i3,i4,g1,g2,g3,g4);

initial
repeat(2)
begin
i1=1;i2=0;i3=0;i4=0;#10;
i2=1;i1=0;i3=0;i4=0;#10;
i3=1;i1=0;i2=0;i4=0;#10;
i4=1;i2=0;i3=0;i1=0;#10;
end


initial
$monitor("i1=%d i2=%d i3=%D i4=%D g1=%D g2=%D g3=%D g4=%D time=%0t",i1,i2,i3,i4,g1,g2,g3,g4,$time);
endmodule
