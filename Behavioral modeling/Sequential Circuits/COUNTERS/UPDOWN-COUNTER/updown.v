module updown(input clk,rst,mode,output integer count);

always @(posedge clk or negedge rst)
begin
if(!rst)
    count<=0;
    else
            if(mode)
                count<=count+1;
      
        else 
          
             //   if(!mode)
                    count<=count-1;
            
end
endmodule


module tb();
reg clk,rst,mode;
wire integer count;
integer i;

updown gate(clk,rst,mode,count);

initial
begin
clk=0;
for(i=0;i<5;i=0)
    #10 clk=~clk;
end

initial
begin
rst=0;
#5 rst=1;
end

initial
begin
mode=1;
#1000;
mode=0;
end

initial
$monitor("count=%0d",count);

initial
#2000 $stop;

endmodule
