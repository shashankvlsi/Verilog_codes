//Snippet 1
module test1;
  reg [4:0] x;

  initial begin : BLOCK_1
    disable BLOCK_1;
    x = 4'b1010;     // 10 in decimal
    $display("x = %d", x);// at 0th time = 10

    x = x + 1;
    $display("x after increment = %d", x);// at time 0th = 10+1=11

    #5 x = x * 2;
    $display("x after delay = %d", x); //at time 5ns x=11*2=22
  end
endmodule

//Snippet 2

module test2;
  reg [7:0] a;

  initial begin : BLOCK_2
    disable BLOCK_2;
    a = 8'd20;
    $strobe("At time %0t, a = %d", $time, a);//at time 0ns => a=20

    #10 a = a + 5;
    $strobe("At time %0t, a = %d", $time, a);//at time 10ns => a=a+5 => a=25

    #10 a = a - 3;
    $strobe("At time %0t, a = %d", $time, a); // at time 10ns => a=a-3 => a=25-3=22 
  end
endmodule

//Snippet 3
module test3;
  reg [3:0] a, b;

  initial begin : BLOCK_3
    disable BLOCK_3;
    a = 3; b = 2;
    $display("Time=%0t -> a=%d, b=%d", $time, a, b);// at time 0ns => a=3 b=2

    #5 a = a + b;
    $display("Time=%0t -> a=%d, b=%d", $time, a, b);//At time after 5ns => a=a+b => a=3+2=5 b=2

    #5 b = a * b;
    $display("Time=%0t -> a=%d, b=%d", $time, a, b); //At time 10ns => b=a*b => b=5*2=10 a=5

    #5 a = a - b;
    $display("Time=%0t -> a=%d, b=%d", $time, a, b); //At time 5ns => a=a-b => a=5-10=-5(in 2's compliment = 11) b=10
  end
endmodule

//Snippet 4
module test4;
  reg [7:0] count;

  initial begin : BLOCK_4
    disable BLOCK_4;
    count = 0; // at time 0ns => count=0
    $monitor("Time=%0t, count=%d", $time, count);

    #2 count = count + 1; //at time 2ns => count=0 +1 = 1
    #3 count = count + 2; //at time 3ns => count = 1+2= 3 //at time 4ns count = 3
    #5 count = count + 3; //at time 5ns => count = 3 + 3 = 6 // at time 6ns count = 6
    #7 count = count + 4; //at time 7ns => count = 6 + 4 = 10
  end
endmodule


//Snippet 5
module test5;
  reg [7:0] a, b;

  initial begin
    a = 5; b = 10;
    $display("T=%0t -> a=%d, b=%d", $time, a, b); // at time 0ns => a=5 b=10

    #5 a <= a + b;    // non-blocking // at time after 5ns  a= 5 + 10 = 15
       b <= b - 2;                                         // b= 10 - 2 = 8

    #0 $display("T=%0t -> a=%d, b=%d", $time, a, b); // at time #0 means in INACTIVE REGION At 5NS  a= 15 b= 8

    #5 a = a * 2;     // blocking // At time after 5ns means 10ns => a=15*2=30 b=8+30=38
       b <= b + a;

    #0 $strobe("T=%0t -> a=%d, b=%d", $time, a, b); // a=30 b=38
  end
endmodule

