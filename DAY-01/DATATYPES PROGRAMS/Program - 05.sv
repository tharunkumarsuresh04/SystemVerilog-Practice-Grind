module tb_signed_cast;
  
  logic [7:0] val_a = 8'hFE; // -2
  
  logic [7:0] val_b = 8'h03; // 3
  
  logic [15:0] result_unsigned;
  
  logic signed [15:0] result_signed;
  
  initial begin 
    
    $display("--- DSP Multiplier Check ---");
    
    result_unsigned = val_a * val_b;
    
    result_signed = $signed(val_a) * $signed(val_b);
    
    $display("Unsigned Result: %0d\n Signed Result: %0d", result_unsigned, result_signed);
    
    $display("--- Simulation Complete ---");
    
  end
  
endmodule

/*
                                                                                      --- DSP Multiplier Check ---
                                                                                         Unsigned Result: 762
                                                                                         Signed Result: -6 
                                                                                      --- Simulation Complete ---
                                                                                      

*/
