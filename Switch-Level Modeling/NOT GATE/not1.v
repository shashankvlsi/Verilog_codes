module not1(input a, output y);
supply1 vdd;
supply0 gnd;

	pmos p(y,vdd,a);
	nmos n(y,gnd,a);
endmodule