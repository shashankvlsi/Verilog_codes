`include"jkl.v"
module tb();
reg clk,rst,j,k;
wire q,qbar;

jkl gate(clk,rst,j,k,q,qbar);

always begin
       clk=0;#10;
       clk=1;#10;
       end

initial
      begin
      rst=0;#10;
      rst=1;
  repeat(10)
  begin
  j=$random;k=$random;#10;
  end
  end

  initial
  $monitor("rst=%d clk=%d j=%d k=%d q=%d qbar=%b time=%0t",rst,clk,j,k,q,qbar,$time);

  initial
#100 $stop;

  endmodule
 
