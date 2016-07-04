ok=open_serial(1,2,115200);
if ok~=0 then error('Unable to open serial port, please check'); end
for i=1:10000
    p=cmd_digital_in(1,5) //Reads state of input pin 5
    q=cmd_digital_in(1,6)
    if p==1 & q==1
        cmd_digital_out(1,9,0)//gives output to pin 9 as LOW
        sleep(5)
    else
        cmd_digital_out(1,9,1)
        sleep(5)
    end
end
close_serial(1);
