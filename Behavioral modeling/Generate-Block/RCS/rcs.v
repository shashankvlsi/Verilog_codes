//---------------------------------------------------------FULL ADDER-------------------------------------------------------------
module fa(input a,b,cin,output sum,carry);
      
      assign sum=a^b^cin;
      assign carry=(a&b)|(b&cin)|(cin&a);

endmodule

//-----------------------------------------------------RCS DESIGN------------------------------------------------------------------
module rcs #(parameter width=32)(a,b,bin,diff,bout);
//Directions
input[width-1:0]a,b;
input bin;
output[width-1:0]diff;
output bout;
//Internal wires
wire [width:0]c;

assign c[0]=bin;
assign bout=c[width];

//Generate Block
genvar i;
generate
        for(i=0;i<width;i=i+1)

            fa gate(a[i],~b[i],c[i],diff[i],c[i+1]);
  

endgenerate

endmodule

//----------------------------------------------------RCS TESTBENCH----------------------------------------------------------------

module tb();
parameter width=32;
reg [width-1:0]a,b;
reg bin;
wire[width-1:0]diff;
wire bout;
integer in,out;
//reg[19:0]mem[7:0];
//reg x;


//rca #(.width(width)) rtl(a,b,cin,sum,carry);
rcs rtl(a,b,bin,diff,bout);
defparam rtl.width=width;

initial
        begin
           // in=$fopen("in.txt");
            //out=$fopen("out.txt");
           // $readmemh("inputs.txt",mem);
            //x=0;
        repeat(7)
        begin
            a=$urandom_range(10,30);b=$urandom_range(1,10);bin=1; 
          // {a,b,cin}=mem[x];
           //  $fdisplay(in,"a=%0d b=%0d cin=%b Time=%0t",a,b,cin,$time);   #1;
            // $fdisplay(out," sum=%0d carry=%0d Time=%0t",sum,carry,$time);
             #10;

        end
       // $fclose(in);
        //$fclose(out);
        end
initial
$monitor("a=%0d b=%0d bin=%b diff=%0d bout=%0d Time=%0t",a,b,bin,diff,bout,$time);

endmodule

