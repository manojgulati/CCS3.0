% Manoj Gulati
% PhD-1327
clc;
clear all;
close all;

Logtime = 10;

Fs = 10000; % 500 kHz
s = daq.createSession('ni');
s.addAnalogInputChannel('Dev1','ai0','Voltage');
s.addAnalogInputChannel('Dev1','ai1','Voltage');

s.addAnalogInputChannel('Dev1','ai2','Voltage'); 
s.addAnalogInputChannel('Dev1','ai3','Voltage');

s.addAnalogInputChannel('Dev1','ai4','Voltage'); 
s.addAnalogInputChannel('Dev1','ai5','Voltage');

s.addAnalogInputChannel('Dev1','ai6','Voltage'); 
s.addAnalogInputChannel('Dev1','ai7','Voltage');

for j=1:8
    s.Channels(j).Range = [-0.1 0.1];
end
s.Rate = Fs;

s.DurationInSeconds = Logtime;
disp('Data collection started..\n')
[data time]=s.startForeground(); %% Understand if we can add some tick counter around this.
disp('Data collection over..\n')

%
save('EXP-13.mat','data','time');

% clear all;