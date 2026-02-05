`include"dff.v"
module siso(input clk,rst,a,output y1,y2,y3,y4);


dff gate1(clk,rst,a,y1);
dff gate2(clk,rst,y1,y2);
dff gate3(clk,rst,y2,y3);
dff gate4(clk,rst,y3,y4);

endmodule


module tb();
reg clk,rst;
reg a;
wire y1,y2,y3,y4;

siso gate5(clk,rst,a,y1,y2,y3,y4);

initial clk=0;
always 
begin
#10;
clk=~clk;
end


initial
begin
rst=0;#5;
rst=1;
end


initial
begin
  a = 0;
  #5;
  a = 1; #20;   
  a = 0; #20;
  a = 1; #20;
  a = 0;
end

initial
$monitor("clk=%b rst=%b a=%b y1=%b y2=%b y3=%b y4=%b Time=%0t",clk,rst,a,y1,y2,y3,y4,$time);

initial
#150 $stop;
endmodule
