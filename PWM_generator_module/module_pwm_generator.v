module pwm_generator (input wire clk,
    input wire reset,
    input wire [7:0] control_signal,
    output reg pwm_signal);
    localparam PWM_Period=255;
    reg [0:7] pwm_counter=0;
    always@(posedge clk or posedge reset)
    if (reset) begin
    pwm_counter<=0;
    pwm_signal<=0;
    end
    else begin
    pwm_counter<= pwm_counter +1 ;
    if (pwm_counter<control_signal)begin
    pwm_signal<=1;
    end
    else begin
    pwm_signal<=0;
    end
    end
    endmodule