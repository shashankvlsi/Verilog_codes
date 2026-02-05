//---------------------------------------------------------BUS-BOOKING-FSM------------------------------------------------------------------------------------------------------------------------DESIGN--------------------------------------------------------------
module bus(input clk,rst,x,output reg y);

parameter ideal=0,open=1,location=2,filters=3,selbus=4,selseat=5,sandd=6,coupen=7,payment=8,done=9;

reg[3:0] cs ,ns;

always @(posedge clk or negedge rst)
    begin
        if(!rst)
            begin
                cs<=0;
                y<=0;
            end
        else
            cs<=ns;
    end

always @(*)
    begin
        y<=0;
        case(cs)
                ideal   :   if(x==1)
                                begin
                                    ns<=open;
                                    //y=0;
                                end
                            else
                                begin
                                    ns<=ideal;
                                    //y=0;
                                end

                open   :   if(x==1)
                                begin
                                    ns<=location;
                                    //y=0;
                                end
                            else
                                begin
                                    ns<=ideal;
                                  //  y=0;
                                end

               location   :   if(x==1)
                                begin
                                    ns<=filters;
                                    y=0;
                                end
                              else
                                begin
                                    ns<=ideal;
                                  //  y=0;
                                end 

                filters   :   if(x==1)
                                begin
                                    ns<=selbus;
                                  //  y=0;
                                end
                              else
                                begin
                                    ns<=filters;
                                   // y=0;
                                end

                  selbus   :   if(x==1)
                                begin
                                    ns<=selseat;
                                   // y=0;
                                end
                              else
                                begin
                                    ns<=selbus;
                                   // y=0;
                                end 

                      selseat  :   if(x==1)
                                begin
                                    ns<=sandd;
                                  //  y=0;
                                end
                            else
                                begin
                                    ns<=selbus;
                                  //  y=0;
                                end

                       sandd   :   if(x==1)
                                begin
                                    ns<=coupen;
                                  //  y=0;
                                end
                                    else
                                begin
                                    ns<=sandd;
                                  //  y=0;
                                end 
                                
                       coupen   :   if(x==1)
                                begin
                                    ns<=payment;
                                  //  y=0;
                                end
                            else
                                begin
                                    ns<=coupen;
                                   // y=0;
                                end

                       payment   :   if(x==1)
                                begin
                                    ns<=done;
                                end
                            else
                                begin
                                    ns<=payment;
                                end

                        done   :   begin
                                        ns<=done;
                                        y<=1;
                                   end

                        default :  begin
                                    ns<=ideal;
                                    y<=0;
                                   end

        endcase
    end
endmodule

//-------------------------------------------------------------TB-----------------------------------------------------------------

module tb();
 reg clk_i,rst_i,x_i;
 wire y_o;
 integer out;

bus rtl(clk_i,rst_i,x_i,y_o);

initial clk_i=0;
always #5 clk_i=~clk_i;

initial
    begin
        rst_i=0;#20;
        rst_i=1;
    end

initial
    begin
        x_i=0;#30;
        repeat(30)
            begin
                x_i=1;#10;
            end
    end 

initial
    begin
        out=$fopen("out.txt");
        
        $fmonitor(out,"clk=%b rst=%b x=%b y=%b Time=%0t",clk_i,rst_i,x_i,y_o,$time);
          end

/*
initial
    begin
        x_i=0;#30;
        x_i=1;#10;
        x_i=1;#10;
        x_i=0;#10;
        x_i=1;#10;
        x_i=1;#10;
        x_i=0;#10;
        x_i=1;#10;
        x_i=1;#10;
        x_i=1;#10;
        x_i=1;#10;
        x_i=1;#10;
        x_i=1;#10;
        x_i=1;#10;
        x_i=1;#10;
        x_i=1;#10;
     end   */
/*always @(y_o)
if(y_o==1)
$display("Ticket Booked Successfully"); */


always @(rtl.cs)
begin
  case (rtl.cs)
    0: $fdisplay(out,"---------Open App");
    1: $fdisplay(out,"---------- Bus Portal Opened");
    2: $fdisplay(out,"---------- Select Current Location");
    3: begin
            $fdisplay(out,"-------------Location Selected");

            $fdisplay(out," --------Applying Filters......");
       end
    4: begin
            $fdisplay(out,"-------------Filteres Applied");
            $fdisplay(out,"---------- Select Bus.....");
       end
    5: $fdisplay(out,"------------ Select Seats");
    6: $fdisplay(out,"----------- Select Source & Destination");
    7: $fdisplay(out,"------------ Applying Coupon");
    8: begin
        $fdisplay(out,"----------Coupen Applied");
        $fdisplay(out,"---------- Making Payment.....");
       end
    9: begin
        $fdisplay(out,"-------------Payment Done");
        $fdisplay(out,"--------------Booking Completed...");
        $fdisplay(out,"....Tickets are sent to your registered Email....");
       end
  endcase
end


initial
    $monitor("clk=%b rst=%b x=%b y=%b Time=%0t",clk_i,rst_i,x_i,y_o,$time);
    
initial
wait(y_o==1)
$stop;

endmodule
