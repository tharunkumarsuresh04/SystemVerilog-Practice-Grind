
module tb_datatype_init; 
  
  logic [7:0] data_bus_4state;
  
  bit [7:0] data_bus_2state; 
  
  initial begin 
    
    #1; 
    
    $display("#--- Power On State Monitor ---");
    
    $display("The Value of the 4 state Datatype in binary is %b and %0d in Decimal", data_bus_4state, data_bus_4state);
    
    $display("The Value of the 4 state Datatype in binary is %b and %0d in Decimal", data_bus_2state, data_bus_2state);
    
    if (data_bus_4state === 8'hXX) begin 
      $display("4 State bus is uninitialized as expected!!");
      
    end
    
    $display("#--- Simulation Complete ---");
    
  end
  
endmodule



                    /*
                    		       OUTPUT: 
                         
                         #--- Power On State Monitor ---
            The Value of the 4 state Datatype in binary is xxxxxxxx and x in Decimal
            The Value of the 4 state Datatype in binary is 00000000 and 0 in Decimal
            4 State bus is uninitialized as expected!!
                         #--- Simulation Complete ---
                    
                    */
