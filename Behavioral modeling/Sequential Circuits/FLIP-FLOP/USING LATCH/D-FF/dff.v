`include"dl.v"
module dff(input clk,rst,d,Q,Qbar);

dl gate1(~clk,rst,d,q,qbar);
dl gate2(clk,rst,q,Q,Qbar);
endmodule

module tb();
reg clk,rst,d;
wire Q,Qbar;

dff gate(clk,rst,d,Q,Qbar);

initial clk=0;
always #10 clk=~clk;

initial     
          begin
         rst=0; #10;
         rst=1;
repeat(17)
              begin
              #7;
              d=$random;#10;
              end
           end

initial
#100 $stop;

initial
$monitor("clk=%d d=%d Q=%d Qbar=%d Time=%0t",clk,d,Q,Qbar,$time);
endmodule
