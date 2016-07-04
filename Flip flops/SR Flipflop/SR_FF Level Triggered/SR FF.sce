ok=open_serial(1,2,115200);
if ok~=0 then error('Unable to open serial port, please check'); end

S=0;
R=0;

SPin=5; //Input S is given to Pin 5
RPin=6; //Input R is given to Pin 6

//assuming initially, Q=0 & Qbar=1
Q=0;
Qbar=1;

QPin=9;
QbarPin=10;

clockPin=2; //external clock

for i=1:1000 //Runs the program 1000 times in a loop
    
    if Q==0
        cmd_digital_out(1,QPin,0) //Gives low output at Q
    end
    
    if Q==1
        cmd_digital_out(1,QPin,1) // Gives high output at Q
    end
    
    if Qbar==0
        cmd_digital_out(1,QbarPin,0) //Gives low output at Qbar
    end
    
    if Qbar==1
        cmd_digital_out(1,QbarPin,1) //Gives high output at Qbar
    end
    
    S=cmd_digital_in(1,SPin) //Reads the input S
    R=cmd_digital_in(1,RPin) //Reads the input R
    
    if(cmd_digital_in(1,clockPin)==1)
        if (S==0 & R==1)
            Q=0
            Qbar=1
        else if (S==1 & R==0)
            Q=1
            Qbar=0
        else if (S==1 & R==1) //we assume this case doesn't occur
            Q=0
            Qbar=0
        end
    end
    
end
end
   
    
    
    
end
close_serial(1)
