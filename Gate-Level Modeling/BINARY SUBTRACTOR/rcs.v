`include"fulladder.v"
module rcs(
            input[3:0] a,b,
            input cin,
            output [3:0]diff,
            output bout
            );
wire e1,e2,e3;

fulladder1 gate1(a[0],~b[0],cin,diff[0],e1);
fulladder1 gate2(a[1],~b[1],e1,diff[1],e2);
fulladder1 gate3(a[2],~b[2],e2,diff[2],e3);
fulladder1 gate4(a[3],~b[3],e3,diff[3],bout);

endmodule

module rcs_tb();
reg[3:0]a,b;
reg cin;
wire[3:0]diff;
wire bout;

rcs gate5(a,b,cin,diff,bout);

initial
begin
a=7;b=3;cin=1;#10;
end

initial
$monitor("a=%d  b=%d  cin=%d diff=%d  bout=%d  Time=%0d ",a,b,cin,diff,bout,$time);
endmodule

