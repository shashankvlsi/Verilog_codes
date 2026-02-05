module srff(input clk,rst,s,r, output reg q, output qbar);

assign qbar=~q;
always @(posedge clk)
begin
   if(!rst)
       q<=0;
       else 
           begin
                case({s,r})
                2'b00 : q<=q;
                2'b01 : q<=0;
                2'b10 : q<=1;
                default : q<=1'bx;
                endcase
           end
end
endmodule



//TESTBENCH

module tb();
reg clk,rst,s,r;
wire q,qbar;

srff gate(.s,.rst,.clk,.q,.r,.qbar);

initial clk=0;
always #10 clk=~clk;

initial
begin
rst=0;#10;rst=1;
end

initial
repeat(11)
begin
{s,r}=$random;#10;
end

initial
$monitor("clk=%b rst=%b s=%b r=%b q=%b qbar=%b Time=%0t",clk,rst,s,r,q,qbar,$time);

initial
#200 $stop;
endmodule



