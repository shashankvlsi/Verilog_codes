module bi(input clk,rst,in,mode,output reg out);
reg [3:0] temp;

always@(posedge clk or negedge rst)
begin
     if(!rst)
         begin
                temp<=0;
                out<=0;          
         end
         else
             begin  
                  if(!mode)
                      begin
                           /*temp[3]<=in;
                           temp[2]<=temp[3];
                           temp[1]<=temp[2];
                           temp[0]<=temp[1];*/
                           temp<={in,temp[3:1]};
                           out<=temp[0];
                      end
                      else
                          if(mode)
                              begin
                                   /*temp[0]<=in;
                                   temp[1]<=temp[0];
                                   temp[2]<=temp[1];
                                   temp[3]<=temp[2];*/
                                  temp<={temp[2:0],in};
                                  out<=temp[3];     
                              end

              end
end
endmodule



module tb();
reg clk,rst,in,mode;
wire out;

bi gate(clk,rst,in,mode,out);

initial clk=0;
always #10 clk=~clk;

initial
        begin
              rst=0;
              #5 rst=1;
        end

initial
        begin
            mode=0;
            in=1;#15;
            in=0;#20;
            in=1;#20;
            in=1;#100;

            mode=1;#3;
            in=1;#15;
            in=0;#20;
            in=1;#20;
            in=1;

            end

initial
$monitor("clk=%0b rst=%0b in=%0b mode =%0b out=%0b Time=%0t",clk,rst,in,mode,out,$time);

initial
#350 $stop;

endmodule

