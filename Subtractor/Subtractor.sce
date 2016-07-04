ok=open_serial(1,2,115200);
if ok~=0 then error('Unable to open serial port, please check'); end
for i=1:10000
    A=cmd_digital_in(1,5) //input
    B=cmd_digital_in(1,6) //input
    Bin=cmd_digital_in(1,3) //input Borrow in
    fsdiff=0
    fsnot=0
    fsb=0
    ssnot=0
    ssand=0
   
   //As according to the logic circuit of Full Subtractor
    //first half subtractor
        
        //difference
        //A XOR B
            if A==0 & B==0
                fsdiff=0
            else if A==1 & B==1
                fsdiff=0
            else        
                fsdiff=1
            end
            end
    
        //borrow out
        //A NOT
            if A==0 
                fsnot=1
            else
                fsnot=0
            end
        
        //B AND fsnot
            if B==1 & fsnot==1
                fsb=1
            else
                fsb=0
            end
    
    
    //second half subtractor
    
        //difference
        //fsdiff XOR Bin
            if fsdiff==0 & Bin==0
                cmd_digital_out(1,9,0)
                sleep(5)
            else if fsdiff==1 & Bin==1
                cmd_digital_out(1,9,0)
                sleep(5)
            else        
                cmd_digital_out(1,9,1)
                sleep(5)
            end
            end
            
         //borrow out
         //fsdiff NOT
            if fsdiff==0 
                ssnot=1
            else
                ssnot=0
            end
            
         //Bin AND ssnot
            if Bin==1 & ssnot==1
                ssand=1
            else
                ssand=0
            end
            
            
            
         //ssand OR fsb
            if ssand==0 & fsb==0
             cmd_digital_out(1,10,0)
                sleep(5)
            else
                cmd_digital_out(1,10,1)
                sleep(5)
            end
          
end
close_serial(1)
    
