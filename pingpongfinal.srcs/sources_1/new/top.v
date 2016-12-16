`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/12/31 10:52:35
// Design Name: 
// Module Name: top
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


module top(clk,rst,st,hsync,vsync,red,green,blue,ps2_data,ps2_clk);
    input clk,rst,st;
    input ps2_data,ps2_clk;
    wire upa,upb;
    output hsync,vsync;
    output [3:0] red,green,blue;

    wire pclk;
    wire [9:0] a,b,x,y,h_cnt,v_cnt;
    reg [11:0] vga;

    dcm_25m d0(
    .clk_in1(clk),
    .clk_out1(pclk),
    .reset(rst)
    );

    vga_640x480 v0(
    .pclk(pclk),
    .rst(rst),
    .hsync(hsync),
    .vsync(vsync),
    .h_cnt(h_cnt),
    .v_cnt(v_cnt) );

    move m0(
    .pclk(pclk),
    .rst(rst),
    .upa(upa),
    .upb(upb),
    .st(st),
    .h_cnt(h_cnt),
    .v_cnt(v_cnt),
    .a(a),
    .b(b),
    .x(x),
    .y(y) );

     kb kboard (.rst(rst),.clk(clk),.ps2_clk(ps2_clk),.ps2_data(ps2_data),.upa(upa),.upb(upb));

    always@(posedge pclk or posedge rst)
    begin
        if(rst==1'b1) vga=12'b000000000000;
        else if((h_cnt-x)*(h_cnt-x)+(v_cnt-y)*(v_cnt-y)<225) vga=12'b100010001000;
        else if((h_cnt>=0)&&(h_cnt<=10)&&(v_cnt>a-39)&&(v_cnt<a+39)) vga=12'b100000000000;
        else if((h_cnt>=630)&&(h_cnt<=639)&&(v_cnt>b-39)&&(v_cnt<b+39)) vga=12'b100000000000;
        else vga=12'b000000000000;
    end

    assign red=vga[11:8];
    assign green=vga[7:4];
    assign blue=vga[3:0];

endmodule