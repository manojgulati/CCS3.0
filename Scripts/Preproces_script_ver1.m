% Preprocess calibrator data for extracting features
% Manoj Gulati
% IIIT-Delhi

clc;
clear all;
close all;

Path1 = '';
Path2 = 'cal-seq-180sec-march24-EXP-10';

load(strcat(Path1,Path2,'.mat'));

%% Select and chop off guard intervals

start_slot = 5600000;
% 5280000
end_slot = start_slot+150*250000;

plot(time(start_slot:end_slot),y(start_slot:end_slot,1),'b')
% xlabel('Time (in seconds)')
% ylabel('Amplitude (in volts)')
% legend('Filtering data')
% ylim([-.0002 .0003])
grid on;
% xlim([0 220]); 
% set(gca,'XTick',[0:10:220])
% title('MCB-1A')

%% Save extracted waveform 

% time_extracted = time(start_slot:end_slot);
% y_extracted = y(start_slot:end_slot,1);
% 
% save(strcat(Path2,'_extracted','.mat'),'time_extracted','y_extracted');


%% Extract slotted waveforms
clc;
time_ext =[];
offset = 2500000; 
for j=1:15
    % Prepare a fine grained load activation time slots
%     time_slot = start_slot+j*10*250000;
    % Time extracted for each load activation
    time_ext(:,j) = time((start_slot+(j-1)*offset):(start_slot+(j*offset)));
    % Data extracted for each load activation
    data_ext(:,j) = y((start_slot+(j-1)*offset):(start_slot+(j*offset))); 
end

% % save slotted waveforms
save(strcat(Path2,'-extracted','.mat'),'time_ext','data_ext');
clear all;





