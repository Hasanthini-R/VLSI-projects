module tb;
    reg clk, rst;
    wire red, yellow, green;
    traffic_light dut (.clk(clk), .rst(rst), .red(red), .yellow(yellow), .green(green));

    always #5 clk = ~clk;
    initial begin
      clk = 0; 
      rst = 1; #17 
      rst = 0; #1000 
      $finish;
    end
    initial begin 
      $dumpfile("traffic.vcd"); 
      $dumpvars(0,tb); 
    end
    initial 
      $monitor("%0t state=%0d R=%b Y=%b G=%b", $time, dut.state, red, yellow, green);
endmodule
