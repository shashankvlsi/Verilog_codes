`include"dut.v"
`include"tb.v"
module top();

wire[7:0]w_i;
wire [2:0]w_s;
wire w_y;

dut rtl1(.i(w_i),
         .s(w_s),
         .y(w_y)
       );

tb rtl2(.I(w_i),
        .S(w_s),
        .Y(w_y)
       );

endmodule
