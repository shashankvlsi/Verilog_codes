//DESIGN CODE

module alu #(parameter width=8)(input[(width/2)-1:0]a,b,[$clog2(width)-1:0]opcode,output[width-1:0]y);

assign y=(opcode==0)?a+b:(opcode==1)?a-b:(opcode==2)?a*b:(opcode==3)?a/b:(opcode==4)?a&&b:(opcode==5)?a&b:(opcode==6)?&a:{a,b};

endmodule

//TESTCODE

module alu_tb(y,a,b,opcode);
parameter width=8;
input[width-1:0]y;
output reg[(width/2)-1:0]a,b;
output reg[$clog2(width)-1:0]opcode;
integer x,z;

initial
$value$plusargs("z=%d",z);
initial
repeat(z)
begin
a=$random;b=$random;
for(x=0;x<8;x=x+1)
    begin 
    opcode=x;
    #10;
    end
end

initial
$monitor("a=%b b=%b opcode=%d y=%b Time=%0t",a,b,opcode,y,$time);
endmodule

//TOP CODE

module top();
parameter width=8;
wire[(width/2)-1:0]w1,w2;
wire[$clog2(width)-1:0]w3;
wire[width-1:0]w4;

//INSTANTATION

alu gate1(w1,w2,w3,w4);
alu_tb gate2(w4,w1,w2,w3);

endmodule




