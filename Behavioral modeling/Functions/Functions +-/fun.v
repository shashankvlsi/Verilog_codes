module fun();
reg [31:0]add,sub,mul,div;
function reg[16:0] addition (input [15:0]a,b);
   begin
   addition=a+b;
   $display("a=%0d b=%0d addition=%0d",a,b,addition);
   end
endfunction

function reg[31:0] subtraction (input [15:0]a,b);
   begin
   subtraction=a-b;
   $display("a=%0d b=%0d subtraction=%0d",a,b,subtraction);
   end
endfunction

function reg[31:0] multiply (input [15:0] a,b);
   begin
   multiply=a*b;
   $display("a=%0d b=%0d multiply=%0d",a,b,multiply);
   end
endfunction

function reg[31:0] division (input  [15:0]a,b);
   begin
   division=a/b;
   $display("a=%0d b=%0d division=%0d",a,b,division);
   end
endfunction

initial
begin
add=addition(356,2790);
sub=subtraction(122,43);
mul=multiply(134,456);
div=division(56,11);
end

endmodule





