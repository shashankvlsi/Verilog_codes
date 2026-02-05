module hs(input a,b,output reg diff,bout);

always @(a,b)
begin
     if(!a && !b)
         begin
         diff=0;bout=0;
         end
             else
                 if(!a && b)
                  begin
                  diff=1;bout=1;
                  end

              else
                  if(a && !b)
                 begin
                 diff=1;bout=0;
                end
                else
                    begin
                    diff=0;bout=0;
                    end
end
endmodule

module tb();
reg a,b;
wire diff,bout;

hs gate(a,b,diff,bout);

initial
repeat(7)
begin
a=$random;b=$random;#10;
end

initial
$monitor("a=%b b=%b diff=%b bout=%b Time=%0t",a,b,diff,bout,$time);
initial
#200 $stop;
endmodule

