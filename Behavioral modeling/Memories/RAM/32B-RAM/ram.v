//-------------------------------------------------------DESIGN--------------------------------------------------------------------// 32 bit memeory  
module ram (input clk,rst,wr_re,[7:0]din,[4:0]add,output reg [7:0]dout);

reg [5:0] i;
reg [7:0]mem[31:0];

always @(posedge clk or negedge rst)
      begin
           if(!rst)
               begin
               dout<=0;
              for(i=0;i<32;i=i+1)
                   mem[i]<=0;
               end
           else
               if(wr_re)
                   mem[add]<=din;
               else
                   dout<=mem[add];
      end

endmodule

//--------------------------------------------------------------TB----------------------------------------------------------------

module tb();
reg clk,rst,wr_re;
reg [7:0]din;
reg [4:0]add;
wire[7:0]dout;

reg[5:0] i;
reg finish;

ram rtl(.*);

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
          for(i=0;i<32;i=i+1)
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
          for(i=0;i<32;i=i+1)
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
       wait(finish==1)
       $stop;
       end

initial
$monitor("clk=%b rst=%b wr_re=%b address=%0d din=%0d dout=%0d Time=%0t",clk,rst,wr_re,add,din,dout,$time);
endmodule


     
