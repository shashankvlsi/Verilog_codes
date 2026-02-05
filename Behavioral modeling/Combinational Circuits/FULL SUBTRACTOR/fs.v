module fs(input a,b,bin, output reg diff,bout);

always @(a,b,bin)
begin
     if(!a && !b && !bin)
         begin
         diff=0;bout=0;
         end
             else
                 if(!a && !b && bin)
                  begin
                  diff=1;bout=1;
                  end

              else
                  if(!a && b && !bin)
                 begin
                 diff=1;bout=1;
                end
                else
                    if(!a && b && bin )
                    begin
                    diff=0;bout=1;
                    end
                     else
                    if(a && !b && !bin )
                    begin
                    diff=1;bout=0;
                    end
                     else
                    if(a && !b && bin )
                    begin
                    diff=0;bout=0;
                    end
                     else
                    if(a && b && !bin )
                    begin
                    diff=0;bout=0;
                    end
                    else
                        begin
                        diff=1;bout=1;
                        end



end
endmodule

module tb();
reg a,b,bin;
wire diff,bout;

fs gate(a,b,bin,diff,bout);

initial
repeat(30)
begin
a=$random;b=$random;bin=$random;#10;
end

initial
$monitor("a=%b b=%b bin=%b diff=%b bout=%b Time=%0t",a,b,bin,diff,bout,$time);
initial
#1000 $stop;
endmodule
