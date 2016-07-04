ok=open_serial(1,2,115200);
if ok~=0 then error('Unable to open serial port, please check'); end

J=0;
K=0;

S=0;
R=1;//since we assume initially Qbar=1

pinstate=0;
lastpinstate=0;

Q=0;
Qbar=1;
//we assume initially Q=0 & Qbar=1
pre=0;
clr=0;

temp=0;

JPin=5;
KPin=6;

QPin=9;
QbarPin=10;

prePin=3; //Preset
clrPin=4; //Clear
//Preset and clear are active low inputs, thus both should be ihgh for normal functining of flipflop

clockPin=2;



for i=1:500
    
    if(Q==0)
        cmd_digital_out(1,QPin,0)
        cmd_digital_out(1,QbarPin,1)
        sleep(100)
    end
    
    if(Q==1)
        cmd_digital_out(1,QPin,1)
        cmd_digital_out(1,QbarPin,0)
        sleep(100)
    end
    
    pre=cmd_digital_in(1,prePin)
    clr=cmd_digital_in(1,clrPin)
    
    if(pre==0 & clr==1) //preset is active
        Q=1;
    end
    if (pre==1 & clr==0) //clear is active
            Q=0;
    end
    if (pre==1 & clr==1) //both preset and clear are inactive
                    
                pinstate=cmd_digital_in(1,clockPin)
                
                 if(pinstate~=lastpinstate)
                    if(pinstate==1) //master ff is active during positive level. It stores the inputs
                        
                        //JK FF code
                        J=cmd_digital_in(1,JPin)
                        K=cmd_digital_in(1,KPin)
                        
                        if(J==0 &K==1)
                            S=0
                            R=1
                        end
                        
                        if(J==1 & K==0)
                            S=1
                            R=0
                        end
                        
                        if(J==1 & K==1)
                            temp=S
                            S=R
                            R=temp
                         
                        end
                    end
                    
                    
                    if(pinstate==0) //slave FF is active, it shows the output
                        
                        //JK FF code only for state 01 and 10
                        
                        if(S==0 & R==1)
                            Q=0;
                        end
                        
                        if(S==1 & R==0)
                            Q=1;
                        end
                    end
                    
                    sleep(50)
                end
            
        lastpinstate=pinstate;
    end

    
       
    
            
end


close_serial(1)
