`timescale 1ns/1ns
module mem_top(
               input clk,
               input res,
               input button,
               input [6:0] paddr,
               input pwrite,
               input psel,
               input enbl,
               input is_apb,
               input [31:0] pwdata,
               output slerr,
               output pready,
               output mem_full,
               output [31:0] prdata);
  
  wire valid_in;
  wire [7:0] data_8;
  wire valid1;
  wire [31:0] data_32;
  wire valid_fifo;
  wire stop_connect;
  wire [31:0] data;
  wire WR; 
  wire [6:0] addr; 
  wire wire1;
  
 valid_in valid        (
                        .din(button),
                        .clk(clk),
                        .res(res),
                        .out(valid_in)
                       );
  
 counter count         (
                        .vin(valid_in),
                        .clk(clk),
                        .res(res),
                        .stop(stop_connect),
                        .valid1(valid1),
                        .dataout(data_8)
                       );
           
 shift_register shift  (
                        .clk(clk),
                        .res(res),
                        .data_in(data_8),
                        .valid_in(valid1),
                        .data_out(data_32),
                        .valid_fifo(valid_fifo)
                       );
    
 memory_dr mem         ( 
                        .clk(clk),
                        .res(res),
                        .datain(data_32),
                        .valid_fifo(valid_fifo),
                        .is_apb(is_apb),
                        .paddr(paddr),
                        .psel(psel),
                        .enbl(enbl),
                        .pwdata(pwdata),
                        .slerr(slerr),
                        .pready(pready),
                        .stop(stop_connect),
                        .mem_full(mem_full),
                        .write_tr(WR),
                        .pwrite(wire1),
                        .addr(addr),
                        .dataout(data)
                       );

                        
 memory memo           (
                        .clk(clk),
                        .res(res),
                        .write_enable(WR),
                        .data_in(data),
                        .address(addr),
                        .mem_out(prdata),
                        .pwrite(wire1)
                       );                
endmodule
   
