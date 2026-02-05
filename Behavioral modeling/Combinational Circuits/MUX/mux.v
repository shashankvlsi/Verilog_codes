module mux(input i0,i1,i2,i3,[1:0]s,output reg y);

always @(*)
begin
if(s==0)
    y=i0;
    else if(s==1)
        y=i1;
        else if(s==2)
            y=i2;
            else
                y=i3;
end
endmodule






module tb();
reg i0,i1,i2,i3;
reg [1:0]s;
wire y;
integer x;

mux gate(i0,i1,i2,i3,s,y);

initial
begin
repeat(7)
begin
i0=$random;i1=$random;i2=$random;i3=$random;
for(x=0;x<4;x=x+1)
    begin
    s=x;
    #10;
    end

 end

end

initial
$monitor("i0=%b i1=%b i2=%b i3=%b s=%b y=%b Time=%0t",i0,i1,i2,i3,s,y,$time);

endmodule
