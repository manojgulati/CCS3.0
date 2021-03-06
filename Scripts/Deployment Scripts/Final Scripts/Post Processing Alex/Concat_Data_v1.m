% Concatinating measured data from CTs [Alex's Apartment]
% Author Name :- Manoj Gulati
% IIIT-Delhi

close all;
clear all;
clc;

Num_Sensors = 19;
Actual_CT_ch = 7;

% Td = 300; % Time Duration
Breaker_labels = {'2_r1','4_r1','6_r1','8_r1','10_r1','14_r1','16_r1'};

Path2 = 'CAL_SEQ_BRK-';

Data_SEL = [];
for i=1:Actual_CT_ch
    load(strcat(Path2,char(Breaker_labels(i)),'_Filtered_Data.mat'));
    Data_SEL = [Data_Filt(:,1:5),Data_Filt(:,7:11),Data_Filt(:,13:21)];

    save(strcat('Data_Filt_Sel',char(Breaker_labels(i)),'.mat'),'time','Data_SEL');
    clear Data_Filt; 
    clear Data_SEL;
end


%% Plot selected data

for i=1:16
    a(i) = subplot(4,4,i);
    plot(time, Data_SEL(:,i));
    grid on;
    
end





