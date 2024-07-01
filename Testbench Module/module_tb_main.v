module tb_main;

    // Define parameters
    parameter CLK_PERIOD = 10;  // Clock period in ns

    // Declare signals for testbench
    reg clk = 0;                // Clock signal
    reg reset = 0;              // Reset signal
    reg [1:0] ir_sensor_data;   // Input from sensors
    wire  pwm_signal_left; // Output PWM signals
    wire  pwm_signal_right;
    wire [7:0] control_signal_left; // Output control signals
    wire [7:0] control_signal_right;
  // Clock generation
     // Instantiate the main module
      always #(CLK_PERIOD / 2) clk = ~clk; // Toggle clock every half period
     // Instantiate the main module
    main dut (
        .clk(clk),
        .reset(reset),
        .ir_sensor_data(ir_sensor_data),
        .pwm_signal_left(pwm_signal_left),
        .pwm_signal_right(pwm_signal_right),
         .control_signal_left(control_signal_left),
        .control_signal_right(control_signal_right)
    );

    initial begin
        // Initialize inputs such as clk to 0 to prevent synchronisation problem while simulation no role in the hardware
        clk = 0;
        reset = 1;
        ir_sensor_data = 2'b11; // Both sensors on line initially

        // Release reset after some time
        #20 reset = 0;

        // Simulate sensor data changes
        #100 ir_sensor_data = 2'b01; // Left sensor on line
        #100 ir_sensor_data = 2'b10; // Right sensor on line
        #100 ir_sensor_data = 2'b11; // Both sensors on line
        #100 ir_sensor_data = 2'b00; // No sensors on line (lost)

        // End simulation
        #200 $stop;
    end

    // Monitor the signals
    initial begin
      #100; // Introduce a delay of 1 time unit before printing
        $display("Time: %0d  IR Sensor Data: %b  Control Left: %d  Control Right: %d", 
                 $time, ir_sensor_data, control_signal_left, control_signal_right);
                 #100; // Introduce a delay of 100 time unit before printing
        $display("Time: %0d  IR Sensor Data: %b  Control Left: %d  Control Right: %d", 
                 $time, ir_sensor_data, control_signal_left, control_signal_right);
                 #100; // Introduce a delay of 100 time unit before printing
        $display("Time: %0d  IR Sensor Data: %b  Control Left: %d  Control Right: %d", 
                 $time, ir_sensor_data, control_signal_left, control_signal_right);
                 #100; // Introduce a delay of 100 time unit before printing
        $display("Time: %0d  IR Sensor Data: %b  Control Left: %d  Control Right: %d", 
                 $time, ir_sensor_data, control_signal_left, control_signal_right);
                 #100; // Introduce a delay of 100 time unit before printing
        $display("Time: %0d  IR Sensor Data: %b  Control Left: %d  Control Right: %d", 
                 $time, ir_sensor_data, control_signal_left, control_signal_right);
                 #100; // Introduce a delay of 100 time unit before printing
        $display("Time: %0d  IR Sensor Data: %b  Control Left: %d  Control Right: %d", 
                 $time, ir_sensor_data, control_signal_left, control_signal_right);
                 #100; // Introduce a delay of 100 time unit before printing
        $display("Time: %0d  IR Sensor Data: %b  Control Left: %d  Control Right: %d", 
                 $time, ir_sensor_data, control_signal_left, control_signal_right);
                 #100; // Introduce a delay of 100 time unit before printing
        $display("Time: %0d  IR Sensor Data: %b  Control Left: %d  Control Right: %d", 
                 $time, ir_sensor_data, control_signal_left, control_signal_right);
                 #100; // Introduce a delay of 100 time unit before printing
        $display("Time: %0d  IR Sensor Data: %b  Control Left: %d  Control Right: %d", 
                 $time, ir_sensor_data, control_signal_left, control_signal_right);
                 #100; // Introduce a delay of 100 time unit before printing
        $display("Time: %0d  IR Sensor Data: %b  Control Left: %d  Control Right: %d", 
                 $time, ir_sensor_data, control_signal_left, control_signal_right);
                 #100; // Introduce a delay of 100 time unit before printing
        $display("Time: %0d  IR Sensor Data: %b  Control Left: %d  Control Right: %d", 
                 $time, ir_sensor_data, control_signal_left, control_signal_right);
    end

endmodule