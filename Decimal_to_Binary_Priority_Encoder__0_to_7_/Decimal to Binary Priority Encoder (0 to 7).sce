ok=open_serial(1,2,115200);
if ok~=0 then error('Unable to open serial port, please check'); end
for i=1:10000
    //input pins; 2,3,4,5,6,7,8 representing decimal numbers from 1 to 7 resp.
    d1=cmd_digital_in(1,2) //decimal number 1
    d2=cmd_digital_in(1,3)
    d3=cmd_digital_in(1,4)
    d4=cmd_digital_in(1,5)
    d5=cmd_digital_in(1,6)
    d6=cmd_digital_in(1,7)
    d7=cmd_digital_in(1,8) //decimal number 7
    
    //output pins: LSB 10,11,12 MSB representing binary 
    
    //decimal input 0, binary output 000
    if d1==0 & d2==0 & d3==0 & d4==0 & d5==0 & d6==0 & d7==0
        cmd_digital_out(1,10,0)
        cmd_digital_out(1,11,0)
        cmd_digital_out(1,12,0)
        
    //decimal input 1, binary output 001
    else if d1==1 & d2==0 & d3==0 & d4==0 & d5==0 & d6==0 & d7==0 
        cmd_digital_out(1,10,0)
        cmd_digital_out(1,11,0)
        cmd_digital_out(1,12,1)
    
    //decimal input 2, binary output 010
    else if d2==1 & d3==0 & d4==0 & d5==0 & d6==0 & d7==0 //since it is a PRIORITY encoder, the input d1 does not matter
        cmd_digital_out(1,10,0)
        cmd_digital_out(1,11,1)
        cmd_digital_out(1,12,0)
    
    //decimal input 3, binary output 011
    else if d3==1 & d4==0 & d5==0 & d6==0 & d7==0
        cmd_digital_out(1,10,0)
        cmd_digital_out(1,11,1)
        cmd_digital_out(1,12,1)
    
    //decimal input 4, binary output 100
    else if d4==1 & d5==0 & d6==0 & d7==0
        cmd_digital_out(1,10,1)
        cmd_digital_out(1,11,0)
        cmd_digital_out(1,12,0)
    
    //decimal input 5, binary output 101
    else if d5==1 & d6==0 & d7==0
        cmd_digital_out(1,10,1)
        cmd_digital_out(1,11,0)
        cmd_digital_out(1,12,1)
    
    //decimal input 6, binary output 110
    else if d6==1 & d7==0
        cmd_digital_out(1,10,1)
        cmd_digital_out(1,11,1)
        cmd_digital_out(1,12,0)
    
    //decimal input 7, binary output 111
    else if d7==1
        cmd_digital_out(1,10,1)
        cmd_digital_out(1,11,1)
        cmd_digital_out(1,12,1)
    end
end
end
end
end
end
end
end
    
    
    end
close_serial(1)
