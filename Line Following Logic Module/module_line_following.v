module line_following_logic (
    input wire clk,
    input wire reset,
    input wire [1:0] ir_sensor_data,
    input wire [1:0] position,
    output reg [7:0] control_signal_left,
    output reg [7:0] control_signal_right
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            control_signal_left <= 8'd0;
            control_signal_right <= 8'd0;
        end else begin
            case (position)
                2'b01: begin // Left sensor active(left turn)
                    control_signal_left <= 8'd30;  // Slow down left motor
                    control_signal_right <= 8'd50; // Speed up right motor to turn left
                end
                2'b10: begin // Right sensor active(right turn)
                    control_signal_left <= 8'd50; // Speed up left motor to turn right
                    control_signal_right <= 8'd30;  // Slow down right motor
                end
                2'b11: begin // Both sensors active (straight line)
                    control_signal_left <= 8'd50; // Speed up both motors to move straight 
                    control_signal_right <= 8'd50;
                end
                2'b00: begin // No sensor active lost path (stop)
                    control_signal_left <= 8'd0;
                    control_signal_right <= 8'd0;
                end
                default: begin
                    control_signal_left <= 8'd0;
                    control_signal_right <= 8'd0;
                end
            endcase
        end
    end

endmodule