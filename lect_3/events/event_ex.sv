module events_ex;
   event ev_1; 
   event ev_2 = ev_1;
  
   task T1 (event ev);
     -> ev;
   endtask
  
   task T2 (event ev_sec);
     wait(ev_1.triggered);
     -> ev_sec;
   endtask
  
  
  initial begin
    fork
      //process-1, triggers the event
      begin
        #40;
        $display($time,"\tTriggering The First Event"); 
        T1 (ev_1); 
        #5;
        $display($time,"\tTriggering The Second Event");
        T2 (ev_2);
      end
      
      //process-2, wait for the event to trigger
      begin
        $display($time,"\tWaiting for the First Event to trigger");
        @(ev_1.triggered); 
        $display($time,"\tFirst Event triggerd");
        
        $display($time,"\tWaiting for the Second Event to trigger");
        #5;
        $display($time,"\tSecond Event triggerd");
      end
    join
  end
  
endmodule
