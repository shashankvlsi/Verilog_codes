module dl(input clk,rst,d,output reg q,output qbar);

assign qbar=~q;

always @(clk,rst)
begin

       if(!rst)
       q<=0;
         else
           begin
             if(clk==1)
                 begin
                      if(d|!d)
                          q<=d;
                  end
            end
end

endmodule






