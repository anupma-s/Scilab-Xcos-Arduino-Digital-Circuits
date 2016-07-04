ok=open_serial(1,2,115200);
if ok~=0 then error('Unable to open serial port, please check'); end

dataPin=9;
clockPin=10;
latchPin=11;

ledPin=5; //LED that shows serial output
clockLed=6; //LED that shows clock pulses

data=zeros(1,8);

data=cmd_shift_in_xcos(dataPin, clockPin, latchPin, ledPin, clockLed);



close_serial(1)
