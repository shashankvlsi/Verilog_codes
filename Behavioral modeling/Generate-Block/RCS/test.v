module fa (input a,b,cin,output sum,carry);

          assign sum=a^b^cin;
          assign carry=(a&b)|(b&cin)|(cin&a);
endmodule



module rca #(parameter width=32)(input [width-1:0]a,b,input cin,output [width-1:0]sum,output carry);

wire[width:0]c;

assign c[0]=cin;
assign carry=c[width];

genvar i;

generate
              for(i=0;i<width;i=i+1)
   
       fa gate(a[i],b[i],c[i],sum[i],c[i+1]);               

endgenerate
endmodule


module tb();
parameter width=32;
reg [width-1:0]a,b;
reg cin;
wire[width-1:0]sum;
wire carry;
//integer in,out;

rca #(.width(width))rtl(a,b,cin,sum,carry);

initial
        begin
            repeat(10)
            begin
            a=$urandom_range(1,100);b=$urandom_range(1,100);cin=$random;#10;
            end
        end

initial
$monitor("a=%0d b=%0d cin=%b sum=%d carry=%d",a,b,cin,sum,carry);

endmodule




