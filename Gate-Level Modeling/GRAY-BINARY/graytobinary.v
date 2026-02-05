module graytobinary(input[3:0]g,output[3:0]b);

buf bi(b[3],g[3]);
xor x1(b[2],b[3],g[2]);
xor x2(b[1],b[2],g[1]);
xor x3(b[0],b[1],g[0]);

endmodule


module graytobinary_tb();
reg[3:0] g;
wire[3:0]b;

graytobinary gate(g,b);

initial
repeat(4)
begin


g=$random;#10;
end

initial
$monitor("g=%b  b=%B  Time=%0t",g,b,$time);
endmodule

