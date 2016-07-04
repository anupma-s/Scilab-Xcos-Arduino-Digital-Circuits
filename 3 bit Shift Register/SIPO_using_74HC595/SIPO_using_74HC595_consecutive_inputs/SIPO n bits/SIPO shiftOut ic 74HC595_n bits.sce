ok=open_serial(1,2,115200);
if ok~=0 then error('Unable to open serial port, please check'); end

pinstate=0;
dataPin=11;
clockPin=9;
latchPin=10;

in=input("enter no of bits","s") //input is stored in the form of string
n=strtod(in) //string is converted to decimal 
data=zeros(1,n); // an n-elements matrix represents an n bit binary number
for j=1:100
    
    pinstate=cmd_digital_in(1,5) //reads the state of serial input pin
    
    if(pinstate==1)
        //data=[(data(1) | 1) (data(2) | 0) (data(3) | 0) (data(4) | 0) (data(5) | 0) (data(6) | 0) (data(7) | 0) (data(8) | 0)];
        data=data | eye(1,n);
        //the msb becomes 1 when input is given
        //high which is henceforth shifted
    end
    disp(data)
    
    cmd_digital_out(1,latchPin,0)
    cmd_shift_outn(dataPin,clockPin,'LSBFIRST',data,n) //LSBFIRST
    cmd_digital_out(1,latchPin,1)
    
    sleep(500)
    for k=1:(n-1)
        data(n+1-k)=data(n-k);
        //every element of the matrix is
        //shifted one place to the right
        //so effectively the n bit
        //binary number is divided by 2
    end
    data(1)=0
    
end
close_serial(1)
