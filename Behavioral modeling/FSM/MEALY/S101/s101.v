module s101 (input clk,rst,x,output reg y);

parameter s0=0,s1=1,s2=2;
reg[1:0] cs,ns;

always @(posedge clk or negedge rst)
    begin
        if(!rst)
            {y,cs}=2'b00;
        else
            cs<=ns;
    end

always@(posedge clk)
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
                                ns=s1; // overlapping
                              //ns=s0; //non-overlapping
                                y=1;
                            end
                        else
                            begin
                                ns=s0;
                                y=0;
                            end
                    end
        endcase           
    end
endmodule
