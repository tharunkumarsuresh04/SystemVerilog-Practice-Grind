/*

DESIGN SPECIFICATION: Application Crucible 3 (The Traffic Light Controller)
You're modeling an intersection controller. State transitions must be legal and human-readable — this is a textbook case for enum over raw bit vectors.
Target File Name: tb_traffic_light.sv
1. Detailed Class Code Structure
Global Enum: typedef enum bit [1:0] {RED=0, YELLOW=1, GREEN=2} light_state_e;
light_tx (Transaction Class)

Properties:

rand light_state_e current_state;
rand int unsigned duration_sec;


Constraints:

c_duration: If current_state == YELLOW, duration_sec MUST be 3. Else, duration_sec MUST be between 10 and 30.


Methods:

function void display_state(); → Prints state name and duration.



2. Detailed Task Code
Inside module tb_traffic_light, write task run_cycle(input int num_states); — loop, instantiate, randomize+fatal, display.
3. Target Output
# --- Traffic Light Simulation Start ---
# [State 1] Light: GREEN  | Duration: 22 sec
# [State 2] Light: YELLOW | Duration: 3 sec
# [State 3] Light: RED    | Duration: 15 sec
# --- Simulation Complete ---
4. Architect's Skeleton
systemverilog// [Declare typedef enum: light_state_e]
class light_tx;
  // [Declare rand: current_state]
  // [Declare rand: duration_sec]
  constraint c_duration {
    // [LOGIC: if-else inside constraint block using implication ->]
  }
  function void display_state();
    // [LOGIC: Print current_state.name() and duration_sec]
  endfunction
endclass

module tb_traffic_light;
  task run_cycle(input int num_states);
    // [for-loop, instantiate, randomize+fatal, display]
  endtask
  initial begin
    // [dumpfile/dumpvars, call run_cycle(5), $finish]
  end
endmodule


*/


typedef enum bit[1:0] {RED = 0, YELLOW = 1, GREEN = 2} light_state_e;

class light_tx;
  
  rand light_state_e current_state;
  
  rand int unsigned duration_sec;
  
  constraint c_duration {
    
    if (current_state == YELLOW) duration_sec == 3;
    
    else duration_sec inside { [10:30] };
    
    }

  function void display_state(input int state_num);
    
    $display("[STATE %2d] Light = %6s | Duration = %2d sec", state_num, current_state.name, duration_sec);
    
  endfunction
  
endclass
  
module tb_traffic_light;
    
  light_tx tx;
    
  task run_cycle (input int num_states);
      
    for(int i = 0; i < num_states; i++) begin
        
      tx = new();
        
      if( !( tx.randomize() ) ) $fatal("Randomization Failed!!");
        
      tx.display_state(i + 1);
        
    end
      
  endtask
  
  initial begin
    
    $dumpfile("TrafficLightController.vcd");
    
    $dumpvars(0, tb_traffic_light);
    
    $display("-------- Traffic Light Simulation Start --------");
    
    run_cycle(15);
    
    $display("-------- Simulation Complete --------");
    
    $finish;
    
  end
  
endmodule

/*
							OUTPUT: 
                            
      -------- Traffic Light Simulation Start --------
      [STATE  1] Light = YELLOW | Duration =  3 sec
      [STATE  2] Light =  GREEN | Duration = 23 sec
      [STATE  3] Light =    RED | Duration = 30 sec
      [STATE  4] Light =    RED | Duration = 23 se
      [STATE  5] Light =    RED | Duration = 26 sec
      [STATE  6] Light = YELLOW | Duration =  3 sec
      [STATE  7] Light =  GREEN | Duration = 24 sec
      [STATE  8] Light = YELLOW | Duration =  3 se
      [STATE  9] Light =    RED | Duration = 19 sec
      [STATE 10] Light =  GREEN | Duration = 13 se
      [STATE 11] Light = YELLOW | Duration =  3 sec
  	  [STATE 12] Light =  GREEN | Duration = 16 sec
      [STATE 13] Light = YELLOW | Duration =  3 sec
      [STATE 14] Light = YELLOW | Duration =  3 sec
      [STATE 15] Light =    RED | Duration = 16 sec
      -------- Simulation Complete --------


*/
