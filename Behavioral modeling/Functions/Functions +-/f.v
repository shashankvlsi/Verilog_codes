function reg[32:0] add(input [16:0]a,b);
begin
add=a+b;
$display("a=%0d b=%0d addition=%0d",a,b,add);
end
endfunction

function reg[31:0] sub (input [15:0]a,b);
   begin
   sub=a-b;
   $display("a=%0d b=%0d subtraction=%0d",a,b,sub);
   end
   endfunction

