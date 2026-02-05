module pipo(input clk,rst,[3:0]in,output reg[3:0]out);
reg [3:0]temp;

always @(posedge clk or negedge rst)
begin
       if(!rst)
              begin
                    temp<=0;
                    out<=0;
              end
              else
                  begin
                       temp<=in;
                       assign out=temp;
                  end

end

endmodule


module tb();
reg clk,rst;
reg [3:0] in;
wire [3:0]out;

pipo gate(clk,rst,in,out);

initial clk=0;
always #10 clk=~clk;

initial
        begin
            rst=0;
            #5 rst=1;
        end

initial 
in=4'b1011;

initial
$monitor("clk=%0b rst=%0b in=%b  out=%0b Time=%0t",clk,rst,in,out,$time);

initial
#50 $stop;

endmodule

