module uni(input clk,rst,[3:0]in,[1:0]opcode,output reg [3:0]out);
reg [3:0] temp;


always @(posedge clk or negedge rst)
begin
     if(!rst)
         begin
                temp<=0;
                out<=0;
         end
         else
             begin
                 case(opcode)
                  0:out<=out;
                  1:begin
                           temp<={in[0],temp[3:1]};
                           out<=temp[0];
                         
                    end
                  2:begin
                         temp<={temp[2:0],in[0]};
                         out<=temp[3]; 
                    end
                  3:begin
                            temp<=in;
                            out<=temp;
                    end

               endcase

             end

end         
endmodule


module tb();
reg clk,rst;
reg [1:0]opcode;
reg [3:0]in;
wire[3:0]out;

uni gate(clk,rst,in,opcode,out);

initial clk=0;
always #10 clk=~clk;

initial 
begin
        rst=0;
        #15 rst=1;
end

initial
begin
    wait(rst==1);
    /*
    in=$random; opcode=3;
    @(negedge clk);
    in=$random;
    @(negedge clk);
    in=$random;
    @(negedge clk);
    in=$random;
    @(negedge clk);
*/

        in=0;
        in[0]=1;
        opcode=2; #20;
        in[0]=1; #20;
        in[0]=0; #20;
        in[0]=1;
        #40;
     // opcode=1;in=7;#20;
      //opcode=0;in=3;#20;
      //opcode=3;
     // in=11;
      
end

initial
$monitor("clk=%b opcode=%d in=%0b out=%0b",clk,opcode,in,out);

initial
#200 $stop;

endmodule
