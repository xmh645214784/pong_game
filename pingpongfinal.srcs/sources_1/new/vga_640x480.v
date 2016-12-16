`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/01/03 12:47:31
// Design Name: 
// Module Name: vga_640x480
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


module vga_640x480(pclk,rst,hsync,vsync,h_cnt,v_cnt);
    input rst,pclk;
    output reg hsync,vsync;
    output reg [9:0] h_cnt,v_cnt;

    reg [9:0] x_cnt,y_cnt;
    
    parameter h_total=799;
    parameter v_total=524;

    always @(posedge rst or posedge pclk)
    begin
    if(rst==1'b1)
        begin
        x_cnt<=10'b0000000000;
        y_cnt<=10'b0000000000;
        end
    else
        begin
        if(y_cnt<v_total)
            begin
            if(x_cnt<h_total)
                begin
                x_cnt<=x_cnt+1;
                end
            else
                begin
                x_cnt<=0;
                y_cnt<=y_cnt+1;
                end
            end
        else
            begin
            if(x_cnt<h_total)
                begin
                x_cnt<=x_cnt+1;
                end
            else
                begin
                x_cnt<=10'b0000000000;
                y_cnt<=10'b0000000000;
                end
            end
        end
    end
    
    always @(posedge pclk or posedge rst)
    begin
    if(rst)
        begin
        hsync<=0;
        h_cnt<=10'b1111111111;
        end
    else
        begin
        if((x_cnt<16)||((x_cnt>=112)&&(x_cnt<160)))
            begin
            hsync<=1;
            h_cnt<=10'b1111111111;
            end
        else if((x_cnt<112)&&(x_cnt>=16))
            begin
            hsync<=0;
            h_cnt<=10'b1111111111;
            end
        else
            begin
            hsync<=1;
            h_cnt<=x_cnt-160;
            end
        end
    end
    
    always @(posedge rst or posedge pclk)
    begin
    if(rst==1'b1)
        begin
        vsync<=0;
        v_cnt<=10'b1111111111;
        end
    else
        begin
        if((y_cnt<10)||((y_cnt<45)&&(y_cnt>=12)))
            begin
            vsync<=1;
            v_cnt<=10'b1111111111;
            end
        else if((y_cnt<12)&&(y_cnt>=10))
            begin
            vsync<=0;
            v_cnt<=10'b1111111111;
            end
        else
            begin
            vsync<=1;
            v_cnt<=y_cnt-45;
            end
        end
    end

endmodule
