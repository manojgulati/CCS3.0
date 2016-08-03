clear all;
close all;
clc;


% Sampling rate 
Fs = 10000;
Logtime=300; % loging time in seconds

var_length1 = 32;
var_length2 = 16;

s = daq.createSession('ni');
% Add all DAQ boxes [Dev1:6259, Dev2:6259, Dev3:6216, Dev4:6216]
s.addAnalogInputChannel('Dev1',[0:7,16:23],'Voltage');
s.addAnalogInputChannel('Dev2',[0:7,16:23],'Voltage');
s.addAnalogInputChannel('Dev3',[0:7],'Voltage');
s.addAnalogInputChannel('Dev4',[0:7],'Voltage');

% Dev1/PFI0 is providing start trigger for all DAQ boxes
s.addTriggerConnection('Dev1/PFI0','Dev2/PFI0','StartTrigger')
s.addTriggerConnection('Dev1/PFI0','Dev3/PFI0','StartTrigger')
s.addTriggerConnection('Dev1/PFI0','Dev4/PFI0','StartTrigger')
% Dev1/PFI1 is providing clock signal for all DAQ boxes
s.addClockConnection('Dev1/PFI1','Dev2/PFI1','ScanClock')
s.addClockConnection('Dev1/PFI1','Dev3/PFI1','ScanClock')
s.addClockConnection('Dev1/PFI1','Dev4/PFI1','ScanClock')

% Define dynamic range for sensing coil channels
for j=1:var_length1
    s.Channels(j).Range = [-.1 .1];
end
% Define dynamic range for CT channels
for i=j+1:j+var_length2
    s.Channels(i).Range = [-.2 .2];
end
% Define sampling rate
s.Rate = Fs;

s.DurationInSeconds = Logtime;
disp('Data collection started..\n')
[data time]=s.startForeground(); %% Understand if we can add some tick counter around this.
disp('Data collection over..\n')

save('EXP-1.mat','data','time');





