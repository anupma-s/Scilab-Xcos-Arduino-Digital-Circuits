ok=open_serial(1,2,115200);
if ok~=0 then error('Unable to open serial port, please check'); end

pinstate=0;
data=[0 0 0 0 0 0 0 0]; // an 8-elements matrix represents an 8 bit binary number
y=0;
dataPin=11;
clockPin=9;
latchPin=10;

for j=1:250
    
    pinstate=cmd_digital_in(1,5) //reads the state of serial input pin
    
    if(pinstate==1)
        //data=[(data(1) | 1) (data(2) | 0) (data(3) | 0) (data(4) | 0) (data(5) | 0) (data(6) | 0) (data(7) | 0) (data(8) | 0)];
        data=data | [1 0 0 0 0 0 0 0];
        //the msb becomes 1 as input is given
        //high which is henceforth shifted
    end
    disp(data)
    
    cmd_digital_out(1,latchPin,0)
    cmd_shift_out_lsb(dataPin,clockPin,data) //LSBFIRST
    cmd_digital_out(1,latchPin,1)
    
    sleep(500)
    for k=1:7
        data(9-k)=data(8-k);
        //every element of the matrix is
        //shifted one place to the right
        //so effectively the 8 bit
        //binary number is divided by 2
    end
    data(1)=0
    
end
close_serial(1)
