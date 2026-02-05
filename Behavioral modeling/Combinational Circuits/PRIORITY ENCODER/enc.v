module enc(input [3:0]in,output reg y1,y2);

/*
always @(*)
      begin
          casex(in)
          4'b0001  : {y2,y1}=2'b00;
          4'b001x  : {y2,y1}=2'b01;
          4'b01xx  : {y2,y1}=2'b10;
          4'b1xxx  : {y2,y1}=2'b11;      
          endcase
      end
*/
/*
always @(*)
      begin
          casez(in)
          4'b0001  : {y2,y1}=2'b00;
          4'b001z  : {y2,y1}=2'b01;
          4'b01z?  : {y2,y1}=2'b10;
          4'b1???  : {y2,y1}=2'b11;      
          endcase
      end

*/
/*
always @(*)
      begin
          casex(in)
          4'b0001  : {y2,y1}=2'b00;
          4'b001z  : {y2,y1}=2'b01;
          4'b01z?  : {y2,y1}=2'b10;
          4'b1x??  : {y2,y1}=2'b11;      
          endcase
      end

endmodule
*/
always @(*)
      begin
          case(1)
                   in[3] : {y2,y1}=2'b11;
                   in[2] : {y2,y1}=2'b10;
                   in[1] : {y2,y1}=2'b01;
                   in[0] : {y2,y1}=2'b00;      
              endcase
      end

endmodule


module tb();
reg [3:0]in;
wire y1,y2;

enc rtl(in,y1,y2);

initial
repeat(10)
begin
      in=$random;#10;
    
end

initial
$monitor("in=%b y2=%b y1=%b Time=%0t",in,y2,y1,$time);

initial
#200 $stop;

endmodule
