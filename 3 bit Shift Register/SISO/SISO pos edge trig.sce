//3 bit SISO shift register
//in a SISO shift register, input is given to the MSB, it shifts rightwards with positive clock pulses and output is seen at LSB

ok=open_serial(1,2,115200);
if ok~=0 then error('Unable to open serial port, please check'); end
D2=0; //serial data input to FF2 (MSB FF) //Pin 2
D1=0; //D1=Q2, output of FF2=input of FF1 (middle bit FF)
D0=0; //D0=Q1, output of FF1=input of FF0 (LSB FF)

Q=0; //serial data out, output of FF0
//Output pin=9

pinstate=0; 
lastpinstate=0;

for i=1:5000
    
    if (D0==0)
        cmd_digital_out(1,9,0)
    else
        cmd_digital_out(1,9,1)
    end
    
    pinstate=cmd_digital_in(1,2) //reads the state of clock
    
    //clock is common for all FFs thus only 1 if statement for detecting positive edge of clock
    
    if (pinstate~=lastpinstate)
        if(pinstate==1)
            
            //order of FFs: FF2-FF1-FF0-serial output 
            //FF0 (LSB FF, i.e. third FF)
            if (D0==0)
                Q=0;
            else
                Q=1;
            end
            
            //FF1 (middle bit FF i.e. second FF)
            if(D1==0)
                D0=0;
            else
                D0=1;
            end
            
            //FF2 (MSB FF i.e first FF)
            if(D2==0)
                D1=0;
            else
                D1=1;
            end
            
            D2=cmd_digital_in(1,5) //input is given to D of FF2 (MSB FF)
        end
        
        sleep(50)
    end
    lastpinstate=pinstate;
end
close_serial(1)
