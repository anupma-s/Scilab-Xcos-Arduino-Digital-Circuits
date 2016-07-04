//3 bit SIPO shift register using D FFs
//input by user is given to FF2 (MSB FF).
//It then shifts rightwards serially and is eventually lost through
//FF0 (LSB FF) after 3 clock pulses
//outputs of all FFs (all bits) are obtained at all instances 

ok=open_serial(1,2,115200);
if ok~=0 then error('Unable to open serial port, please check'); end
D2=0; //serial data input, input by user is given to FF2 (MSB FF), output of FF2=input of FF1
D1=0; //D1=Q2, FF1 (middle bit FF), output of FF1=input of FF0
D0=0; //D0=Q1, FF0 (LSB FF), output of FF0 = Q0
Q0=0; 

pinstate=0; //clock or enable, common to all FFs
lastpinstate=0;

for i=1:5000
    
    //pin 9=D0=LSB
    if (D0==0)
        cmd_digital_out(1,9,0)
    else
        cmd_digital_out(1,9,1)
    end
    
    //pin 10=Q1=D1=middle bit
    if (D1==0)
        cmd_digital_out(1,10,0)
    else
        cmd_digital_out(1,10,1)
    end
    
    //pin 11=Q2=D2=MSB
    if (D2==0)
        cmd_digital_out(1,11,0)
    else
        cmd_digital_out(1,11,1)
    end
    
    
    pinstate=cmd_digital_in(1,2) //reads the state of clock
    
    //clock is common for all FFs thus only 1 if statement for detecting positive edge of clock
    
    if (pinstate~=lastpinstate)
        if(pinstate==1)
            
             //order of FFs; FF2-FF1-FF0
            
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
            
            D2=cmd_digital_in(1,5) //input is given to D of FF2 (MSB FF)
        end
        
        sleep(50)
    end
    lastpinstate=pinstate;
end
close_serial(1)
