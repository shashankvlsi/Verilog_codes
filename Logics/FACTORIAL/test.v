module test();
integer a;
integer value;

function integer fac (input integer num);
integer i;
begin
fac=1;
     for(i=1;i<=num;i=i+1)
         begin
         fac=fac*i;
         
             end
end
endfunction

initial
begin
value=5;
a=fac(value);
$display("Factorial_of=[%0D] is=[%0d]",value,a);
value=6;
a=fac(value);
$display("Factorial_of=[%0D] is=[%0d]",value,a);



end

endmodule

