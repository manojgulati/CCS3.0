% Preprocess calibrator data for extracting features
% Manoj Gulati
% IIIT-Delhi

clc;
clear all;
close all;

Path1 = '';
Path2 = 'EXP-8_Filtered';

Fs = 10000; % Sampling frequency
Time_dur = 10; % Measurement time for each load configuration

num_channels = 6;
input_channel = 1;

load(strcat(Path1,Path2,'.mat'));

%% Select and chop off guard intervals

start_slot = 221000;
end_slot = start_slot+150*Fs;

plot(time(start_slot:end_slot),y(start_slot:end_slot,input_channel),'b')
grid on;
xlim([0 220]); 
set(gca,'XTick',[0:10:220])

%%
while (input_channel<=num_channels)

% % Extract slotted waveforms
clc;
time_ext =[];
offset = Fs*Time_dur; 
for j=1:15
    % Prepare a fine grained load activation time slots
    % time_slot = start_slot+j*10*250000;
    % Time extracted for each load activation
    time_ext(:,j) = time((start_slot+(j-1)*offset):(start_slot+(j*offset)));
    % Data extracted for each load activation
    data_ext(:,j) = y((start_slot+(j-1)*offset):(start_slot+(j*offset)),input_channel); 
end

% % save slotted waveforms
save(strcat(Path2,'_extracted_',num2str(input_channel),'.mat'),'time_ext','data_ext');

input_channel = input_channel+1;

end




