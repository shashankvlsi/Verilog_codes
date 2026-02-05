//---------------------------------------------------------FULL ADDER-------------------------------------------------------------
module fa(input a,b,cin,output sum,carry);
      
      assign sum=a^b^cin;
      assign carry=(a&b)|(b&cin)|(cin&a);

endmodule

//-----------------------------------------------------AS DESIGN------------------------------------------------------------------

module as #(parameter width=32, MODE=1)(a,b,cin,sum,carry);
//Directions
input[width-1:0]a,b;
input cin;
output[width-1:0]sum;
output carry;
//Internal wires
wire [width:0]c;

assign c[0]=cin;
//assign c[0]=bin;
assign carry=c[width];

//Generate Block
genvar i;
generate
          begin
        if(MODE)
          for(i=0;i<width;i=i+1)
           fa gate(a[i],b[i],c[i],sum[i],c[i+1]);
       
        else
          for(i=0;i<width;i=i+1)
           fa gate(a[i],~b[i],c[i],sum[i],c[i+1]);
         end

endgenerate

endmodule

//----------------------------------------------------AS TESTBENCH----------------------------------------------------------------

module tb();
parameter width=32,MODE=1;
reg [width-1:0]a,b;
reg cin,bin;
wire[width-1:0]sum;
wire carry;
integer add,sub;
//reg[19:0]mem[7:0];
//reg x;


//rca #(.width(width)) rtl(a,b,cin,sum,carry);
as rtl(a,b,cin,sum,carry);
defparam rtl.width=width;
defparam rtl.MODE=MODE;
initial
        begin
            add=$fopen("add.txt");
            sub=$fopen("sub.txt");
           // $readmemh("inputs.txt",mem);
            //x=0;
        repeat(11)
        begin
        if(MODE)
            begin
            a=$urandom_range(0,100);b=$urandom_range(0,100);cin=$random;#1;
            $fdisplay(add,"a=%0d b=%0d cin=%b sum=%0d carry=%0d Time=%0t",a,b,cin,sum,carry,$time);   #1;
            end
        else
            begin
            a=$urandom_range(20,100);b=$urandom_range(1,20);cin=1;#1;
            $fdisplay(sub,"a=%0d b=%0b bin=%b diff=%0d bout=%0d Time=%0t",a,b,cin,sum,carry,$time);

            end
            
                                             #10;

        end
      //  $fclose(in);
      //  $fclose(out);
        end
initial
if(MODE)
       $monitor("a=%0d b=%0d cin=%b sum=%0d carry=%0d Time=%0t",a,b,cin,sum,carry,$time);
else

       $monitor("a=%0d b=%0d bin=%b diff=%0d bout=%0d Time=%0t",a,b,cin,sum,carry,$time);
endmodule


