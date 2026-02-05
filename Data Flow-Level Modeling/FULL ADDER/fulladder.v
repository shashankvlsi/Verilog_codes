module fa(input a,b,cin,output  sum,carry);
assign sum=a^b^cin;
assign carry=(a&b)|(cin&(a^b));
endmodule


module fa_tb();
reg a,b,cin;
wire sum,carry;

fa gate(a,b,cin,sum,carry);

initial
      repeat(7)
     begin
     a=$random;b=$random;cin=$random;#10;
     end

     initial

     $monitor("a=%b b=%b cin=%B sum=%b carry=%b time=%0t",a,b,cin,sum,carry,$time);
     endmodule

