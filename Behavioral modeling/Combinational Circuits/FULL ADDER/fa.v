module fa(input a,b,cin, output reg sum,carry);

always @(a,b,cin)
begin
     if(!a && !b && !cin)
         begin
         sum=0;carry=0;
         end
             else
                 if(!a && !b && cin)
                  begin
                  sum=1;carry=0;
                  end

              else
                  if(!a && b && !cin)
                 begin
                 sum=1;carry=0;
                end
                else
                    if(!a && b && cin )
                    begin
                    sum=0;carry=1;
                    end
                     else
                    if(a && !b && !cin )
                    begin
                    sum=1;carry=0;
                    end
                     else
                    if(a && !b && cin )
                    begin
                    sum=0;carry=1;
                    end
                     else
                    if(a && b && !cin )
                    begin
                    sum=0;carry=1;
                    end
                    else
                        begin
                        sum=1;carry=1;
                        end



end
endmodule

module tb();
reg a,b,cin;
wire sum,carry;

fa gate(a,b,cin,sum,carry);

initial
repeat(30)
begin
a=$random;b=$random;cin=$random;#10;
end

initial
$monitor("a=%b b=%b cin=%b sum=%b carry=%b Time=%0t",a,b,cin,sum,carry,$time);
initial
#1000 $stop;
endmodule
