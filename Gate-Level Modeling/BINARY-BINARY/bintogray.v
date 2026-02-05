module bintogray(input [3:0]b,output[3:0]g);
buf b1(g[3],b[3]);
xor x1(g[2],b[3],b[2]);
xor x2(g[1],b[2],b[1]);
xor x3(g[0],b[1],b[0]);

endmodule

module bintogray_tb();
reg [3:0]b;
wire [3:0]g;
bintogray gate(b,g);

initial
repeat(4)
begin
b=$urandom_range(0,15);#10;
end

initial
$monitor("b=%B  g=%B Tume=%0t",b,g,$time);
endmodule
