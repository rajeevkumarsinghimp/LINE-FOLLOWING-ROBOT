module ir_sensor_part (
    input wire clk,
    input wire reset,
    input wire [1:0] ir_sensor_data,
    output reg [1:0] position
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            position <= 2'b00;
        end else begin
            position <= ir_sensor_data;  // Directly passing the sensor data to position for simplicity
        end
    end

endmodule