module srff(input clk,rst,s,r,output reg q,output qbar);

assign qbar=~q;

always @(posedge clk)
begin
if(!rst)
    q<=0;
    else
        if(!s && !r)
            q<=q;
            else if(!s && r)
                q<=0;
                else if(s && !r)
                    q<=1;
                    else
                        q<=1'bx;
end
endmodule

//TESTBENCH

module tb();
reg clk,rst,s,r;
wire q,qbar;

srff gate(.clk,.rst,.s,.r,.q,.qbar);

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
#500 $stop;
endmodule

