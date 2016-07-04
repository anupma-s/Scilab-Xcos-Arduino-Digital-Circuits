ok=open_serial(1,2,115200);
if ok~=0 then error('enable to read serial port'); end
for i=1:10000
    A=cmd_digital_in(1,5) //input A
    B=cmd_digital_in(1,6) //input B
    C=cmd_digital_in(1,3) //input Carry in (Cin)
    P=0 //Pi
    G=0 //Gi
    temp=0
    
    //As according to the logic circuit of Full Adder
    
    //to get Pi: XOR of A & B
    if A==0 & B==0
        P=0
    else if A==1 & B==1
        P=0
    else        
        P=1
    end
    end

    //to get Gi: AND of A & B
    if A==1 & B==1
        G=1
    else
        G=0
    end
    
    
    //to get SUM: XOR of Pi & Cin
    if P==0 & C==0
        cmd_digital_out(1,9,0)
        sleep(5)
    else if P==1 & C==1
        cmd_digital_out(1,9,0)
        sleep(5)
    else        
        cmd_digital_out(1,9,1)
        sleep(5)
    end
    end
    
    //to get Carry out
    
    //AND of Pi & Cin
    if P==1 & C==1
        temp=1
    else
        temp=0
    end
    
    //OR of Gi and temp
    if G==0 & temp==0
        cmd_digital_out(1,10,0)
        sleep(5)
    else
        cmd_digital_out(1,10,1)
        sleep(5)
    end
end
close_serial(1)
