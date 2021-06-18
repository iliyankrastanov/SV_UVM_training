`timescale 1ns / 1ps

module apb_slave( input clk,
                  input res,
                  input [6:0] paddr,
                  input pwrite,
                  input psel,
                  input enbl,
                  input [31:0] pwdata,
                  output slerr,
                  output reg pready
                ); 
                
  reg [1:0] apb_state;
  parameter [1:0] IDLE = 0;
  parameter [1:0] SETUP = 1;
  parameter [1:0] ACCESS = 2;
          
                
  always @(posedge clk) begin
      if (res) begin
          apb_state <= 0;
          pready <= 0;
      end
      else begin
      case (apb_state)
        IDLE : begin
            if (!psel && !enbl)
                apb_state <= IDLE;
            else if (psel && !enbl)
                apb_state <= SETUP;
            end
            
        SETUP: begin   
           apb_state <=  ACCESS;
        end
        
        
        ACCESS: begin
          if (!pready) 
            apb_state <= ACCESS;
            
          else if (pready && psel)
          apb_state <= SETUP;
          
          else if (pready && !psel)
          apb_state <= IDLE;
       end   
          
      endcase
    end
  end             
endmodule
