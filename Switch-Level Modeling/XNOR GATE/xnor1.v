module xnor1(input a,b,output y);
// internal signals
wire w1,w2,w3;
supply1 vdd;
supply0 gnd;


	pmos p1(w1,vdd,a);
	pmos p2(w1,vdd,~b);
	pmos p3(y,w1,~a);
	pmos p4(y,w1,b);
	

	nmos n1(y,w2,a);
	nmos n2(w2,gnd,~b);
	nmos n3(y,w3,~a);
	nmos n4(w3,gnd,b);
	
endmodule
