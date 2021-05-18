class map;
  
   int assoc_array[string];
  	
   
   function new //constructor
      (
        int assoc_array[string] = '{"phone"  : 5,                                    
                   		    		      "keys"   : 7,                                    
                   		    		      "wallet" : 9}
      );    
         this.assoc_array = assoc_array; 
     
   endfunction
  
  //get()
  
   function int get(string key);
     
      return assoc_array[key];
    
   endfunction
  
  //put()
   function put(string key, int value);
    
      assoc_array[key] = value;
    
   endfunction  
  
  //delete()
   function delete(string key);
  
      assoc_array.delete(key);
    
    
   endfunction  
  
endclass
