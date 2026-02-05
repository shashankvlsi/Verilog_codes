//------------------------------------------------------------DESIGN-------------------------------------------------------------
module fifo #(parameter width=8,depth=32)(input clk,rst,wr,rd,[width-1:0]datain,output  full,empty,reg[width-1:0]dataout);

reg[$clog2(depth)-1:0]wr_ptr;
reg[$clog2(depth)-1:0]rd_ptr;

reg[width-1:0]mem[depth-1:0];
integer count,i;

assign full=(count==depth);
assign empty=(count==0);

always @(posedge clk or negedge rst)
begin
    if(!rst)
        begin
            dataout<=0;
           // empty<=1;
            //full<=0;
            wr_ptr<=0;
            rd_ptr<=0;
            count<=0;
            for(i=0;i<depth;i=i+1)
                mem[i]<=0;
        end
     else
         if(wr && !rd && !full)
             begin
                 mem[wr_ptr]<=datain;
                 wr_ptr<=wr_ptr+1;
                 count<=count+1;
             end
     else 
         if(!wr && rd && !empty)
             begin
                 dataout<=mem[rd_ptr];
                 rd_ptr<=rd_ptr+1;
                 count<=count-1;
             end
     else
         if(wr && rd && !full && !empty)
             begin
              mem[wr_ptr]<=datain;
              wr_ptr<=wr_ptr+1;
              dataout<=mem[rd_ptr];
              rd_ptr<=rd_ptr+1;
             end            
end
endmodule

//---------------------------------------------------------------TB---------------------------------------------------------------
module tb();
parameter width=8,depth=32;
reg clk,rst,wr,rd;
reg[width-1:0]datain;
wire full,empty;
wire[width-1:0]dataout;
integer i;

fifo rtl(.*);

initial clk=0;
always #5 clk=~clk;

initial
begin
rst=0;
#20;
rst=1;
end

task write();
    begin
     wr=1;rd=0;
     for(i=0;i<depth;i=i+1)
         begin
         datain=$random;
         #10;
         end      
    end
endtask

task read();
     begin
     wr=0;rd=1;
     end
endtask

initial
begin
write();
read();
end

initial
begin
#50;
wait(empty==1);
 $stop;
end

initial
$monitor("clk=%b rst=%b wr=%b rd=%b datain=%d dataout=%d empty=%b full=%b Time=%0t",clk,rst,wr,rd,datain,dataout,empty,full,$time);

endmodule





