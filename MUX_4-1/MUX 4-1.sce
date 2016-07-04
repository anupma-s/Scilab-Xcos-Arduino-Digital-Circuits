ok=open_serial(1,2,115200);
if ok~=0 then error('Unable to open serial port, please check'); end
for i=1:10000
    //input pins
    i0=cmd_digital_in(1,2) //LSB, reads input i0
    i1=cmd_digital_in(1,3)
    i2=cmd_digital_in(1,4)
    i3=cmd_digital_in(1,5) //MSB, reads input i3
    
    //select lines
    a=cmd_digital_in(1,6) //MSB, reads input to select line A
    b=cmd_digital_in(1,7) //LSB
    
    
    if a==0 & b==0
        //input i0 is selected, output is same as i0
        if i0==0
            cmd_digital_out(1,9,0)
        else 
            cmd_digital_out(1,9,1)
        end
    end
    
    if a==0 & b==1
        //input i1 is selected, output is same as i1
        if i1==0
            cmd_digital_out(1,9,0)
        else 
            cmd_digital_out(1,9,1)
        end
    end
    
    if a==1 & b==0
        //input i2 is selected, output is same as i2
        if i2==0
            cmd_digital_out(1,9,0)
        else 
            cmd_digital_out(1,9,1)
        end
    end
    
    if a==1 & b==1
        //input i3 is selected, output is same as i3
        if i3==0
            cmd_digital_out(1,9,0)
        else 
            cmd_digital_out(1,9,1)
        end
    end
    
    end
close_serial(1)
