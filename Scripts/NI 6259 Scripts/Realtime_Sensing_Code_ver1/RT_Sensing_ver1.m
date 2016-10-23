% Continous measurement and real time processing code for NI DAQ
% Author Name :- Manoj Gulati
% IIIT-Delhi

close all;
clear all;
clc;

% Logtime = 200;
Fs = 10000; % 500 kHz
s = daq.createSession('ni');
s.addAnalogInputChannel('Dev1',[0 1 2 3 4 5],'Voltage');
for j=1:6
    s.Channels(j).Range = [-.1 .1];
end
% Define sampling rate for data acq
s.Rate = Fs;
% Define logtime (not required in continous sampling applications)
% s.DurationInSeconds = Logtime;

% Interrupt interval
s.NotifyWhenDataAvailableExceeds = Fs;

% Open a file handle to dump data
% fid = fopen('data2.bin','w');

% Define interrupt event
lh = s.addlistener('DataAvailable',@(src, event)Dump_data(src, event, Fs));
% lh = s.addlistener('DataAvailable',@(src,event) fwrite(fid,[datestr(clock,0) event.Data]','double'));

% Define if sampling is done continously
s.IsContinuous = true;

disp('Data collection started');
s.startBackground(); % Start data acq. process in background

% Wait till data acq. is over (not required in background acq. case)
% s.wait();
%%
% Terminate data acquisition
% fclose(fid);
s.stop();
delete(lh);
%%
clear all;
clc;
% Read logged file
fid = fopen('data2.bin','r');
rows = fread(fid, 1, 'uint64');
cols = fread(fid, 1, 'uint64');
matrix = fread(fid, [rows cols], 'double');
% data = fread(fid,'double');
fclose(fid);
% plot(data);






