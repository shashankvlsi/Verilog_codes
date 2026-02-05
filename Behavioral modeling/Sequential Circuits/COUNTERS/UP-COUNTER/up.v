module up(input clk,rst,output  integer count);


always @ (posedge clk or negedge rst)
begin
if(!rst)
    count<=0;
    else
        count<=count+1;
end
endmodule


module tb();
reg clk,rst;
wire integer count;

up gate(clk,rst,count);


initial
begin
clk=0;
forever 
#10 clk=~clk;
end

initial
begin
rst=0;
#5 rst=1;
end

initial
#2000 $stop;

initial
$monitor("count=%0d",count);


endmodule
