module regions_extreme2;
  reg a, b, c;

  initial begin
    a = 0; b = 0; c = 0;

    // Blocking + NBAs
    a = 1;        // blocking
    b <= 1;       // nonblocking
    c <= 1;       // nonblocking
    $display("T=%0t : Display -> a=%b b=%b c=%b", $time, a, b, c);
    //$display("T=%0t : Display -> a=%b b=%b c=%b", $time, a, b, c);

    // #0 delays to create tricky ordering
    #0 a = 0;     
    #0 b = 0;     
   // $display("T=%0t : Display -> a=%b b=%b c=%b", $time, a, b, c);
    #0 $display("T=%0t : Display -> a=%b b=%b c=%b", $time, a, b, c);


    // More NBAs
    a <= 0;
    b <= 1;
    c <= 0;

    // Another #0
    #0 c = 1;

    // Print statements
   /* $display("T=%0t : Display -> a=%b b=%b c=%b", $time, a, b, c);
    $strobe ("T=%0t : Strobe  -> a=%b b=%b c=%b", $time, a, b, c);
    $monitor("T=%0t : Monitor -> a=%b b=%b c=%b", $time, a, b, c);*/
  end
endmodule



