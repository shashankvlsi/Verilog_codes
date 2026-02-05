module adddec(
                input[31:0]y,
                output[3:0]slave);

and a1(slave[0],~y[18],~y[17],y[16]);
and a2(slave[1],~y[18],y[17],~y[16]);
and a3(slave[2],~y[18],y[17],y[16]);
and a4(slave[3],y[18],~y[17],~y[16]);

endmodule


module adddec_tb();
reg [31:0]y;
wire[3:0]slave;

adddec gate(y,slave);

initial
begin
        y[31:0]=0;y[18:16]=1;#10;
        y[31:0]=0;y[18:16]=2;#10;
        y[31:0]=0;y[18:16]=3;#10;
        y[31:0]=0;y[18:16]=4;#10;

        end

 initial
        $monitor("y=%b slave=%B  Time=%0t",y,slave,$time);
        endmodule






