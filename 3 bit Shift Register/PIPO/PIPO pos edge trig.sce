ok=open_serial(1,2,115200);
if ok~=0 then error('Unable to open serial port, please check'); end
D2=0; //MSB input
D1=0; //middle bit input=MSB output
D0=0; //LSB input=middle bit output
Q0=0; //LSB output

pinstate=0; //state of clock
lastpinstate=0;

for i=1:5000
    
    //pin 9=Q0=LSB
    if (Q0==0)
        cmd_digital_out(1,9,0)
    else
        cmd_digital_out(1,9,1)
    end
    
    //pin 10=Q1=D0=middle bit
    if (D0==0)
        cmd_digital_out(1,10,0)
    else
        cmd_digital_out(1,10,1)
    end
    
    //pin 11=Q2=D1=MSB
    if (D1==0)
        cmd_digital_out(1,11,0)
    else
        cmd_digital_out(1,11,1)
    end
    
    
    pinstate=cmd_digital_in(1,2) //reads the state of clock
    
    //clock is common for all FFs thus only 1 if statement for detecting positive edge of clock
    
    if (pinstate~=lastpinstate)
        if(pinstate==1)
            
            D0=cmd_digital_in(1,5) //reads input given to D of FF0 (LSB FF)
            D1=cmd_digital_in(1,6) // reads middle bit input
            D2=cmd_digital_in(1,7) //reads MSB input
            
            //order of FFs: (MSB)FF2-FF1-FF0(LSB)
            //FF0
            if (D0==0)
                Q0=0;
            else
                Q0=1;
            end
            
            //FF1
            if(D1==0)
                D0=0;
            else
                D0=1;
            end
            
            //FF2
            if(D2==0)
                D1=0;
            else
                D1=1;
            end
            
         end
         
        sleep(50)
        
    end
    lastpinstate=pinstate;
end
close_serial(1)
