module frca(a,b,cin,sum,cout);
input [3:0] a,b;
input cin;
output reg [3:0] sum;
output reg cout;

reg[1:0]result;
reg c;

function reg[1:0]fulladder(input a,b,input cin);
reg sum,carry;
begin
sum=a^b^cin;
carry=(a&b)|(b&cin)|(a&cin);

fulladder={carry,sum};
$display("a=%b b=%b ans=%b",a,b,fulladder);

end
endfunction

always @(*)
begin
result=fulladder(a[0],b[0],cin);
sum[0]=result[0];
c=result[1];

result=fulladder(a[1],b[1],c);
sum[1]=result[0];
c=result[1];

result=fulladder(a[2],b[2],c);
sum[2]=result[0];
c=result[1];

result=fulladder(a[3],b[3],c);
sum[3]=result[0];
cout=result[1];

    end
endmodule



