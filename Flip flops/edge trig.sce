pinstate=0;
lastpinstate=0;

for i=1:200
    pinstate=cmd_digital_in(1,clockPin)
                
                 if(pinstate~=lastpinstate)
                    if(pinstate==1) //to detect positive edge. pinstate==0 to detect negative edge
                        //code to be performed
                    end
                    sleep(50)
                end
                lastpinstate=pinstate;
end
