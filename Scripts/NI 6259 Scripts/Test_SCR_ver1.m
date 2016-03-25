% Manoj Gulati
% PhD-1327
clc;
clear all;
close all;

Logtime = 20;

Fs = 250000; % 500 kHz
s = daq.createSession('ni');
s.addAnalogInputChannel('Dev3','ai0','Voltage');
s.addAnalogInputChannel('Dev3','ai3','Voltage'); 
s.addAnalogInputChannel('Dev3','ai16','Voltage'); 
s.addAnalogInputChannel('Dev3','ai19','Voltage'); 
s.Rate = Fs;

s.DurationInSeconds = Logtime;
disp('Data collection started..\n')
[data time]=s.startForeground(); %% Understand if we can add some tick counter around this.
disp('Data collection over..\n')

%%
save('EXP-7.mat','data','time');