module down(input clk,rst,output integer count);

always @(posedge clk or posedge rst)
begin
if(rst)
    count<=15;
    else
        count<=count-1;
end
endmodule

module tb();
reg clk,rst;
wire integer count;

down gate(clk,rst,count);

initial
begin
clk=0;
while(1)
    #5 clk=~clk;
end

initial
begin
rst=1;
#10 rst=0;
end

initial
$monitor("count=%0d",count);

initial
#150 $stop;

endmodule


