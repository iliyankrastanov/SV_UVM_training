odule semaphore_ex;
  semaphore key;
  
  initial begin
    key = new (1);
    fork 
      ev_1 ();
      ev_2 ();
    join_none
  end
  
  //Task using "get()"
  task event_get (bit id);
     $display("[%0t] Getting a key [%0d]..", $time, id);
     key.get(1);
     $display("[%0t] Key got [%0d]", $time, id);
  endtask
  
  //Task using "put()"
  task event_put (bit id);
     $display("[%0t] Leaving a key [%0d]..", $time, id);
     key.put(1);
     $display("[%0t] Key left [%0d]", $time, id);
  endtask
  
  task ev_1 ();
     event_get (1);
     #5 event_put(1);
  endtask
  
  task ev_2 ();
     #5 event_get (1);
     #5 event_put(1);
  endtask

endmodule
