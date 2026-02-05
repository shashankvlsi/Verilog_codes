`include"tl.v"
module tff(input clk,rst,t, output Q ,Qbar);

tl gate1(~clk,rst,t,q,qbar);
tl gate2(clk,rst,q,Q,Qbar);

/*tl gate1(.clk(~clk),
         .rst(rst),
         .t(t),
         .q(q),
         .qbar(qbar)
         );
tl gate2(.clk(clk),
         .rst(rst),
         .t(q),
         .q(Q),
         .qbar(Qbar)
         );*/
endmodule

module tb();
reg clk,rst,t;
wire Q,Qbar;

tff gate(clk,rst,t,Q,Qbar);

initial clk=0;
always #10 clk=~clk;

initial
begin
rst=0;
#10;
rst=1;

repeat(10)
begin
#7;
t=$random;#10;
end
end
initial
$monitor("rst=%d clk=%d t=%d  Q=%d Qbar=%d Time=%0t",rst,clk,t,Q,Qbar,$time);
initial
#100 $stop;
endmodule

