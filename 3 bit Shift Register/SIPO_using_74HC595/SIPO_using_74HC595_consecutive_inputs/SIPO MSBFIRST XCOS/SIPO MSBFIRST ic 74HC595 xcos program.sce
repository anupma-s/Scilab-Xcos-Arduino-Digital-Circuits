ok=open_serial(1,2,115200);
if ok~=0 then error('Unable to open serial port, please check'); end

dataPin=11;
clockPin=9;
latchPin=10;

y=0;

y=cmd_shift_out_msb_xcos(dataPin,clockPin,latchPin);

close_serial(1)
