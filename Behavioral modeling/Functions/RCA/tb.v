`include"frca.v"
`include"nrca.v"
module tb();
reg [3:0]fa,fb;
reg fcin;
wire[3:0]fsum;
wire fcout;

reg [3:0]na,nb;
reg ncin;
wire[3:0]nsum;
wire ncout;

//Instantation of Function RCA   
frca gate1(fa,fb,fcin,fsum,fcout);

//Instantation of Normal RCA
nrca gate2(na,nb,ncin,nsum,ncout);

initial
begin
// Inputs for Function RCA
fa=4'b1010;
fb=4'b1011;
fcin=1'b1;

//Inputs for Normal RCA
na=4'b1010;
nb=4'b1011;
ncin=1'b1;

end

//Display of FOUT
initial
$monitor("OUTPUT OF FUNCTION RCA  a=%b b=%b cin=%b  sum=%b cout=%b", fa, fb, fcin, fsum, fcout);

//Display of Nout
initial
begin
#10;
$monitor("OUTPUT OF NORMAL RCA    a=%b b=%b cin=%b  sum=%b cout=%b", na, nb, ncin, nsum, ncout);
end

initial
begin
#50;
if(fsum==nsum && fcout==ncout)
    $display("--------------------RCA IS VALID----------------------");
    else
    $display("--------------------RCA IS INVALID--------------------");
end
 
  endmodule
