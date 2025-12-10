module traffic_light (
    input clk, rst,
    output reg red, yellow, green
);
    reg [3:0] timer;
    reg [1:0] state;
    localparam RED = 0, GREEN = 1, YELLOW = 2;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= RED; timer <= 0;
            red <= 1; yellow <= 0; green <= 0;
        end else begin
            timer <= timer + 1;
            case (state)
                RED:    if (timer == 9)  begin state <= GREEN;  timer <= 0; end
                GREEN:  if (timer == 9)  begin state <= YELLOW; timer <= 0; end
                YELLOW: if (timer == 3)  begin state <= RED;    timer <= 0; end
                default:                 begin state <= RED;    timer <= 0; end
            endcase
        end
    end

    always @(*) begin
        {red, yellow, green} = (state == RED)    ? 3'b100 :
                               (state == GREEN)  ? 3'b001 :
                               (state == YELLOW) ? 3'b010 : 3'b100;
    end
endmodule
