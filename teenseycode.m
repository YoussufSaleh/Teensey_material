% Opens a serial port session
try
% fclose closes a file whose ID is typically contained within the brackets.
% instrfind finds communication interface bobjects with specified property
% values. 
 
    fclose(instrfind) ;
    
end
s = serial('COM4'); % Here you need to make sure you know the name of the serial port
try
    fopen(s);
catch ME % in case it didn't work the first time
    if (strcmp(ME.identifier,'MATLAB:serial:fopen:opfailed'))
        fclose(instrfind);
        fopen(s);
    end
 
end
% Communicates with the serial port (send command, flush, read output)
%
%  fprintf(s,'2pw');
 fprintf(s,'2po1w100m0w')
 flushinput(s)
 flushoutput(s)
 % This is the way you communicate with the device. In my case I want to send the '0e1s' command to the arduino.
flushinput(s); % This is in case you want to flush the buffer
%sscanf(bs(2),'%d'); % This is to query outputs from the device
 
% Close the serial port session
 
fclose(s);