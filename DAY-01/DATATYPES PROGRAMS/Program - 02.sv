typedef enum bit [1:0] {
  RED = 0, 
  YELLOW = 1, 
  GREEN = 2
} light_state_e;

module tb_traffic_light;
  
  light_state_e current_state;
    
  initial begin 
    
    $display("--- Traffic Light Controller -- ");
    
    current_state = "RED";
    
    $display("Initial State = %s", current_state.name());
    
    current_state = current_state.next();
    
    $display("Next State = %s", current_state.name());
    
    current_state = current_state.next();
    
    $display("Next State = %s", current_state.name());
    
    current_state = current_state.next();
    
    $display("Next State = %s", current_state.name());
    
    //enum.next(N): Returns the 'N'th next value in the enumeration. If N is omitted, it defaults to 1. If it hits the end, it loops back to the start.
    //enum.prev(N): Returns the 'N'th previous value. If called on the first element, it wraps around backwards to the very last element.
    
    //If you call the .next() method on the very last element of an enumerated type, the compiler and simulator will not throw an error, and they will not issue a warning.

//Instead, SystemVerilog handles enum traversal as a naturally circular linked list. It will smoothly wrap around and return the very first element (the initial state) of the enumeration.
        
    $display("--- Simulation Complete --- ");
    
    #50;
    
    $finish;
    
  end
  
endmodule
  
