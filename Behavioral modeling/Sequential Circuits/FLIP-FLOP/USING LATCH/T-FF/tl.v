module tl(input clk,rst,t,output reg q,output qbar);

assign qbar=~q;

always @ (clk or rst or t)
begin
     if(!rst)
         q<=0;
             else
                 begin
                      if(clk==1)
                               begin
                                    if(t)
                                        q<=~q;
                                    else
                                        q<=q;
                                end
                 end
end



endmodule
