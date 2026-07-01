/*
DESIGN SPECIFICATION: Application Crucible 2 (The Sensor Data Logger)
An IoT edge sensor logs temperature readings. Since memory on the microcontroller is limited, you must use the smallest possible 2-state datatype that can hold typical readings (-40°C to 85°C), and confirm your understanding of byte (8-bit, 2-state, signed by default).
Target File Name: tb_sensor_logger.sv
1. Detailed Class Code Structure
sensor_tx (Transaction Class)

*/

class sensor_tx;
  
  rand byte temp_celsius;
  rand bit valid_reading;
  
  constraint c_temp_range {
    
    temp_celsius inside { [-40:85] };  
    
    
  }
  
  constraint c_valid_bias {
    
    valid_reading dist { 1 := 90, 0 := 10}; 
  
  }
  
  function void display_reading(); 
    
    string valid_str; 
   // Method - 1: 
//     if(valid_reading == 1'b1) begin
      
//       valid_str = "YES";
      
//     end 
    
//     else begin
      
//       valid_str = "NO";
      
//     end
    
    $display("Temperature = %5d | Valid = %s", temp_celsius, valid_reading == 1'b1 ? "YES" : "NO");
    
  endfunction
  
endclass

module tb_sensor_logger; 
  
  task automatic generate_readings (input int num_reading);
    
    sensor_tx tx;
 
    for(int i = 0; i < num_reading; i++) begin
      
      tx = new();
      
      if( !( tx.randomize() ) ) begin
        
        $fatal(1, "Randomization Failed!!");

      end
      
      tx.display_reading();
      
    end
    
  endtask
  
  initial begin
    
    $dumpfile("senslog.vcd");
    
    $dumpvars(0, tb_sensor_logger);
    
    generate_readings(50);
    
    $finish;
    
  end
  
endmodule
