ok=open_serial(1,2,115200);
if ok~=0 then error('Unable to open serial port, please check'); end
//assuming initially, Q=0 & Qbar=1
Q=0;
Qbar=1;
temp=0;
pinstate=0;
lastpinstate=0;

TPin=5;
QPin=9;
QbarPin=10;
clockPin=2; //external clock input

for i=1:1000
    
    if(Q==1)
        cmd_digital_out(1,QPin,1)
        cmd_digital_out(1,QbarPin,0)
        sleep(100)
        
    else if(Q==0)
        cmd_digital_out(1,QPin,0)
        cmd_digital_out(1,QbarPin,1)
        sleep(100)
    end
    end
    
    pinstate=cmd_digital_in(1,clockPin); //reads clock input
    
        //negative edge
        if(pinstate~=lastpinstate)
            if(pinstate==0)
                T=cmd_digital_in(1,TPin) //reads input T
                if(T==1)
                    //toggle
                    temp=Q
                    Q=Qbar
                    Qbar=temp
                else
            end
            
        end
        sleep(50)
    end
lastpinstate=pinstate;
end
close_serial(1)
