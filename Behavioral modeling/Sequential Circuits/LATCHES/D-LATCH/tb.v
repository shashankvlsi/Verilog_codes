`include"dl.v"
module tb();
reg clk,rst,d;
wire q,qbar;

dl gate(clk,rst,d,q,qbar);

initial clk=0;
always #10 clk=~clk;

initial     
          begin
         rst=0; #10;
         rst=1;
repeat(10)
              begin
              d=$random;#10;
              end
           end

initial
#100 $stop;

initial
$monitor("clk=%d d=%d q=%d qbar=%d Time=%0t",clk,d,q,qbar,$time);
endmodule
