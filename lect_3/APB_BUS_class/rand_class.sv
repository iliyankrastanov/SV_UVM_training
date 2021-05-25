class rand_class;
  rand bit [7:0] PADDR;
  rand bit [7:0] PWDATA;
  rand bit PWRITE;
  rand bit PSEL;
  rand bit PREADY;
    
  //PWDATA MSB will always be 1
  constraint msb_1 {PWDATA[7] == 1'b1;}
  	
  constraint paddr_range {PADDR inside {[0:63]};}
  	
endclass
