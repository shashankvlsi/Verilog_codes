//---------------------------------------------------------FULL ADDER-------------------------------------------------------------
module fa(input a,b,cin,output sum,carry);
      
      assign sum=a^b^cin;
      assign carry=(a&b)|(b&cin)|(cin&a);

endmodule

//-----------------------------------------------------RCA DESIGN------------------------------------------------------------------
module rca #(parameter width=32)(a,b,cin,sum,carry);
//Directions
input[width-1:0]a,b;
input cin;
output[width-1:0]sum;
output carry;
//Internal wires
wire [width:0]c;

assign c[0]=cin;
assign carry=c[width];

//Generate Block
genvar i;
generate
        for(i=0;i<width;i=i+1)

            fa gate(a[i],b[i],c[i],sum[i],c[i+1]);
  

endgenerate

endmodule

//----------------------------------------------------RCA TESTBENCH----------------------------------------------------------------

module tb();
parameter width=32;
reg [width-1:0]a,b;
reg cin;
wire[width-1:0]sum;
wire carry;
integer in,out;
reg[19:0]mem[7:0];
//reg x;


//rca #(.width(width)) rtl(a,b,cin,sum,carry);
rca rtl(a,b,cin,sum,carry);
defparam rtl.width=width;

initial
        begin
            in=$fopen("in.txt");
            out=$fopen("out.txt");
           // $readmemh("inputs.txt",mem);
            //x=0;
        repeat(7)
        begin
            a=$urandom_range(1,100);b=$urandom_range(1,100);cin=$random; 
          // {a,b,cin}=mem[x];
             $fdisplay(in,"a=%0d b=%0d cin=%b Time=%0t",a,b,cin,$time);   
#1;
             $fdisplay(out," sum=%0d carry=%0d Time=%0t",sum,carry,$time);
             #10;

        end
        $fclose(in);
        $fclose(out);
        end
//initial
//$monitor("a=%0d b=%0d cin=%b sum=%0d carry=%0d Time=%0t",a,b,cin,sum,carry,$time);

endmodule



