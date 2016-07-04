ok=open_serial(1,2,115200);
if ok~=0 then error('Unable to open serial port, please check'); end

pinstate0=0; //input, clock pulse to FF1
lastpinstate0=0;

pinstate1=0; //output of FF1 (LSB), clock pulse to FF2
lastpinstate1=0;

pinstate2=0; //output of FF2 (middle bit)), clock pulse to FF3
lastpinstate2=0;

pinstate3=0; //output of FF3 (MSB)
lastpinstate=0;


for j=1:1000
    
    //LSB
    if pinstate1==0
        cmd_digital_out(1,9,0)
    else
        cmd_digital_out(1,9,1)
        sleep(100)
    end
    
    //middle bit
    if pinstate2==0
        cmd_digital_out(1,10,0)
    else
        cmd_digital_out(1,10,1)
        sleep(100)
    end
    
    //MSB
    if pinstate3==0
        cmd_digital_out(1,11,0)
    else
        cmd_digital_out(1,11,1)
        sleep(100)
    end
    
    
    pinstate0=cmd_digital_in(1,5); //reads state of input clock pulse
    
    //negative edge of clock pulse to FF1
    if (pinstate0~=lastpinstate0)
        if (pinstate0==0)
            if (pinstate1==0)
                pinstate1=1
            else
                pinstate1=0
            end
        else
        end
        sleep(50)
    end
    lastpinstate0=pinstate0;
    
    //negative edge to clock pulse of FF2
    if (pinstate1~=lastpinstate1)
        if (pinstate1==0)
            if (pinstate2==0)
                pinstate2=1
            else
                pinstate2=0
            end
        else
        end
        sleep(50)
    end
    lastpinstate1=pinstate1;
    
    //negative edge of clock pulse to FF3
    if (pinstate2~=lastpinstate2)
        if (pinstate2==0)
            if (pinstate3==0)
                pinstate3=1
            else
                pinstate3=0
            end
        else
        end
        sleep(50)
    end
    lastpinstate2=pinstate2;
    
    
    
    
    end
close_serial(1)
