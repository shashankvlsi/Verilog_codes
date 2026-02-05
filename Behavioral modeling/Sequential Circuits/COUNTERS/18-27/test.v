module test(input clk,rst,output integer count);

always @(posedge clk or negedge rst)
begin
if(!rst)
    count<=18;
    else
        count<=count+1;

if(count==27)
   // $stop;
    count<=18;

end
endmodule


module tb();
reg clk,rst;
wire 
integer count;

test gate(clk,rst,count);

initial clk=0;
always #10 clk=~clk;

initial
begin
rst=0;
#5 rst=1;
end

initial
$monitor("count=%0d",count);

initial
#500 $stop;

endmodule


