module piso #(parameter WIDTH=10)(input clk, rst,[WIDTH-1:0]in,mode,output reg out);
reg [WIDTH-1:0]temp;

always@(posedge clk or negedge rst)
begin
        if(!rst)
               begin
                    temp<=0;  
                    out<=0;
               end
           
            else
                begin
                if(mode)
                    temp<=in;
                    else
                        begin
                              out<=temp[0];
                              temp<={1'b0,temp[WIDTH-1:1]};
                                /*
                              temp[0]<=temp[1];
                              temp[1]<=temp[2];
                              temp[2]<=temp[3];
                              */
                        end
                 end       
end
endmodule


module tb();
reg clk,rst;
reg [3:0] in;
reg mode;
wire out;

piso gate(clk,rst,in,mode,out);

initial clk=0;
always #10 clk=~clk;

initial
        begin
            rst=0;
            #5 rst=1;
        end

initial begin
            mode=1;
            #20 mode=0;
        end

initial 
     begin
wait(rst==1);
in=4'b1011;
end

initial
$monitor("clk=%0b rst=%0b in=%b mode=%0b out=%0b Time=%0t",clk,rst,in,mode,out,$time);

initial
#150 $stop;

endmodule
