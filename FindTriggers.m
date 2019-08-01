function trigTimes = FindTriggers(channelData, threshold)

if ~exist('threshold','var')
    threshold = 1000; % threshold to cross for detection
end

trigTimes = [];

startInd = 1; % index to start at
go = true;
while go
    % find first crossing of threshold
    
    i = size(trigTimes,1);
    trigStart = startInd - 1 + find(channelData(startInd:end) > threshold, 1);
    
    if trigStart % if there is one
        trigTimes(i+1,1) = trigStart; % store it
        
        startInd = trigStart + 1; % index for next search
        
        % find where it crosses back 
        trigEnd = startInd - 1 + find(channelData(startInd:end) < threshold, 1);
        
        if trigEnd
            trigTimes(i+1,2) = trigEnd; % store
            
            startInd = trigEnd + 1; % where to start next search
             
        else
            go = false;
        end
    else
        go = false;
    end
   
end