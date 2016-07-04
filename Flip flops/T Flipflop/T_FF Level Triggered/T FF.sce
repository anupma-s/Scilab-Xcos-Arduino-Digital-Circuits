ok=open_serial(1,2,115200);
if ok~=0 then error('Unable to open serial port, please check'); end
//assuming initially, Q01 & Qbar=0
Q=1;
Qbar=0;
temp=0;

TPin=5;
QPin=9;
QbarPin=10;
clockPin=2; //external clock input

for i=1:1000
    
    if(Q==1)
        cmd_digital_out(1,QPin,1)
        cmd_digital_out(1,QbarPin,0)
        sleep(100)
        
    else
        cmd_digital_out(1,QPin,0)
        cmd_digital_out(1,QbarPin,1)
        sleep(100)
    end
    
    if(cmd_digital_in(1,clockPin)==1)
        
        T=cmd_digital_in(1,TPin)
        
        if(T==1)
             temp=Q
             Q=Qbar
             Qbar=temp
         end
     end
     
     
    
    
    end
close_serial(1)
