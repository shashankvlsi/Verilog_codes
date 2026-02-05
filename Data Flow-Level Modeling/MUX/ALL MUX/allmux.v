//Design code
module allmux #(parameter in=2)(input [in-1:0]i,[$clog2(in)-1:0]sel,output y);
assign y=i[sel];
endmodule


//TB code
module allmux_tb #(parameter in=2)(input  y,output reg[in-1:0]i,[$clog2(in)-1:0]sel);
integer x;

initial
//repeat(3)
begin
 i=$random;
for(x=0;x<in;x=x+1)
    begin
    sel=x;
    #10;
    end
    end
initial
$monitor("i=%b sel=%d y=%b",i,sel,y);
endmodule

//Top code
module top();
parameter p=16;
wire [p-1:0]w1;
wire [$clog2(p)-1:0]w2;
wire w3;

allmux #(.in(p)) gate1(w1,w2,w3);
//defparam gate1.in=p;
allmux_tb #(.in(p)) gate2(w3,w1,w2);
//defparam gate2.in=p;


endmodule

