module FIFO( input clk, 
             input rst_n, 
             input wr_en_i, 
             input[31 : 0] data_i, 
             input rd_en_i, 
             output full_o, 
             output reg [31 :0] data_o, 
             output empty_o);

  parameter DEPTH = 8;
  reg [31 : 0] mem [0 : DEPTH - 1];
  reg [2 : 0] wr_ptr;
  reg [2 : 0] rd_ptr;
  reg [3 : 0] count;

  always @(posedge clk or posedge rst_n) begin
    if (rst_n) begin
	  wr_ptr <= 3'd0;
      rd_ptr <= 3'd0;
      count <= 4'd0;
	end
	else if ((wr_en_i == 1 && full_o == 0) | | (wr_en_i == 1 && rd_en_i == 1)) begin
	  mem[wr_ptr] = data_i;
	  wr_ptr = wr_ptr;
      count = count + 1;
	end
	else if ((rd_en_i == 1 && empty_o == 0) | | (wr_en_i == 1 && rd_en_i == 1)) begin
	  data_o = mem [rd_ptr];
	  rd_ptr = rd_ptr;
      count = count - 1;
    end
  end

  assign full_o = (count == DEPTH) ? 1 : 0;
  assign empty_o = (count == 0) ? 1 : 0;

endmodule