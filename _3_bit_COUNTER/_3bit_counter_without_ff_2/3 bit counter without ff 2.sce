ok=open_serial(1,2,115200);
if ok~=0 then error('Unable to open serial port, please check'); end
i=0;
a=0;
b=0;
c=0;
pinstate=0;
lastpinstate=0;

for j=1:1000
    pinstate=cmd_digital_in(1,5)
    
    
    //negative edge
    if pinstate~=lastpinstate
        if pinstate=0
            i=i+1;
        end
        sleep(50)
    end
    lastpinstate=pinstate;
    
    
     a=modulo(int(i),2) 
     b=modulo(int(i/2),2) //int(i/2) gives integer part of i/2
     c=modulo(int(i/4),2)
    
    cmd_digital_out(1,9,a)//LSB
    cmd_digital_out(1,10,b)
    cmd_digital_out(1,11,c)//MSB
    
    if i>7
        i=0;
    end
    
    
end
close_serial(1)

