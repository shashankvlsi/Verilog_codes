module jkff(input clk,rst,j,k, output reg q, output qbar);

assign qbar=~q;
always @(posedge clk)
begin
   if(!rst)
       q<=0;
       else 
           begin
                case({j,k})
                2'b00 : q<=q;
                2'b01 : q<=0;
                2'b10 : q<=1;
                default : q<=~q;
                endcase
           end
end
endmodule



//TESTBENCH

module tb();
reg clk,rst,j,k;
wire q,qbar;

jkff gate(.j,.rst,.clk,.k,.q,.qbar);

initial clk=0;
always #10 clk=~clk;

initial
begin
rst=0;#10;rst=1;
end

initial
repeat(11)
begin
{j,k}=$random;#10;
end

initial
$monitor("clk=%b rst=%b j=%b k=%b q=%b qbar=%b Time=%0t",clk,rst,j,k,q,qbar,$time);

initial
#200 $stop;
endmodule



