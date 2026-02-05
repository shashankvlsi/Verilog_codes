`include"srl.v"
module srff(input clk,rst,s,r,output Q,Qbar);

srl gate1(~clk,rst,s,r,q,qbar);
srl gate2(clk,rst,q,qbar,Q,Qbar);

endmodule



module tb();
reg clk,rst,s,r;
wire Q,Qbar;

srff gate(clk,rst,s,r,Q,Qbar);

initial clk=0;
always begin
    clk=~clk;
        #10;
    end
initial begin
rst=0; #10;
rst=1;
repeat(10) begin
#7;
s=$random;r=$random;
#10;
end

end
initial
#100 $stop;
    
initial
$monitor("clk=%d s=%d r=%d Q=%d Qbar=%d Time=%0t",clk,s,r,Q,Qbar,$time);
endmodule


