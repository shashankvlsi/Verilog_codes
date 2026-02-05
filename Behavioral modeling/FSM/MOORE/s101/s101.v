module s101(input clk,rst,x,output y);

parameter s0=0,s1=1,s2=2,s3=3;
reg[1:0]cs,ns;

assign y=(cs==s3)?1:0;


always @(posedge clk or negedge rst)
    begin
        if(!rst)
            cs<=0;
        else
            cs<=ns;
    end

always @(*)
    begin
                  case(cs)
            s0  :   if(x==1)
                        ns<=s1;
                    else
                        ns<=s0;

            s1  :   if(x==0)
                        ns<=s2;
                    else
                        ns<=s1;

            s2  :   if(x==1)
                        ns<=s3;
                    else
                        ns<=s0;

            s3  :   if(x==1)
                        ns<=s1;
                    else
                        ns<=s2;
                
         endcase
    end

endmodule


module tb();
reg clk_i,rst_i,x_i;
wire y_o;

s101 rtl(clk_i,rst_i,x_i,y_o);

initial clk_i=1;
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
        repeat(20)
            begin
                x_i=$random;
                #10;
            end
    end

initial
        $monitor("clk=%b rst=%b x=%b y=%b Time=%0t",clk_i,rst_i,x_i,y_o,$time);

endmodule
