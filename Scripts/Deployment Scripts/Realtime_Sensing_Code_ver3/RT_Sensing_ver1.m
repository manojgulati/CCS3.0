% Continous measurement and real time processing code for NI DAQ
% Author Name :- Manoj Gulati
% IIIT-Delhi

close all;
clear all;
clc;

% Logtime = 200;
Fs = 10000; 
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

% Define sampling rate for data acq
s.Rate = Fs;

% Define logtime (not required in continous sampling applications)
% s.DurationInSeconds = Logtime;

% Interrupt interval
s.NotifyWhenDataAvailableExceeds = Fs;

% Open the filter handle to filter 60Hz component
F = BPF_60Hz(Fs);

% Define interrupt event
lh = s.addlistener('DataAvailable',@(src, event)Dump_data(src,event,Fs,F,num_sensors));
% lh = s.addlistener('DataAvailable',@(src,event) fwrite(fid,[datestr(clock,0) event.Data]','double'));

% Define if sampling is done continously
s.IsContinuous = true;

disp('Data collection started');
s.startBackground(); % Start data acq. process in background

% Wait till data acq. is over (not required in background acq. case)
% s.wait();

%% Terminate data acquisition
% fclose(fid);
s.stop();
delete(lh);
close all;
disp('Data collection stopped');








