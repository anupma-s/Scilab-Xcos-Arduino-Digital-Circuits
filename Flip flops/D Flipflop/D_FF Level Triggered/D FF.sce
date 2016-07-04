ok=open_serial(1,2,115200);
if ok~=0 then error('Unable to open serial port, please check'); end
//assuming initially, Q01 & Qbar=0
Q=0;
Qbar=1;
D=0;

Dpin=5; //input D is given to this pin
QPin=9; //output Q is obtained from this pin
QbarPin=10; //output Qbar is obtained from this pin
clockPin=2; //external clock is given to this pin


for i=1:1000
   
    
    if(Q==0)
        cmd_digital_out(1,QPin,0)
        cmd_digital_out(1,QbarPin,1)
        sleep(100)
    else
        cmd_digital_out(1,QPin,1)
        cmd_digital_out(1,QbarPin,0)
        sleep(100)
    end
    
    if(cmd_digital_in(1,clockPin)==1) //this executes only when the input given at clockPin is high i.e. Positive level triggered
        D=cmd_digital_in(1,DPin)
        
        if(D==0)
            Q=0
        else
            Q=1
        end
    end
end
close_serial(1)
