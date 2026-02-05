`include"fulladder.v"
module addsub(
                input[3:0]a,b,
                input cin,s,
                output[3:0]sum,
                output cout);
wire w1,w2,w3;
wire [3:0]m;

    xor x1(m[0],b[0],s);
    xor x2(m[1],b[1],s);
    xor x3(m[2],b[2],s);
    xor x4(m[3],b[3],s);
    
    //Instantation

    fulladder1 gate1(a[0],m[0],cin,sum[0],w1);
    fulladder1 gate2(a[1],m[1],w1,sum[1],w2);
    fulladder1 gate3(a[2],m[2],w2,sum[2],w3);
    fulladder1 gate4(a[3],m[3],w3,sum[3],cout);

    endmodule



    module addsub_tb();
    reg[3:0]a,b;
    reg cin,s;
    wire[3:0]sum;
    wire cout;

    addsub gate5(a,b,cin,s,sum,cout);

    initial
    begin
    a=7;b=3;cin=0;s=0;#10;
    a=7;b=3;cin=1;s=0;#10;
    a=7;b=3;cin=1;s=1;#10;

    end

    initial
    $monitor("a=%d b=%d cin=%d s=%d sum=%d cout=%d Time=%0t",a,b,cin,s,sum,cout,$time);
    endmodule



