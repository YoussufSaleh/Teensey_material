% TrigStuff

clear


%% 

dataFolder = 'C:/Users/jpgro/OneDrive - Nexus365/Other/EEG/OpenVibe/erp-recording/signals';
% fileName = 'triggerTest.csv';
fileName = 'TrioRewardCue3_3.csv';

file = fullfile(dataFolder,fileName);

% load up sample data

data = xlsread(file);

t = data(:,1); % sample time
sampleFreq = 2048; % 1 ./ mean(diff(t)); % sample frequency

trigChannel = data(:,74); % trigger channel value

%% get times of triggers

trigInds = FindTriggers(trigChannel); % find when crosses 1000

trigTimes = t(trigInds); % get times of start and end

trigLength = diff(trigTimes,1,2) * 1000; % length of code in ms

trigCodes = round(trigLength/3)*3; % round to get code values
% codes are 3:3:36, there is some variance in timing due to device drift,
% so we can correct by doing round(trigLength/3)*3



