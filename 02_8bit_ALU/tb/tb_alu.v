module tb;
    reg [7:0] a, b;
    reg [2:0] op;
    wire [7:0] result;
    wire zero, overflow;

    alu dut (.a(a),.b(b),.op(op),.result(result),.zero(zero),.overflow(overflow));

    initial begin
        $display("a    b    op    result    zero    overflow");
        $monitor("%d    %d    %b    %d    %b    %b", a, b, op, result, zero, overflow);

        repeat(20) begin
          a = $random; 
          b = $random; 
          op = $random % 8;
            #10;
        end
        #100 
      $finish;
    end

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, tb);
    end
endmodule
