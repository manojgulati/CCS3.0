% Script to load preprocessed slotted data and find peaks to computed Vpeak and Vrms

clc;
clear all;
close all;

Path3 = 'Exp-10';
Path1 = strcat('cal-seq-180sec-march24-',Path3,'-extracted');
Path2 = './Processed_data/';
% load slotted waveform data for computation
load(strcat(Path1,'.mat'));

%% Chop the unneccessary transient signal in AUT-1

limit=1;

plot(data_ext(limit:end,1));

%% data for appliance-1 (which is chopped to remove transients)
AUT1_data(:,1) = data_ext(limit:end,1);
AUT1_time(:,1) = time_ext(limit:end,1);
% % data for remaining appliances (1-14)
for j=1:14
    AUT_data(:,j)=data_ext(:,j+1);
    AUT_time(:,j)=time_ext(:,j+1);    
end

% % Compute peaks from slotted waveforms

AUT1_demean = AUT1_data - mean(AUT1_data);
AUT1_rms = rms(AUT1_demean);

for j=1:14
    AUT_demean(:,j) = AUT_data(:,j) - mean(AUT_data(:,j));
    AUT_rms(j) = rms(AUT_demean(:,j));
end
Vrms = [AUT1_rms AUT_rms];

save(strcat(Path2,Path3,'.mat'),'Vrms');
