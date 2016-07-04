function[y]=cmd_shift_in_xcos(dataPin,clockPin,latchPin,ledPin,clockLed)
    
    dataPinout=O;
    cmd_digital_out(1,latchPin,1)// parallel load mode

    for j=1:10 //to perform 10 iterations of parallel loading
        disp('Give input, Parallel load mode')
        
        sleep(2000)
        cmd_digital_out(1,clockPin,1) //positive edge of clock pulse
        disp('Inputs stored, Serial shift mode:')
        sleep(500)
        cmd_digital_out(1,clockPin,0)//negative edge of clock pulse
        cmd_digital_out(1,latchPin,0)// serial out mode
        
        value=zeros(1,8);//matrix representing 8 bit number
        value2=zeros(8,8);
        
        for i=1:8
            dataPinout=cmd_digital_in(1,dataPin);//reads input at the dataPin given by the register as its LSB 
            disp(dataPinout);
            
            if(dataPinout==1)
                cmd_digital_out(1,ledPin,1); //Led glows
                sleep(100);
            else if(dataPinout==0)
                    cmd_digital_out(1,ledPin,0);
                    sleep(100);
                end
            end
            
            value2(i,i)=cmd_digital_in(1,dataPin); //sets the (i,i)th element  of 8x8 zeros matrix as the logic level of the serial data out of register
            
            value = value | value2((i),:);
            
            cmd_digital_out(1,clockPin,1); cmd_digital_out(1,clockLed,1);
            sleep(100);
            cmd_digital_out(1,clockPin,0);cmd_digital_out(1,clockLed,0);
        end
        
        cmd_digital_out(1,latchPin,1);
        y=value;
    disp(y);
    
    
    
    
    end
endfunction
    
