module srl(input clk,rst,s,r,output reg  q,output qbar);

assign qbar=~q;

always @(clk,rst,s,r)
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

       
