/*
DESIGN SPECIFICATION: Application Crucible 4 (The Voltage Level Monitor)
A power management IC monitors core voltage. You need a real datatype to model fractional voltage values, since bit/int cannot represent 0.85V etc.
Target File Name: tb_voltage_monitor.sv
1. Detailed Class Code Structure
voltage_tx (Transaction Class)

Properties:

rand int unsigned voltage_mv; (millivolts, since real cannot be directly randomized)
real voltage_v; (non-rand, derived)


Constraints:

c_voltage_range: voltage_mv MUST be between 700 and 1200 (i.e., 0.7V–1.2V).


Methods:

function void compute_and_display(); → Converts voltage_mv to voltage_v (divide by 1000.0) and prints both.



2. Detailed Task Code
Inside module tb_voltage_monitor, write task monitor_rail(input int num_samples); — loop, instantiate, randomize+fatal, call compute_and_display.
3. Target Output
# --- Voltage Rail Monitoring Start ---
# [Sample 1] Raw: 850 mV | Converted: 0.850000 V
# [Sample 2] Raw: 1120 mV | Converted: 1.120000 V
# [Sample 3] Raw: 733 mV | Converted: 0.733000 V
# --- Monitoring Complete ---
4. Architect's Skeleton
systemverilogclass voltage_tx;
  // [Declare rand int unsigned: voltage_mv]
  // [Declare non-rand real: voltage_v]
  constraint c_voltage_range {
    // [LOGIC: voltage_mv inside 700 to 1200]
  }
  function void compute_and_display();
    // [LOGIC: voltage_v = voltage_mv / 1000.0]
    // [LOGIC: Print voltage_mv and voltage_v using %f]
  endfunction
endclass

module tb_voltage_monitor;
  task monitor_rail(input int num_samples);
    // [for-loop, instantiate, randomize+fatal, compute_and_display]
  endtask
  initial begin
    // [dumpfile/dumpvars, call monitor_rail(5), $finish]
  end
endmodule
*/

class voltage_tx;
  
  rand int unsigned voltage_mv;
  
  real voltage_v;
  
  constraint c_voltage_range {
   
    voltage_mv inside { [700:1200] };
    
  }
  
  function void compute_and_display(input int num_samples);
    
    voltage_v = voltage_mv / 1000.0;
    
    $display("[Sample %2d] Raw = %4d mV | Converted = %6f V", num_samples, voltage_mv, voltage_v);
    
  endfunction
  
endclass

module tb_voltage_monitor;
  
  voltage_tx tx;
  
  task monitor_rail(input int num_samples);
    
    for(int i = 0; i < num_samples; i++) begin
      
      tx = new();
      
      if ( ! (tx.randomize() ) ) $fatal (1, "Randomization Failed!!");
      
      tx.compute_and_display(i + 1);
      
      
    end
    
  endtask
  
  initial begin
    
    $dumpfile("VoltageLevelMonitor.vcd");
    
    $dumpvars(0, tb_voltage_monitor);
    
    monitor_rail(15);
    
    $finish;
    
  end
  
endmodule

/*
                                            OUTPUT:

                          -------- Voltage Rail Monitoring Start --------
                          [Sample  1] Raw =  956 mV | Converted = 0.956000 V
                          [Sample  2] Raw =  794 mV | Converted = 0.794000 V
                          [Sample  3] Raw =  887 mV | Converted = 0.887000 V
                          [Sample  4] Raw =  858 mV | Converted = 0.858000 V
                          [Sample  5] Raw = 1083 mV | Converted = 1.083000 V
                          [Sample  6] Raw =  806 mV | Converted = 0.806000 V
                          [Sample  7] Raw = 1127 mV | Converted = 1.127000 V
                          [Sample  8] Raw =  886 mV | Converted = 0.886000 V
                          [Sample  9] Raw =  780 mV | Converted = 0.780000 V
                          [Sample 10] Raw =  743 mV | Converted = 0.743000 V
                          [Sample 11] Raw =  787 mV | Converted = 0.787000 V
                          [Sample 12] Raw = 1032 mV | Converted = 1.032000 V
                          [Sample 13] Raw =  783 mV | Converted = 0.783000 V
                          [Sample 14] Raw =  984 mV | Converted = 0.984000 V
                          [Sample 15] Raw =  860 mV | Converted = 0.860000 V
                          -------- Simulation Complete --------

*/


