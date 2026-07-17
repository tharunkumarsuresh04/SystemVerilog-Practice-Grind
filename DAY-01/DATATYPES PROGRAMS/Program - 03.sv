module tb_string_logger;
  
  string prefix_str = "INFO";
  
  string module_name = "UART_TX";
  
  string final_log = "final_log";
  
  int tx_id = 15;
  
  initial begin 
    
    $display("--- Logger Initialization ---");
    
    final_log = $sformatf("[%s] Time = %0t, Module: %s. TX_ID = %0d", prefix_str, $time, module_name, tx_id);
    
    $display("%s", final_log);
    
    $display("--- Simulation Complete ---");
    
  end
  
endmodule

/*
                                                                                --- Logger Initialization ---
                                                                        [INFO] Time = 0, Module: UART_TX. TX_ID = 15
                                                                                --- Simulation Complete ---

*/

