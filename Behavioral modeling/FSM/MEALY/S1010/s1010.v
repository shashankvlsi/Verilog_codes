//----------------------------------------------------------DESIGN-----------------------------------------------------------------
module s1010(input clk,rst,x,output reg y);
// INTERNAL SIGNALS
parameter s0=0,s1=1,s2=2,s3=3;
reg [1:0] cs,ns;

always @(posedge clk or negedge rst)
    begin
        if(!rst)
            {y,cs}<=2'b00;
        else
            cs<=ns;
    end 

always @(*)
    begin
        case(cs)
            s0  :   begin
                        if(x==1)
                            begin
                                ns=s1;
                                y=0;
                            end
                         else
                             begin
                                ns=s0;
                                y=0;
                             end
                    end

            s1  :   begin
                        if(x==0)
                            begin
                                ns=s2;
                                y=0;
                            end
                        else
                            begin
                                ns=s1;
                                y=0;
                            end
                    end

            s2  :   begin
                        if(x==1)
                            begin
                                ns=s3;
                                y=0;
                            end
                        else
                            begin
                                ns=s0;
                                y=0;
                            end
                    end

            s3  :   begin
                        if(x==0)
                            begin
                                ns=s2;
                                y=1;
                            end
                        else
                            begin
                                ns=s1;
                                y=0;
                            end
                    end
        endcase
    end


endmodule
 
//----------------------------------------------------------------TB--------------------------------------------------------------
module tb();
reg clk_i,rst_i,x_i;
wire y_o;

s1010 rtl(clk_i,rst_i,x_i,y_o);

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

