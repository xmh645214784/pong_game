`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/12/31 10:48:37
// Design Name: 
// Module Name: move
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


module move(pclk,rst,upa,upb,st,h_cnt,v_cnt,a,b,x,y);
    input pclk,rst,upa,upb,st;
    input [9:0] h_cnt,v_cnt;
    output reg [9:0] a,b,x,y;
    
    (* syn_encoding = "safe" *) reg [2:0] state;
    parameter s0=0,s1=1,s2=2,s3=3,s4=4,s5=5,ball_step=5,board_step=5;
   
    reg [2:0] pre;
    reg [9:0] v;
    reg ua,ub,valid;      

    always@(posedge pclk or posedge rst)
    begin
    if(rst==1'b1)
        begin
        x<=25;
        y<=240;
        v<=0;
        end
    else
        begin
        v<=v_cnt;
        valid<=(v!=10'b1111111111)&&(v_cnt==10'b1111111111);
        if(st==1'b1)
            begin
            if(valid==1'b1)
              begin
              case(state)
s0:
    begin
    x<=25;
    y<=240;
    end
s1:
    begin
    x<=x;
    y<=y;
    end
s2:
    begin
    x<=x+ball_step;
    y<=y+ball_step;
    end
s3:
    begin
    x<=x+ball_step;
    y<=y-ball_step;
    end
s4:
    begin
    x<=x-ball_step;
    y<=y-ball_step;
    end
s5:
    begin
    x<=x-ball_step;
    y<=y+ball_step;
    end
default: 
    begin
    x<=x;
    y<=y;
    end
                endcase
                end
            end
        end
    end


    always @(posedge pclk or posedge rst )
    begin
    if(rst==1'b1)
        begin
        a<=240;
        ua<=0;
        end
    else 
        begin
        ua<=upa;
        if((state==s0)||(state==s1))
            begin
            a<=a;
            end
        else
            begin
            if(st==1'b1)
                begin
                if(valid==1'b1)
                    begin                                
                    if((a>40)&&(a<440))
                        begin             
                        if(ua==1)
                            begin
                            a<=a-board_step;
                            end
                        else
                            begin
                            a<=a+board_step;
                            end
                        end
                     else  if(a==40)                  
                        begin    
                        if(ua==0)
                            begin
                            a<=a+board_step;
                            end
                        else
                            begin
                            a<=a;
                            end
                        end
                    else                 
                        begin  
                        if(ua==1)
                            begin
                            a<=a-board_step;
                            end
                        else
                            begin
                            a<=a;
                            end
                        end
                    end
                else
                    begin
                    a<=a;
                    end
                end
            else 
                begin
                a<=a;
                end
            end
        end   
    end
    
    always @(posedge pclk or posedge rst )
    begin
    if(rst==1'b1)
        begin
        b<=240;
        ub<=0;
        end
    else 
        begin
        ub<=upb;
        if((state==s0)||(state==s1))
            begin
            b<=b;
            end
        else
            begin
            if(st==1'b1)
                begin
                if(valid==1'b1)
                    begin                                
                    if((b>40)&&(b<440))
                        begin             
                        if(ub==1)
                            begin
                            b<=b-board_step;
                            end
                        else 
                            begin
                            b<=b+board_step;
                            end
                        end
                    else if(b==40)                  
                        begin    
                        if(ub==0)
                            begin
                            b<=b+board_step;
                            end
                        else
                            begin
                            b<=b;
                            end
                        end
                    else                 
                        begin  
                        if(ub==1)
                            begin
                            b<=b-board_step;
                            end
                        else
                            begin
                            b<=b;
                            end
                        end
                    end
                else
                    begin
                    b<=b;
                    end
                end
            else 
                begin
                b<=b;
                end
            end
        end   
    end

    always@(posedge pclk or posedge rst)
    begin
    if(rst==1'b1) 
        begin
        state<=s0;
        pre<=s0;
        end
    else if(valid==1'b1)
        begin
        if(st==1'b0)
            begin
            if(state!=s1)
                begin
                pre<=state;
                state<=s1;
                end
            end
        else if(pre==s0) 
            begin
            state<=s2;
            pre<=s2;
            end
        else if(state==s1) state<=pre;
        else case(state)
s2:
    begin
    if(x==615)
       begin
       if(y==465)
           begin
           if(b>410)
               begin
               state<=s4;
               end
           else
               begin
               state<=s1;
               pre<=s1;
               end
           end
       else
           begin
           if((b>y-55)&&(b<y+55))
               begin
               state<=s5;
               end
           else
               begin
               state<=s1;
               pre<=s1;
               end
           end
       end
    else 
       begin
       if(y==465)
           begin
           state<=s3;
           end
       else
           begin
           state<=state;
           end
       end
    end
s3:
    begin
    if(x==615)
       begin
       if(y==15)
           begin
           if(b<70)
               begin
               state<=s5;
               end
           else
               begin
               state<=s1;
               pre<=s1;
               end
           end
       else
           begin
           if((b>y-55)&&(b<y+55))
               begin
               state<=s4;
               end
           else
               begin
               state<=s1;
               pre<=s1;
               end
           end
       end
    else 
       begin
       if(y==15)
           begin
           state<=s2;
           end
       else
           begin
           state<=state;
           end
       end
    end
s4:
    begin
    if(x==25)
       begin
       if(y==15)
           begin
           if(a<70)
               begin
               state<=s2;
               end
           else
               begin
               state<=s1;
               pre<=s1;
               end
           end
       else
           begin
           if((a>y-55)&&(a<y+55))
               begin
               state<=s3;
               end
           else
               begin
               state<=s1;
               pre<=s1;
               end
           end
       end
    else 
       begin
       if(y==15)
           begin
           state<=s5;
           end
       else
           begin
           state<=state;
           end
       end
    end
s5:
    begin
    if(x==25)
       begin
       if(y==465)
           begin
           if(a>410)
               begin
               state<=s3;
               end
           else
               begin
               state<=s1;
               pre<=s1;
               end
           end
       else
           begin
           if((a>y-55)&&(a<y+55))
               begin
               state<=s2;
               end
           else
               begin
               state<=s1;
               pre<=s1;
               end
           end
       end
    else 
       begin
       if(y==465)
           begin
           state<=s4;
           end
       else
           begin
           state<=state;
           end
       end
    end
        endcase
        end
    end

endmodule
