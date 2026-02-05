module apb(input clk,rst,transfer,pready,pwrite,output reg pselx,penable);

parameter ideal=0,setup=1,access=2;

reg[1:0]cs,ns;

always @(posedge clk or negedge rst)
    begin
        if(!rst)
            begin
                cs<=0;
                pselx<=0;
                penable<=0;
            end
        else
            cs<=ns;
    end

always @(*)
    begin
        case(cs)
            ideal   :   if(transfer==1)
                            begin
                                ns<=setup;
                                pselx<=1;
                                penable<=0;
                            end
                        else
                            begin
                                ns<=ideal;
                                pselx<=0;
                                penable<=0;
                            end

            setup   :   if(transfer==1)
                            begin
                                ns<=access;
                                pselx<=1;
                                penable<=1;
                            end
                        else
                            begin
                                ns<=ideal;
                                pselx<=0;
                                penable<=0;
                            end

            access  :   if(pready==0)
                            begin
                                ns<=access;
                                pselx<=1;
                                penable<=1;
                            end
                        else                      //pready==1
                            begin
                                if(transfer==1)
                                   begin
                                    ns<=setup;
                                    pselx<=1;
                                    penable<=0;
                                   end
                                 else
                                    begin
                                     ns<=ideal;
                                     pselx<=0;
                                     penable<=0;
                                    end
                             end

        endcase          
    end

    endmodule

//----------------------------------------------------------------TB---------------------------------------------------------------
module tb();
 reg clk_i,rst_i,transfer_i,pready_i,pwrite_i;
 wire pselx_o,penable_o;

apb rtl(clk_i,rst_i,transfer_i,pready_i,pwrite_i,pselx_o,penable_o);

initial clk_i=0;
always #5 clk_i=~clk_i;

initial
    begin
        rst_i=0;#20;
        rst_i=1;
    end

initial
    begin
        transfer_i=0;#20;
        transfer_i=1;#10;
        transfer_i=1;#10;
        if(rtl.cs==rtl.access)
            begin
                pwrite_i=1;
                pready_i=0;
            end
       // pwrite_i=0;
      //  transfer_i=1;#30;
        //pready_i=0;#10;
     //  pready_i=1;transfer_i=0;#10;
      //  pready_i=1;transfer_
    end

always @(rtl.cs)
    begin
        case(rtl.cs)
        0:$display("IDEAL");
        1:$display("SETUP");
        2:$display("ACCESS");
        endcase
    end

always @(posedge clk_i)
    begin
        if(rtl.cs==rtl.access && penable_o==1 && pwrite_i==1)
            $display("HI");
        else
            if(rtl.cs==rtl.access && penable_o==1 && pwrite_i==0)
                $display("Bye");
    end

initial
$monitor("clk=%b rst=%b transfer=%b pready=%b pselx=%b penable=%b pwrite=%b Time=%0t",clk_i,rst_i,transfer_i,pready_i,pselx_o,penable_o,pwrite_i,$time);
endmodule
