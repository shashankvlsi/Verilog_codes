module test();
integer y,s,m,n;

task sub();
#3 s=m-n;
endtask

function integer add(input integer a,b);
begin
sub();
add=a+b;
end
endfunction



initial
begin
m=34;n=23;
//sub();
//$display("sub=%d",s);
y=add(13,34);
$display("add=%d",y);
y=add(46,26);
$display("add=%d",y);
$display("sub=%d",s);


end
endmodule
