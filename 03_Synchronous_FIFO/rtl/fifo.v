// Synchronous FIFO (8 x 8-bit)
module sync_fifo (
    input clk, rst,
    input wr_en,          // write enable
    input rd_en,          // read enable
    input [7:0] data_in,
    output reg [7:0] data_out,
    output full,
    output empty,
    output almost_full,
    output almost_empty);

    reg [7:0] mem [0:7];          
    reg [2:0] wr_ptr, rd_ptr;    
    reg [3:0] count;            
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
            count  <= 0;
        end 
      else begin
            if (wr_en && !full) begin
                mem[wr_ptr] <= data_in;
                wr_ptr <= wr_ptr + 1;
            end
            if (rd_en && !empty) begin
                data_out <= mem[rd_ptr];
                rd_ptr <= rd_ptr + 1;
            end

        
            case ({wr_en && !full, rd_en && !empty})
                2'b10: count <= count + 1;  
                2'b01: count <= count - 1; 
                2'b11: count <= count;      
                default: count <= count;
            endcase
        end
    end

    assign empty        = (count == 0);    // empty = (wr_ptr == rd_ptr); this is the pointer method without count 
    assign full         = (count == 8);    // full  = (wr_ptr[2:0] == rd_ptr[2:0]) && (wr_ptr[3] != rd_ptr[3]); 
    assign almost_empty = (count <= 1);
    assign almost_full  = (count >= 7);

  

endmodule
