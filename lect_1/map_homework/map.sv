class map;
  
   local int assoc_array[string];
  	
   
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
     
     if (assoc_array.exists(key)) begin
       
        return assoc_array[key];
     end
     
     else begin
         return 0;
     end
     
   endfunction
  
  //put()
   function put(string key, int value);
    
      assoc_array[key] = value;
    
   endfunction  
  
  //delete()
   function delete(string key);
  
     if(assoc_array.exists(key)) begin
       
    	assoc_array.delete(key);
      	return 1;
     end
     
    else return 0;
    
  endfunction
  
endclass
