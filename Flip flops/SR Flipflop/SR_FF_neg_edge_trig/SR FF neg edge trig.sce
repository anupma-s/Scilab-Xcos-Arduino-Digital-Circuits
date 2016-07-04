ok=open_serial(1,2,115200);
if ok~=0 then error('Unable to open serial port, please check'); end

S=0;
R=0;
Q=0;
Qbar=1;
SPin=5;
RPin=6;
QPin=9;
QbarPin=10;
clockPin=2; //external clock

pinstate=0;
lastpinstate=0;

for i=1:1000
    
    if(Q==0)
        cmd_digital_out(1,QPin,0)
    end
    
    if(Qbar=1)
        cmd_digital_out(1,QbarPin,1)
        sleep(100)
    end

    if(Q==1)
        cmd_digital_out(1,QPin,1)
    end
    
    if(Qbar=0)
        cmd_digital_out(1,QbarPin,0)
        sleep(100)
    end
    
    pinstate=cmd_digital_in(1,clockPin)
    
    if(pinstate~=lastpinstate) //edge triggered
        if(pinstate==0) //negative edge detection
            S=cmd_digital_in(1,SPin)
            R=cmd_digital_in(1,RPin)
            
            if(S==0 & R==1)
                Q=0;
            end
            if (S==1 & R==0)
                Q=1;
            end
            if(S==1 & R==1)
                Q=0;
                Qbar=0;
            end
            
        end
        
            
         sleep(50)
     end
     
        lastpinstate=pinstate;
    end
    


close_serial(1)
