 module fun ();

reg[16:0] A,M,E,C;

 function reg[4:0]adder(input [3:0]a,b,input cin);
 reg [3:0]sum;
 reg carry;
 begin
 //carry=(a&b)|(b&cin)|(a&cin);
 //sum=a^b^cin;
 //adder={sum,carry};
//assign {carry,sum}=a+b+cin;
//carry=adder[4];
//sum=adder[3:0];
 adder=a+b+cin;
 $display("a=%0d b=%0d cin=%0d output=%0d",a,b,cin,adder);
 end
 endfunction

function reg[16:0]mux(input i0,i1,i2,i3,[1:0]s);
 begin
 assign mux=(s==0)?i0:(s==1)?i1:(s==2)?i2:i3;
 $display("i0=%b  i1=%b i2=%b i3=%b s=%b output=%0b",i0,i1,i2,i3,s,mux);
  end
 endfunction

function reg[16:0]encoder(input i0,i1,i2,i3);
 begin
 case({i0,i1,i2,i3})
 4'b0001 : encoder=2'b00;
 4'b0010 : encoder=2'b01;
 4'b0100 : encoder=2'b10;
 4'b1000 : encoder=2'b11;
 endcase
 $display("i0=%d i1=%b i2=%b i3=%b output=%0b",i0,i1,i2,i3,encoder);
  end
 endfunction

function reg[2:0]cmp(input [16:0]a,b);
reg g,e,l;
 begin
 assign {g,e,l}={a>b,a==b,a<b};
 cmp={g,e,l};
 $display("a=%0d b=%0d output=%b",a,b,cmp);
  end
 endfunction
 

 initial
 begin

A=adder(5,15,1);
M=mux(1,0,1,0,2);
E=encoder(1,0,0,0);
C=cmp(33,12);
M=mux(1,1,0,1,2);
A=adder(4,7,0);
E=encoder(0,0,1,0);
C=cmp(33,91);
M=mux(0,0,1,1,0);
M=mux(1,0,0,1,1);
M=mux(1,0,0,0,0);
A=adder(8,19,1);
C=cmp(7,7);
end
endmodule


