module tb( 
           output reg [7:0]I,
           output reg [2:0]S,
           input Y
         );
reg a;

task gen();
    begin
        I=$urandom;
        S=$urandom;
    end
endtask

task bfm();
    begin
        a=I[S];
    end
endtask

task sb();
    begin
        if(a==Y)
            begin
                $display("display==it is good");
                $info("good");
                $error("matched");
                $warning("Finished");
                $fatal("fatal");
            end
    end
endtask

initial
repeat(2)
begin
gen();
bfm();#1;
sb();
end

endmodule
