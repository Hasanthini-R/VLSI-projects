module alu (
    input  [7:0] a, b,
    input  [2:0] op,     
    output reg [7:0] result,
    output reg zero,
    output reg overflow
);
    always @(*) begin
        case (op)
            3'b000: {overflow,result} = a + b;        
            3'b001: {overflow,result} = a - b;        
            3'b010: result = a & b;                  
            3'b011: result = a | b;                   
            3'b100: result = a ^ b;                   
            3'b101: result = a << b[2:0];             
            3'b110: result = a >> b[2:0];             
            3'b111: result = ($signed(a) < $signed(b)) ? 8'd1 : 8'd0; 
            default: result = 8'd0;
        endcase
        zero = (result == 0);
        overflow = ((op == 3'b000) || (op == 3'b001)) && 
           (a[7] == b[7]) && (result[7] != a[7]);
    end
endmodule
