ok=open_serial(1,2,115200);
if ok~=0 then error('Unable to open serial port, please check'); end


dataPin=11; 
clockPin=9;
latchPin=10;
inPin=5;


for j=1:50
    
    
    
    cmd_digital_out(1,latchPin,0)
    cmd_shift_out_(dataPin,clockPin,inPin) 
    cmd_digital_out(1,latchPin,1)
    
    sleep(500)
    
    
end
close_serial(1)
