module palin #(parameter width=4)(input[width-1:0]num,output reg palindrome);
integer i;

     always @(*)
            begin
                palindrome=1;
                for(i=0;i<(width/2);i=i+1)
                        if(num[i]!==num[width-1-i])
                            palindrome=0;
                        
            end

endmodule


module tb();
parameter width=7;
reg[width-1:0]num;
wire palindrome;

palin #(.width(width)) rtl(num,palindrome);

initial
      repeat(10)
        begin
            num=$random;
            #10;
        end
initial
$monitor("NUMBER=%b PALINDROME=%b Time=%0t",num,palindrome,$time);

endmodule

