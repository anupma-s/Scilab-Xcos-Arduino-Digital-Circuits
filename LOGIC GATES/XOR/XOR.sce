ok=open_serial(1,2,115200);
if ok~=0 then error('Unable to open serial port, please check'); end
for i=1:10000
    p=cmd_digital_in(1,5)
    q=cmd_digital_in(1,6)
    if p==0 & q==0
        cmd_digital_out(1,9,0)
        sleep(5)
    else if p==1 & q==1
        cmd_digital_out(1,9,0)
        sleep(5)
    else        
        cmd_digital_out(1,9,1)
        sleep(5)
    end
end
end
close_serial(1);
