clear all;
close all;
clc;


% Sampling rate 
Fs = 10000;
Logtime=200; % loging time in seconds

var_length1 = 16;
var_length2 = 12;

s = daq.createSession('ni');
s.addAnalogInputChannel('Dev2',[0:7,16:23],'Voltage');
s.addAnalogInputChannel('Dev1',[0:7,16:19],'Voltage');

s.addTriggerConnection('Dev1/PFI4','Dev2/PFI0','StartTrigger')
s.addClockConnection('Dev1/PFI5','Dev2/PFI1','ScanClock')

% Define dynamic range for sensing coil channels
for j=1:var_length1
    s.Channels(j).Range = [-.1 .1];
end
% Define dynamic range for CT channels
for j=1:var_length2
    s.Channels(j).Range = [-.2 .2];
end
% Define sampling rate
s.Rate = Fs;

s.DurationInSeconds = Logtime;
disp('Data collection started..\n')
[data time]=s.startForeground(); %% Understand if we can add some tick counter around this.
disp('Data collection over..\n')

save('EXP-1.mat','data','time');





