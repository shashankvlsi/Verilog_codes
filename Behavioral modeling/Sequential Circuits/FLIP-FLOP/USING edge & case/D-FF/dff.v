module dff(input clk,rst,d,output reg q,output qbar);

assign qbar=~q;

always @(posedge clk)
begin
    if(!rst)
        q<=0;
        else
            begin
            case(d)
            0 : q<=d;
            1 : q<=d;

            endcase
            end
end
endmodule

//TESTBENCH

module tb();
reg clk,rst,d;
wire q,qbar;

dff gate(.clk,.rst,.q,.qbar,.d);


always 
begin
clk=0;#10;
clk=1;#10;
end


initial
begin
rst=0;#10;rst=1;
end

initial
repeat(11)
begin
d=$random;#10;
end

initial
$monitor("clk=%b rst=%b d=%b q=%b qbar=%b Time=%0t",clk,rst,d,q,qbar,$time);

initial
#200 $stop;
endmodule

