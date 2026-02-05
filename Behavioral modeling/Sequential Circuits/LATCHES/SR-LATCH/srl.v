module srl(input clk,rst,s,r,output reg  q,output qbar);

assign qbar=~q;

always @(clk,rst,s,r)
//always @(*)
      begin 
      if(!rst)
          q<=0;
          else 
                begin
                    if(clk==1)
                        begin
                            if(!s && !r)
                                q<=q;
                            else if(!s && r)
                                q<=0;
                            else if(s && !r)
                                q<=1;
                            else
                                q<=1'bx;
                        end
                end
        end
endmodule

module tb();
reg clk,rst,s,r;
wire q,qbar;

srl gate(clk,rst,s,r,q,qbar);

initial clk=0;
always begin
    clk=~clk;
        #10;
    end
initial begin
rst=0; #10;
rst=1;
//repeat(7) begin
/*s=$random;r=$random;
#10;*/
 #10 s=0;r=0;
 #4 s=0;r=1;
 #3 s=1;r=0;
 #2 s=1;r=1; 

//end
end
initial
#100 $stop;
    
initial
$monitor("clk=%d s=%d r=%d q=%d qbar=%d Time=%0t",clk,s,r,q,qbar,$time);
endmodule


       

