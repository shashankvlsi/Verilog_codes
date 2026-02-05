module mux(input i0,i1,s,output y);

assign y=s?i1:i0;
endmodule

module mux_tb();
reg i0,i1,s;
wire y;
 mux gate(i0,i1,s,y);

 initial
 repeat(7)
 begin
 i0=0;i1=1;s=$random;#10;
 end

 initial
 $monitor("i0=%b i1=%b s=%b y=%b Time=%0t",i0,i1,s,y,$time);
 endmodule


