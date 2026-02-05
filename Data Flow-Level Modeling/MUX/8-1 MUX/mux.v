module mux(input[7:0]i,[2:0]s,output y);

assign y=i[s];

endmodule



module mux_tb();
reg [7:0]i;
reg[2:0]s;
wire y;

mux gate(i,s,y);
initial
 repeat(7)
 begin
 i=$random;s=$random;#10;
 end

 initial
 $monitor("i=%b  s=%b y=%b Time=%0t",i,s,y,$time);
 endmodule

