`include"2to1mux1.v"
module _2to1mux2(a,b,s,y);
input[3:0] a,b;
input s;
output [3:0]y;

_2to1mux1 gate1(a[0],b[0],s,y[0]);
_2to1mux1 gate2(a[1],b[1],s,y[1]);
_2to1mux1 gate3(a[2],b[2],s,y[2]);
_2to1mux1 gate4(a[3],b[3],s,y[3]);

endmodule


module _2to1mux2_tb();
reg[3:0] a,b;
reg s;
wire [3:0] y;

_2to1mux2 gate5(a,b,s,y);
initial
repeat(6)
begin
a=$random % 16;b=$random % 16;s=$random % 2;#10;
end
initial
$monitor("a=%d b=%d s=%d y=%d Time=%T",a,b,s,y,$time);
endmodule



