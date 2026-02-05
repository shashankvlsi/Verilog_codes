module demux(input y,[2:0]s,output reg i0,i1,i2,i3,i4,i5,i6,i7);

always @(*)
begin
    i0 = 0; i1 = 0; i2 = 0; i3 = 0;
    i4 = 0; i5 = 0; i6 = 0; i7 = 0;
if(s==0)
    i0=y;
    else if(s==1)
        i1=y;
        else if(s==2)
        i2=y;
        else if(s==3)
        i3=y;
        else if(s==4)
        i4=y;
        else if(s==5)
        i5=y;
        else if(s==6)
        i6=y;
        else
            i7=y;
end
endmodule


module tb();
reg y;
reg [2:0]s;
wire i0,i1,i2,i3,i4,i5,i6,i7;
integer x;

demux gate(y,s,i0,i1,i2,i3,i4,i5,i6,i7);

initial
repeat(3)
begin
y=$random;
for(x=0;x<8;x=x+1)
    begin
    s=x;
    #10;
    end

   end

   initial
   $monitor("y=%b s=%b i0=%b i1=%b i2=%b i3=%b i4=%b i5=%b i6=%b i7=%b Time=%0t",y,s,i0,i1,i2,i3,i4,i5,i6,i7,$time);

   endmodule

       
