% Script to load preprocessed slotted data and find peaks to computed Vpeak and Vrms

clc;
clear all;
close all;

Path3 = 'EXP-10';
Path1 = strcat('cal-seq-180sec-march16-',Path3,'-extracted');
Path2 = './Processed_data/';
% load slotted waveform data for computation
load(strcat(Path1,'.mat'));

%% Chop the unneccessary transient signal in AUT-1

limit=1;

plot(data_ext(limit:end,1));

% % data for appliance-1 (which is chopped to remove transients)
AUT1_data(:,1) = data_ext(limit:end,1);
AUT1_time(:,1) = time_ext(limit:end,1);
% % data for remaining appliances (1-14)
for j=1:14
    AUT_data(:,j)=data_ext(:,j+1);
    AUT_time(:,j)=time_ext(:,j+1);    
end

%% Compute peaks from slotted waveforms

% Peak finder 
[pks,locs] = findpeaks(AUT1_data(:,1));
h=figure;
plot(AUT1_time(:,1),AUT1_data(:,1),'b');
hold on;
plot(AUT1_time(locs,1),pks,'r*');
saveas(h,strcat(Path2,Path3,'/Plot_AUT_1','.png'));
close all;
% Save the peak and slotted waveform* (if modified) in the processed folder
save(strcat(Path2,Path3,'/AUT_1','.mat'),'pks','locs');

for j=1:14
    [pks,locs] = findpeaks(AUT_data(:,j));
    % Plot the test signal and peak detection o/p
    h=figure;
    plot(AUT_time(:,j),AUT_data(:,j),'b');
    hold on;
    plot(AUT_time(locs,j),pks,'r*');
    saveas(h,strcat(Path2,Path3,'/Plot_AUT_',num2str(j+1),'.png'));
    close all;
    % Save the peak and slotted waveform* (if modified) in the processed folder
    save(strcat(Path2,Path3,'/AUT_',num2str(j+1),'.mat'),'pks','locs');
end




