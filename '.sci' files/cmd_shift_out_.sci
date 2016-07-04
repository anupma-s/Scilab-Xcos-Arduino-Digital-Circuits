function[]= cmd_shift_out_(dataPin,clockPin,inPin)
    
    disp ("Give serial input: ")
        sleep(250)
        cmd_digital_out(1,dataPin,cmd_digital_in(1,inPin))//if inPin is HIGH i.e. if input is given, write HIGH on Serial In Pin of IC
        disp("Serial input stored: ")
    
        cmd_digital_out(1,clockPin,1)
        
        cmd_digital_out(1,clockPin,0)
        sleep(150) 

endfunction
