module rca (input [3:0]a,b,input cin,output reg [3:0]sum,output reg carry);
  reg[1:0] ans;
  reg c;
  function reg[1:0] fa (input a,b,cin);
  reg sum,carry;
  begin
        sum=a^b^cin;
        carry=(a&b)|(b&cin)|(a&cin);

        fa={carry,sum};

        $display("a=%b b=%b cin=%b fa=%d",a,b,cin,fa);
  end
  endfunction

  always @(*)
    begin
        ans=fa(a[0],b[0],cin);
        sum[0]=ans[0];
        c=ans[1];

        ans=fa(a[1],b[1],c);
        sum[1]=ans[0];
        c=ans[1];

        ans=fa(a[2],b[2],c);
        sum[2]=ans[0];
        c=ans[1];

        ans=fa(a[3],b[3],c);
        sum[3]=ans[0];
        carry=ans[1];

    end
    endmodule



module tb();
reg [3:0]fa,fb;
reg fcin;
wire[3:0]fsum;
wire fcout;


//Instantation of Function RCA   
rca gate1(fa,fb,fcin,fsum,fcout);


initial
begin
// Inputs for Function RCA
fa=4'b1010;
fb=4'b1011;
fcin=1'b1;


end

//Display of FOUT
initial
$monitor("OUTPUT OF F RCA  a=%d b=%d cin=%b  sum=%d cout=%b", fa, fb, fcin, fsum, fcout);

 
  endmodule
