module dut(
           input [7:0]i,
           input[2:0]s,
           output y
           );

assign y=(s==0)?i[0]:(s==1)?i[1]:(s==2)?i[2]:(s==3)?i[3]:(s==4)?i[4]:(s==5)?i[5]:(s==6)?i[6]:i[7];

endmodule


