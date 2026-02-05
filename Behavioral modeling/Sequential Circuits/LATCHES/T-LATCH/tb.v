`include"tl.v"
module tb();
reg clk,rst,t;
wire q,qbar;

tl gate(clk,rst,t,q,qbar);

initial clk=0;
always #10 clk=~clk;

initial
begin
rst=0;
#10;
rst=1;

repeat(10)
begin
t=$random;#10;
end
end
initial
$monitor("rst=%d clk=%d t=%d  q=%d qbar=%d Time=%0t",rst,clk,t,q,qbar,$time);
initial
#100 $stop;
endmodule

