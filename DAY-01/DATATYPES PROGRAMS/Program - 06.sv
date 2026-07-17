module tb_adc_converter;
  
  real voltage_high = 3.7;
  
  real voltage_low = 3.2;
  
  int adc_val1; 
  
  int adc_val2;
  
  initial begin 
    
    $display("--- ADC Conversion ---");
    
    adc_val1 = voltage_high;
    
    adc_val2 = voltage_low;;
    
    $display("Voltage %f rounded to: %0d", voltage_high, adc_val1);
    
    $display("Voltage %f rounded to: %0d", voltage_low, adc_val2);
    
    $display("--- Simulation Complete ---");
    
  end
  
endmodule


/*
                                                                                                                              OUTPUT: 
                                                                                                                      --- ADC Conversion ---
                                                                                                                  Voltage 3.700000 rounded to: 4
                                                                                                                  Voltage 3.200000 rounded to: 3
                                                                                                                     --- Simulation Complete ---

*/
