task automatic calculate_duty_cycle(ref logic clk, output real duty_cycle);
  
  realtime rising_time, setting_time;
  realtime t_high, t_low;
  realtime period;
  //realtime duty_cycle;
  
  $display("Task started");
  
  @(posedge clk);
     rising_time = $realtime;
  //Calculates the time when the signal is low
     t_low = $realtime - setting_time;
  
  @(negedge clk);
  //Calculates the time when the signal is high
     t_high = $realtime - rising_time;
     setting_time = $realtime;
  
  //Calculates the signal period
  period = t_high + t_low;
  //Calculates duty cycle
  duty_cycle = (t_high/period)*100;
  $display("duty cycle is %g", duty_cycle);
  
endtask
