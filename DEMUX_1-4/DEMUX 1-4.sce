ok=open_serial(1,2,115200);
if ok~=0 then error('Unable to open serial port, please check'); end
for j=1:10000
    //input pins
    i=cmd_digital_in(1,5) //reads input given to pin 5
    
    //select lines
    a=cmd_digital_in(1,6) //MSB, reads input to select line a
    b=cmd_digital_in(1,7) //LSB, reads input to select line b
    
    //output pins: LSB 8,9,10,11 MSB
    
    if i==0 //all outputs will be zero irrespective of which one is selected
        cmd_digital_out(1,11,0)
        cmd_digital_out(1,10,0)
        cmd_digital_out(1,9,0)
        cmd_digital_out(1,8,0)
        sleep(100)
        
    else if i==1
            if a==0 & b==0 //input i is seen at first output pin (LSB)
                cmd_digital_out(1,11,0)
                cmd_digital_out(1,10,0)
                cmd_digital_out(1,9,0)
                cmd_digital_out(1,8,1)
                sleep(100)
            else if a==0 & b==1 //input i is seen at second output pin
                    cmd_digital_out(1,11,0)
                    cmd_digital_out(1,10,0)
                    cmd_digital_out(1,9,1)
                    cmd_digital_out(1,8,0)
                    sleep(100)
             else if a==1 & b==0 //input i is seen at third output pin
                     cmd_digital_out(1,11,0)
                     cmd_digital_out(1,10,1)
                     cmd_digital_out(1,9,0)
                     cmd_digital_out(1,8,0)
                     sleep(100)
             else if a==1 & b==1 //input i is seen at fourth output pin (MSB)
                     cmd_digital_out(1,11,1)
                     cmd_digital_out(1,10,0)
                     cmd_digital_out(1,9,0)
                     cmd_digital_out(1,8,0)
                     sleep(100)
                 end
             end
         end
     end
 end
 end
        
    
    end
close_serial(1)
