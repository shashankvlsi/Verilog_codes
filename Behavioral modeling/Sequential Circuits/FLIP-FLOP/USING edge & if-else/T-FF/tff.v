module tff(input clk,rst,t,output reg q,output qbar);

assign qbar=~q;

always @(posedge clk)
begin
if(!rst)
    q<=0;
    else
        if(t)
            q<=~q;
             
                
end
endmodule


//TESTBENCH

module tb();
reg clk,rst,t;
wire q,qbar;

tff gate(.clk,.rst,.q,.qbar,.t);


always 
begin
clk=0;#10;
clk=1;#10;
end


initial
begin
rst=0;#20;rst=1;
end

initial
repeat(11)
begin
t=$random;#10;
end

initial
$monitor("clk=%b rst=%b t=%b q=%b qbar=%b Time=%0t",clk,rst,t,q,qbar,$time);

initial
#200 $stop;
endmodule


