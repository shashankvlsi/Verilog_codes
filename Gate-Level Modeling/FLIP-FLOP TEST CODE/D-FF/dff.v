module dff(input d,clk,output q,qbar);
wire w1,w2;

nand n1(w1,d,clk);
nand n2(w2,~d,clk);
nand n3(q,w1,qbar);
nand n4(qbar,w2,q);

endmodule

module dff_tb(); 
reg d,clk;
wire q,qbar;

dff gate(d,clk,q,qbar);

initial begin
   clk=0;
  forever #5 clk=~clk;
  end
  initial begin
  d=0;#10;d=1;#10;
  $finish
  end
  
               
 initial
 $monitor("d=%b clk=%b q=%B qbar=%b Time=%0t",d,clk,q,qbar,$time);
 endmodule

