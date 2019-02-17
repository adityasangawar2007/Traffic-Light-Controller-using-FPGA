module tlc_tb;

reg clk, rst;
wire [1:4] red, yellow, green;

tlc tlc1(red, yellow, green, clk, rst);

initial
begin
    $dumpfile("tlc.vcd");
    $dumpvars(0);
    clk = 1'b0;
    rst = 1'b0;
    forever #5 clk = ~ clk;
end

initial
begin
 //   #10 rst = 1'b0;
    #10 rst = 1'b1;
    #400 rst = 1'b0;
    #10 $finish;
end

endmodule
