//-------------------------------------------------------DESIGN--------------------------------------------------------------------//                                                 Empty-Full memeory  
module ram #(parameter width=8,depth=32) (input clk,rst,wr_re,input [width-1:0]din,input [$clog2(depth)-1:0]add,
                                          output reg empty,full,output reg [width-1:0]dout);

integer i;
reg[$clog2(depth):0]count;
reg [width-1:0]mem[depth-1:0];

always @(posedge clk or negedge rst)
      begin
           if(!rst)
               begin
               dout<=0;
               count<=0;
               empty<=1;
               full<=0;
              for(i=0;i<depth;i=i+1)
                   mem[i]<=0;
               end
           else
               if(wr_re)
                      begin
                        mem[add]<=din;
                        if(count<depth)
                        count=count+1;
                    end
               else
                   begin
                      dout<=mem[add];
                      if(count>0)
                       count=count-1;
                   end


               empty<=(count==0);
               full<=(count==depth);
      end


endmodule

//--------------------------------------------------------------TB----------------------------------------------------------------

module tb();
parameter width=8,depth=32;
reg clk,rst,wr_re;
reg [width-1:0]din;
reg [$clog2(depth)-1:0]add;
wire empty,full;
wire[width-1:0]dout;

integer i;
reg finish;

ram rtl(.*);
defparam rtl.width=width;
defparam rtl.depth=depth;

initial clk=0;
always #5 clk=~clk;

initial
      begin
           rst=0;
           #20;rst=1;
      end

task write();
     begin
          wr_re=1;
          for(i=0;i<depth;i=i+1)
             begin
                  add=i;
                  din=$random;
                  #10;
                 
              end
     end
endtask

task read();
     begin
          wr_re=0;
          for(i=0;i<depth;i=i+1)
             begin
                  add=i;
                  #10;
             end
              finish=1;
     end
endtask

initial
      begin
      wait(rst==1);
      write();
      read();
      end

initial 
       begin
       wait(finish==1);
       $stop;
       end

initial
$monitor("clk=%b rst=%b wr_re=%b address=%0d din=%0d dout=%0d Empty=%b Full=%b Time=%0t",clk,rst,wr_re,add,din,dout,empty,full,$time);
endmodule

