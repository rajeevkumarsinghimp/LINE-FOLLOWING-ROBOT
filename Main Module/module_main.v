module main (
    input wire clk,
    input wire reset,
    input wire [1:0] ir_sensor_data,
    output wire  pwm_signal_left,
    output wire  pwm_signal_right,
    output wire [7:0] control_signal_left,
    output wire [7:0] control_signal_right
);

    
    wire [1:0] position;

    // Instantiate IR sensor part
    ir_sensor_part ir_sensor (
        .clk(clk),
        .reset(reset),
        .ir_sensor_data(ir_sensor_data),
        .position(position)
    );

    // Instantiate line following logic
    line_following_logic line_following (
        .clk(clk),
        .reset(reset),
        .ir_sensor_data(ir_sensor_data),
        .position(position),
        .control_signal_left(control_signal_left),
        .control_signal_right(control_signal_right)
    );

    // Instantiate the PWM generators for both motors
    pwm_generator pwm_left (
        .clk(clk),
        .reset(reset),
        .control_signal(control_signal_left),
        .pwm_signal(pwm_signal_left)
    );

    pwm_generator pwm_right (
        .clk(clk),
        .reset(reset),
        .control_signal(control_signal_right),
        .pwm_signal(pwm_signal_right)
    );

endmodule