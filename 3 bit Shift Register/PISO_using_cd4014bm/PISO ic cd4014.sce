ok=open_serial(1,2,115200);
if ok~=0 then error('Unable to open serial port, please check'); end

dataPin=9;
clockPin=10;
latchPin=11;

ledPin=5; //LED that shows serial output
clockLed=6; //LED that shows clock pulses

cmd_digital_out(1,latchPin,1)// parallel load mode

for j=1:50
    disp('Give input, Parallel load mode:')
    
    sleep(2000)
    cmd_digital_out(1,clockPin,1) //positive edge occurs, parallel load is stored
    disp('Inputs stored, Serial shift mode:')
    sleep(500)
    cmd_digital_out(1,clockPin,0)
    cmd_digital_out(1,latchPin,0)// serial out mode
    
    cmd_shift_in(dataPin,clockPin,ledPin,clockLed);
    
    cmd_digital_out(1,latchPin,1)
    cmd_digital_out(1,ledPin,0)//LED
    
    
    
end
close_serial(1)
