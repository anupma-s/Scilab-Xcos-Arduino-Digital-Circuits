//MSBFIRST
function[]= cmd_shift_out_msb(dataPin,clockPin,val)
    val1=[0 0 0 0 0 0 0 0]; //output matrix.
    //If all elements of the matrix are 0,
    //output pinstate will be 0 (i.e LOW).
    //If 1 or more elements of the matrix is 1,
    //output pinstate will be 1 (i.e HIGH)
    val2=0; 
    mat=[1 0 0 0 0 0 0 0;0 1 0 0 0 0 0 0;0 0 1 0 0 0 0 0;0 0 0 1 0 0 0 0;0 0 0 0 1 0 0 0;0 0 0 0 0 1 0 0;0 0 0 0 0 0 1 0; 0 0 0 0 0 0 0 1];
    for i=1:8
        //val1=[(val(1) & mat(i,1)) (val(2) & mat(i,2)) (val(3) & mat(i,3)) (val(4) & mat(i,4)) (val(5) & mat(i,5)) (val(6) & mat(i,6)) (val(7) & mat(i,7)) (val(8) & mat(i,8)) ];
        val1=(val & mat(i,:));
        //disp(val1);
        val2=sum(val1); //adds the elements of matrix
        if val2==0
            val3=0;
        else
            val3=1;
        end
        disp(val2);
        
        
            cmd_digital_out(1,dataPin,val3);
        
        //1 clock pulse
        cmd_digital_out(1,clockPin,1);
        cmd_digital_out(1,clockPin,0);
        
    end
    
endfunction
