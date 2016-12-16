`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/12/16 22:13:26
// Design Name: 
// Module Name: kb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module kb(rst,clk,ps2_clk,ps2_data,upa,upb);
   input rst,clk,ps2_clk,ps2_data;
   reg [7:0] data;
   output reg upa,upb;

  reg  ready;
  reg overflow;     
  reg [3:0] count;   



   reg [9:0] buffer;        
   reg [7:0] fifo[7:0];     
   reg [2:0] w_ptr,r_ptr;   
   reg [2:0] ps2_clk_sync;
   always @ (posedge clk)
       begin
       ps2_clk_sync <=  {ps2_clk_sync[1:0],ps2_clk};
       end
   wire sampling = ps2_clk_sync[2] & ~ps2_clk_sync[1];
   always @ (posedge clk)
       begin
       if (rst == 1)  //  reset 
          begin
          count <= 0; w_ptr <= 0; r_ptr <= 0; overflow <= 0;
          end
       else  
          if (sampling) 
             begin
             if (count == 4'b1010)
               begin
               if ((buffer[0] == 0)&&(ps2_data)&&(^buffer[9:1]))
                   begin  
                   fifo[w_ptr] <= buffer[8:1];  //  kbd scan code
                   w_ptr <= w_ptr+3'b1;
                   ready <= 1'b1;
                   overflow <= overflow | (r_ptr == (w_ptr + 3'b1));
                   end
               count <= 0;     //  for next
               end
             else 
                  begin
                  buffer[count] <= ps2_data;  //  store ps2_data 
                  count <= count + 3'b1;
                 end      
             end
       if ( ready )   // read to output next data
          begin 
          data = fifo[r_ptr];
          r_ptr <= r_ptr + 3'd1;
          ready <= 1'b0;
            case(data)
              8'h1d:upa<=1;
              8'h1b:upa<=0;
              8'h75:upb<=1;
              8'h72:upb<=0;
              default;
            endcase
          end
       end 
endmodule 