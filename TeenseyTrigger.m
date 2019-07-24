function TeenseyTrigger(portHandle, trigValue)
% TeenseyTrigger(portHandle, trigValue)
% Communicates with the serial port (send command, flush, read output)
% Inputs:
%           portHandle is the handle object for the communication port to
%               the Teensey device, setup via TeenseyInit()
%           trigValue is the value of the trigger you wish to send. This
%               should be an integer value (or whole double), as will be
%               the duration (ms) of the pulse sent to the device. i.e.
%               trigValue = 4 will send a pulse of 4ms duration

pinNumber = 2;% pin number that is connected in the teensey board

% code is in value pinNumber, po (pin, outputmode), 1w (write 1),
% trigValue,m (wait for trigValue duration), 0w (write 0)
% so it sends a pulse, waits a duration, turns it off
fprintf(portHandle, '%dpo1w%dm0w', pinNumber, trigValue);

flushinput(portHandle); % empty input buffer
flushoutput(portHandle); % empty output buffer

end