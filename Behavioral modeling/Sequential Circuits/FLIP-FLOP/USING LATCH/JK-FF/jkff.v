`include"jkl.v"
module jkff(input clk,rst,j,k,output Q,Qbar);

jkl gate1(~clk,rst,j,k,q,qbar);
jkl gate2(clk,rst,q,qbar,Q,Qbar);

endmodule

module tb();
reg clk,rst,j,k;
wire Q,Qbar;

jkff gate(clk,rst,j,k,Q,Qbar);

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
#7;
  j=$random;k=$random;#10;
  end
  end

  initial
  $monitor("rst=%d clk=%d j=%d k=%d Q=%d Qbar=%b time=%0t",rst,clk,j,k,Q,Qbar,$time);

  initial
#100 $stop;

  endmodule
 

