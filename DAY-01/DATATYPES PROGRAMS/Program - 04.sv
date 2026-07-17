module tb_time_tracker;
  
  time int_time;
  
  realtime float_time;
  
  initial begin 
    
    $display("--- Time Tracking ---");
    
    #2.5;
    
    int_time  = $time; 
    
    float_time = $realtime; 
    
    $display("Integer time = %0d ns", int_time);

    $display("Float time = %0.3f ns", float_time);
    
    $display("--- Simulation Complete ---");
    
  end
  
endmodule
/*

                                                                                      --- Time Tracking ---
                                                                                       Integer time = 3 ns
                                                                                       Float time = 2.500 ns
                                                                                      --- Simulation Complete ---

 */                                                                                     
