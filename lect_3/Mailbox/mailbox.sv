typedef mailbox #(string) str_mailbox;

module mailbox_test();
  
  string str;
  
  str_mailbox smbx = new();
  
  initial begin
    //smbx.put(1); returns error
    smbx.put("Test_word");
  end
  
  initial begin
    smbx.get(str);
    $display(str);
  end
  
  
endmodule
