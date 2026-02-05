`include"s101.v"

module tb();
reg clk_i,rst_i,x_i;
wire y_o;

s101 rtl(clk_i,rst_i,x_i,y_o);

initial clk_i=0;
always #5 clk_i=~clk_i;

initial
    begin
        rst_i=0;
        #20;
        rst_i=1;
    end

initial
    begin
        x_i=0;#30;
        repeat(30)
        #10 x_i=$random;
    end
initial
    $monitor("clk=%b rst=%b x=%b y=%b Time=%0t",clk_i,rst_i,x_i,y_o,$time);

endmodule

