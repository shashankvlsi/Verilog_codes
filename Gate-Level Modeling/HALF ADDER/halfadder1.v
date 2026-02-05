module halfadder1(input a,b,output sum, carry);

    xor x1(sum,a,b);
    and a1(carry,a,b);
    endmodule 


module halfadder1_tb();
   reg a,b;
   wire sum,carry;
   halfadder1 gate (a,b,sum,carry);

   initial
   repeat(4)
   begin
   a=$random;b=$random;#5;
   end
   initial
   $monitor("a=%b b=%b sum=%b carry=%b Time=%0t",a,b,sum,carry,$time);
   endmodule
