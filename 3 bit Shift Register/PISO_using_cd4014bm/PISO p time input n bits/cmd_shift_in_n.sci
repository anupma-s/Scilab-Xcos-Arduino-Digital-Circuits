function []= cmd_shift_in_n(dataPin,clockPin,ledPin,clockLed,numBits)
    n=numBits; //no. of bits
    value=zeros(1,n); //1xn array of all 0s to store the n bits of the inputs together
    value2=zeros(n,n); //nxn array of all 0s
    
    for i=1:n //n iterations since n bit input is given
        disp(cmd_digital_in(1,dataPin));
        
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
        
        // 1 clock pulse
        cmd_digital_out(1,clockPin,1);
        cmd_digital_out(1,clockLed,1);
        sleep(500);
        cmd_digital_out(1,clockPin,0);
        cmd_digital_out(1,clockLed,0); //clockLED: Led indicating clock pulses
        sleep(400);
    end
    
    disp(value);
        
        
   
endfunction
