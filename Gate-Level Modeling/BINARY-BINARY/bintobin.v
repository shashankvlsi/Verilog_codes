`include"bintogray.v"
`include"graytobinary.v"
module bintobin(input[3:0]b,output[3:0]y);
wire[3:0]w;
bintogray gate1(b,w);
graytobinary gate2(w,y);

endmodule



module bintobin_tb();
reg [3:0]b;
wire [3:0]y;

bintobin gate3(b,y);

initial
repeat(6)
begin
b=$random;#10;
end

initial
$monitor("b=%b y=%b Time=%0t",b,y,$time);
endmodule

