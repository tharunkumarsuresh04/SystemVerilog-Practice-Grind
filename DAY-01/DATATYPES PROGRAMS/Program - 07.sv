module tb_state_test;
  
  logic val_4state; 
  
  bit val_2state;
  
  initial begin 
    
    $display("--- State Fidelity Check ---");
    
    val_4state = 1'bx;
    
    val_2state = 1'bx;
    
    $display("4 state Logic Value = %b", val_4state);
    
    $display("2 state Bit Value = %b", val_2state);
    
    $display("--- Simulation Complete ---");
    
  end
  
endmodule

/*
								     OUTPUT: 
							--- State Fidelity Check ---
							  4 state Logic Value = x
							  2 state Bit Value = 0
							--- Simulation Complete ---

*/
