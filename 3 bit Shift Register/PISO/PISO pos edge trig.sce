ok=open_serial(1,2,115200);
if ok~=0 then error('Unable to open serial port, please check'); end
D2=0; //MSB input
D1=0; //middle bit input= MSB output
D0=0; //LSB input= middle bit output
Q=0; //LSB output

//order of FFs: FF2-FF1-FF0

pinstate=0;
lastpinstate=0;

sl=0; //shift/!load

for i=1:1000
    
    if (D0==0)
        cmd_digital_out(1,9,0)
        sleep(50)
    else
        cmd_digital_out(1,9,1)
        sleep(50)
    end
    
    sl=cmd_digital_in(1,3) //reads the state of Shift/!Load
    pinstate=cmd_digital_in(1,2) //reads the state of clock
    
    //clock is common for all FFs thus only 1 if statement is required for detecting positive edge of clock
    
    //positive edge
    if (pinstate~=lastpinstate)
        if (pinstate==1)
            
            if(sl==0) //parallel load mode
                //Reads and stores the parallel inputs
                D2=cmd_digital_in(1,7) //MSB
                D1=cmd_digital_in(1,6) //middle bit
                D0=cmd_digital_in(1,5) //LSB
            end
            
            if (sl==1) //serial shift mode
                
                //Shifts the loaded data serially
                //FF0
                if (D0==0)
                    Q=0;
                else
                    Q=1;
                end
                
                //FF1
                if(D1==0)
                    D0=0;
                else
                    D0=1;
                end
                
                //FF2
                if(D2==0)
                    D1=0;
                else
                    D1=1;
                end
                D2=0
            end
            sleep(50)
        end
        lastpinstate=pinstate;
    end
end
close_serial(1)
