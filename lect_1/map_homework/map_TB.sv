module map_TB();
 
   int to_get;
  
   map map_t;
  
  
   initial begin

      map_t = new;
 
         foreach(map_t.assoc_array[key]) begin

            $display("key: %s | value: %d", key, map_t.assoc_array[key]); //prints the original array

         end

    $display("-----------------------------------");
     
          
      to_get = map_t.get("phone");  
          
         $display("The value of the key is", to_get); // prints the value of the key
     
     	     
       
    $display("-----------------------------------");
     
     
      map_t.put("headphones", 11); //puts new key
     

      map_t.delete("wallet"); //deletes the key wallet
     

         foreach(map_t.assoc_array[key]) begin

           $display("key: %s | value: %d", key, map_t.assoc_array[key]); //prints the new array

         end
    end

endmodule
