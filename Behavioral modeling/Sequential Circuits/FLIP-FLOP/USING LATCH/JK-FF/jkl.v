module jkl(input clk,rst,j,k,output reg q,output qbar);

assign qbar = ~q;

always @ (clk,rst,j,k)


begin
     if(!rst)
         q<=0;
         else
             begin
                  if(clk==1)
                      begin
                          if(~j && ~k)
                              q<=q;
                           else if(~j && k)
                               q<=0;
                            else if(j && ~k)
                                q<=1;
                             else
                                 q<=~q;
                       end 
                end
end
endmodule
