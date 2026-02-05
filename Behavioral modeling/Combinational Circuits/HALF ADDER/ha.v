module ha(input a,b , output reg sum,carry);

always @(a,b)
begin
     if(!a && !b)
         begin
         sum=0;carry=0;
         end
             else
                 if(!a && b)
                  begin
                  sum=1;carry=0;
                  end

              else
                  if(a && !b)
                 begin
                 sum=1;carry=0;
                end
                else
                    begin
                    sum=0;carry=1;
                    end
end
endmodule

module tb();
reg a,b;
wire sum,carry;

ha gate(a,b,sum,carry);

initial
repeat(7)
begin
a=$random;b=$random;#10;
end

initial
$monitor("a=%b b=%b sum=%b carry=%b Time=%0t",a,b,sum,carry,$time);
initial
#200 $stop;
endmodule
