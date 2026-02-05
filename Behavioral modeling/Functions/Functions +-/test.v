module test();
`include"f.v"
reg [32:0]w,x;


initial
begin
w=add(1000,4444);
x=sub(20,4);
end
endmodule

