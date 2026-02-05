module siso(input clk,rst,in,output reg out);
reg[3:0] temp;

always @ (posedge clk or negedge rst)
begin
     if(!rst)
         begin
              temp<=0;
              out<=0;
         end
         else
             begin
                 out<=temp[0];
                 /* temp[0]<=temp[1];
                  temp[1]<=temp[2];
                  temp[2]<=temp[3]; */
                // temp<={temp[2:0],out};
                //
                 temp[3]<=in;
                 temp[2]<=temp[3];
                 temp[1]<=temp[2];
                 temp[0]<=temp[1];
                // temp<={in,temp[3:1]};

                

             end
           //  assign out=temp[0];
end
endmodule

module tb();
reg clk,rst,in;
wire out;

siso gate(clk,rst,in,out);

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
$monitor("clk=%0b rst=%0b in=%0b out=%0b Time=%0t",clk,rst,in,out,$time);

initial
#200 $stop;

endmodule
