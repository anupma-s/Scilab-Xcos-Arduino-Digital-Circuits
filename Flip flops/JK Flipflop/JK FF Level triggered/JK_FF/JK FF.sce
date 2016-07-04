ok=open_serial(1,2,115200);
if ok~=0 then error('Unable to open serial port, please check'); end

J=0;
K=0;

//assuming initially, Q=0 & Qbar=1
Q=0;
Qbar=1;

temp=0;

pre=0;
clr=0;

JPin=5;//input J is given to pin 5
KPin=6;// input K is given to pin 6

QPin=9;//output Q is seen at pin 9
QbarPin=10;//output Qbar is seen at pin 10

prePin=3;//Preset input is given to pin 3
clrPin=4;//Clear input is given to pin 4
//Preset and Clear are asynchronous inputs (independent of clock)

clockPin=2;//external clock is given to pin 2

for j=1:1000
    if Q==0
        cmd_digital_out(1,9,0)
        cmd_digital_out(1,10,1)
        sleep(100)
    end
    
    if Q==1
        cmd_digital_out(1,9,1)
        cmd_digital_out(1,10,0)
        sleep(100)
    end
    
    J=cmd_digital_in(1,JPin)
    K=cmd_digital_in(1,KPin)
    
    pre=cmd_digital_in(1,prePin)
    clr=cmd_digital_in(1,clrPin)
    //Preset and Clear are active low inputs, i.e, flip flop functions normally when pre==HIGH & clr==HIGH
    
    if (pre==0 & clr==1)
        Q=1
        Qbar=0
    else if(pre==1 & clr==0)
            Q=0
            Qbar=1
        else if(pre==1 & clr==1)
                if(cmd_digital_in(1,clockPin)==1)//Reads the input at clockPin and executes only if input is high
                    
                    if (J==0 & K==1)
                        Q=0
                        Qbar=1
                     end
                                           
                    if (J==1 & K==0)
                        Q=1
                        Qbar=0
                    end
                    
                    //toggle state                       
                    if (J==1 & K==1)
                         temp=Q
                         Q=Qbar
                         Qbar=temp
                     end

                    end
                end
            end
        end
    end
close_serial(1)
