module dff(input clk,rst,d,output reg q=0);


always @(posedge clk)
begin
if(!rst)
    q<=0;
    else
        if(!d | d)
            q<=d;
             
                
end
endmodule



