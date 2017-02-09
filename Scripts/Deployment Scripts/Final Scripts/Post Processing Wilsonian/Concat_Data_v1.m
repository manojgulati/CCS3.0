% Concatinating measured data from CTs 
% Author Name :- Manoj Gulati
% IIIT-Delhi

close all;
clear all;
clc;

% Num_Sensors = 20;
Actual_CT_ch = 4;

% Td = 300; % Time Duration
Breaker_labels = {'12_r1','5_r1','6_r2','7_r1'};

Path2 = 'CAL_SEQ_BRK-';

Data_SEL = [];
for i=1:Actual_CT_ch
    load(strcat(Path2,char(Breaker_labels(i)),'_Filtered_Data.mat'));
    Data_SEL = [Data_Filt(:,1:5),Data_Filt(:,7:10),Data_Filt(:,13:16),Data_Filt(:,19),Data_Filt(:,18),Data_Filt(:,17)];

%     Data_SEL = [Data_Filt(:,1:13),Data_Filt(:,16),Data_Filt(:,15),Data_Filt(:,14)];

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





