//to give n bit input

ok=open_serial(1,2,115200);
if ok~=0 then error('Unable to open serial port, please check'); end

dataPin=9;
clockPin=10;
latchPin=11;

ledPin=5; //LED that shows serial output
clockLed=6; //LED that shows clock pulses

in=input("enter no of times parallel load is to be given; ","s"); //the input is stored in the form of a string
p=strtod(in); //converts the input string to decimal
inp=input("enter no of bits; ","s");
n=strtod(inp);

cmd_digital_out(1,latchPin,1)// parallel load mode

for j=1:p //p iterations to give p sets of n bit parallel inputs
    disp('Give input, Parallel load mode:')
    
    sleep(2000)
    
    cmd_digital_out(1,clockPin,1) //positive edge of clock pulse
    disp('Inputs stored, Serial shift mode:')
    sleep(500)
    
    cmd_digital_out(1,clockPin,0) //negative edge of clock pulse
    cmd_digital_out(1,latchPin,0)// serial out mode
    
    cmd_shift_in_n(dataPin,clockPin,ledPin,clockLed,n);
    
    cmd_digital_out(1,latchPin,1) //back to Parallel mode for the next loop
    cmd_digital_out(1,5,0)//LED
    
    
    
end
close_serial(1)
