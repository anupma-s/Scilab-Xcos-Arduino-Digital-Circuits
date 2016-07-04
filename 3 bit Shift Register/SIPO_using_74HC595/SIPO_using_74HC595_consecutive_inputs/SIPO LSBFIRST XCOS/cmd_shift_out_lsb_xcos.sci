function [y]=cmd_shift_out_lsb_xcos(dataPin,clockPin,latchPin)
    
    pinstate=0; //represents state of clock
    data=[0 0 0 0 0 0 0 0]; // an 8-elements matrix represents an 8 bit binary number
    y=0;
    
    for j=1:250
    
        pinstate=cmd_digital_in(1,5) //reads the state of serial input pin
        
        if(pinstate==1)
            //data=[(data(1) | 1) (data(2) | 0) (data(3) | 0) (data(4) | 0) (data(5) | 0) (data(6) | 0) (data(7) | 0) (data(8) | 0)];
            data=data | [1 0 0 0 0 0 0 0];
            //the msb becomes 1 as input is given
            //high which is henceforth shifted
        end
        disp(data)
        
        cmd_digital_out(1,latchPin,0)
        
        val1=[0 0 0 0 0 0 0 0]; //output matrix.
        //If all elements of the matrix are 0,
        //output pinstate will be 0 (i.e LOW).
        //If even 1 of the elements of the matrix is 1,
        //output pinstate will be 1 (i.e HIGH)
        val2=0; 
        mat=[0 0 0 0 0 0 0 1;0 0 0 0 0 0 1 0;0 0 0 0 0 1 0 0;0 0 0 0 1 0 0 0;0 0 0 1 0 0 0 0;0 0 1 0 0 0 0 0;0 1 0 0 0 0 0 0; 1 0 0 0 0 0 0 0];
        
        for i=1:8
            //val1=[(val(1) & mat(i,1)) (val(2) & mat(i,2)) (val(3) & mat(i,3)) (val(4) & mat(i,4)) (val(5) & mat(i,5)) (val(6) & mat(i,6)) (val(7) & mat(i,7)) (val(8) & mat(i,8)) ];
            val1=(data & mat(i,:));
            //disp(val1);
            val2=sum(val1); //adds the elements of matrix
            if val2==0
                val3=0;
            else
                val3=1;
            end
            disp(val2);
            
            
                cmd_digital_out(1,dataPin,val3);
            
            cmd_digital_out(1,clockPin,1);
            cmd_digital_out(1,clockPin,0);
            
        end
        
        cmd_digital_out(1,latchPin,1)
        
        sleep(500)
        for k=1:7
            data(9-k)=data(8-k);
            //every element of the matrix is
            //shifted one place to the right
            //so effectively the 8 bit
            //binary number is divided by 2
        end
        data(1)=0
    
    end
    y=0;  
    
endfunction

