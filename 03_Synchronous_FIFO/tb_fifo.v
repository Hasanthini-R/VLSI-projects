module tb;
    reg clk, rst, wr_en, rd_en;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire full, empty, almost_full, almost_empty;

    sync_fifo fifo (.*);

    always #5 clk = ~clk;

    initial begin
    clk = 0; rst = 1; wr_en = 0; rd_en = 0; data_in = 0;
    #20 rst = 0;
        
    repeat(8) begin
        @(posedge clk);
        wr_en = 1;
        data_in = data_in + 1;
    end
    wr_en = 0;                     
        
    @(posedge clk);
    wr_en = 1; data_in = 8'hAB;
    wr_en = 0;
        
    repeat(8) begin
        @(posedge clk);
        rd_en = 1;
    end
    rd_en = 0;                  
        
    @(posedge clk);
    rd_en = 1;
    rd_en = 0;

    #100 $finish;
end
    initial $monitor("%0t   count=%d   full=%b   empty=%b   data_out=%h", $time, fifo.count, full, empty, data_out);

    initial begin
        $dumpfile("fifo.vcd");
        $dumpvars(0, tb);
    end
endmodule
