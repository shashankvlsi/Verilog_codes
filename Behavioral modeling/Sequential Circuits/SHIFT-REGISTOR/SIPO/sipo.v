module sipo#(parameter width=10)(input clk,rst,in,mode,output reg [width-1:0]out);
reg [width-1:0]temp;

always @ (posedge clk or negedge rst)
begin
     if(!rst)
         begin
               temp<=0;
               out<=0;
         end
         else if(mode)
             
                    temp<={in,temp[width-1:1]};
                  else
                      assign out=temp;
end
endmodule

module tb();
reg clk,rst,in,mode;
wire [3:0]out;

sipo gate(clk,rst,in,mode,out);

initial clk=0;
always #10 clk=~clk;

initial
        begin
              rst=0;
              #5 rst=1;
        end

initial
        begin
            in=1;#15;
            in=0;#20;
            in=1;#20;
            in=1;
            end

initial
begin
mode=0;
#80 mode=1;
end
initial
$monitor("clk=%0b rst=%0b in=%0b mode=%0b out=%0b Time=%0t",clk,rst,in,mode,out,$time);

initial
#120 $stop;

endmodule


