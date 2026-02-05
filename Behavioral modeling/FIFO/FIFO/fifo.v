module fifo #(parameter width=8,depth=8)(input clk,rst,rd,wr,input[width-1:0]datain,output reg [width-1:0]dataout,output empty,full);

reg[$clog2(depth):0]wr_ptr;
reg[$clog2(depth):0]rd_ptr;
integer i;

reg[width-1:0]mem[depth-1:0];

assign empty=(wr_ptr==rd_ptr);
//assign full=({!wr_ptr[3],wr_ptr[2:0]}==rd_ptr);
assign full=({!wr_ptr[$clog2(depth)],wr_ptr[$clog2(depth)-1:0]}==rd_ptr);


always @(posedge clk or negedge rst)
begin
     if(!rst)
         begin
             dataout<=0;
             wr_ptr<=0;
             rd_ptr<=0;
             for(i=0;i<depth;i=i+1)
                 mem[i]<=0;
         end
      else
          if(wr && !rd && !full)
              begin
                  mem[wr_ptr]<=datain;
                  wr_ptr<=wr_ptr+1;
              end
       else
          if(!wr && rd && !empty)
              begin
               dataout<=mem[rd_ptr];
               rd_ptr<=rd_ptr+1;
              end

  /*     else if(wr && rd && !full && !empty)
           begin
    // Bypass logic: if reading the same location, output datain
    if(wr_ptr == rd_ptr)
        dataout = datain;  // blocking
    else
        dataout = mem[rd_ptr]; // blocking

    // Write to memory
    mem[wr_ptr] <= datain;

    // Increment pointers
    wr_ptr <= wr_ptr + 1;
    rd_ptr <= rd_ptr + 1;
            end*/
              
       else
          if(wr && rd && !full && !empty)
              begin
                mem[wr_ptr]<=datain;
              if(wr_ptr==rd_ptr)
                      begin
                      dataout<=datain;
                      end
              else
                    begin
                         // mem[wr_ptr]<=datain;
                          dataout<=mem[rd_ptr];
                          rd_ptr<=rd_ptr+1;
                          wr_ptr<=wr_ptr+1;
                     end
                     end        


         /*            
           else if(wr && rd && !full && !empty)
              begin
    // write to memory
    mem[wr_ptr] <= datain;

    // bypass if reading the same location being written
    dataout <= (wr_ptr == rd_ptr) ? datain : mem[rd_ptr];

    // increment pointers
    wr_ptr <= wr_ptr + 1;
    rd_ptr <= rd_ptr + 1;
               end                 */
       
          
           

end

endmodule

//---------------------------------------------------------------TB---------------------------------------------------------------

module tb();
parameter width=8,depth=8;
reg clk,rst,rd,wr;
reg[width-1:0]datain;
wire [width-1:0]dataout;
wire empty,full;
integer i;
reg finish;

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
       
           
              @(negedge  clk)datain=$urandom_range(1,100);
              @(negedge  clk)datain=$urandom_range(1,100);
              @(negedge  clk)datain=$urandom_range(1,100);
              @(negedge  clk)datain=$urandom_range(1,100);
              @(negedge  clk)datain=$urandom_range(1,100);
              @(negedge  clk)datain=$urandom_range(1,100);
              @(negedge  clk)datain=$urandom_range(1,100);
              @(negedge  clk)datain=$urandom_range(1,100);#10;
              

                  end

endtask

task read();
begin
  rd = 1; wr = 0;
     wait(empty==1);
     @(posedge clk);
  rd = 0;
  finish=1;
end
endtask
/*
task read();
     begin
     rd=1; wr=0;
          end        
endtask*/

task wr_rd();
     begin
     wr=1;rd=1;
     for(i=0;i<depth;i=i+1)
         @(posedge clk) datain=$urandom;

     end
endtask

initial
      begin
      wait(rst==1);
        // write();
        // read();
          wr_rd();
          
      end

initial
$monitor("clk=%b rst=%b write=%b read=%b datain=%d dataout=%d empty=%b full=%b Time=%0t",clk,rst,wr,rd,datain,dataout,empty,full,$time);

initial
    begin
//   wait(finish==1);
    #200 $stop;
    end

    endmodule
