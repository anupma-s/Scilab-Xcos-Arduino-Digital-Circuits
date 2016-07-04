function []= cmd_shift_in(dataPin,clockPin,ledPin,clockLed)
    
    value=zeros(1,8);
    value2=zeros(8,8);
    
    for i=1:8
        disp(cmd_digital_in(1,dataPin)); //the LSB of the parallel load is obtained at dataPin
        
        if(cmd_digital_in(1,dataPin)==1)
            cmd_digital_out(1,ledPin,1);
            sleep(100);
        else if(cmd_digital_in(1,dataPin)==0)
                cmd_digital_out(1,ledPin,0);
                sleep(100);
            end
        end
        
        value2(i,i)=cmd_digital_in(1,dataPin);
        
        value=value | value2(i,:);
        
        cmd_digital_out(1,clockPin,1);
        cmd_digital_out(1,clockLed,1);
        sleep(500);
        cmd_digital_out(1,clockPin,0);
        cmd_digital_out(1,clockLed,0); //clockLED: Led indicating clock pulses
        sleep(400);
    end
    
    //after every clock pulse, 1 right shift occurs for every bit
    //thus after 8 clock pulses, the entire parallel input is shifted out, and obtained at the dataPin, one bit per clock pulse
    //Thus we get the bit by bit serial output of the Parallel Load
    
    disp(value);
        
        
   
endfunction
