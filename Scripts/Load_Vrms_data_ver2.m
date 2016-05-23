% Script to load preprocessed slotted data and find peaks to computed Vpeak and Vrms

clc;
% clear all;
% close all;

Path1 = 'NET_Vrms_Dataset_March';
% load Vrms data measured in all the experiments
Vrms = [];

% Load March10 Data
load(strcat(Path1,'10','.mat'));
Vrms = [Vrms; net_Vrms];
% Load March16 Data
load(strcat(Path1,'16','.mat'));
Vrms = [Vrms; net_Vrms];
% Load March24 Data
load(strcat(Path1,'24','.mat'));
Vrms = [Vrms; net_Vrms];


%% Plot the Vrms data measured in all calibrator seq

for i=3:22
    plot(Vrms(i,:),'b-*');
    hold on;
    plot(Vrms(1,:),'r-*');
    plot(Vrms(2,:),'g-*');
    xlabel('Appliances (increasing order of power ratings)');
    ylabel('Measured Voltage');
    xlim([1 15]);
    set(gca,'XTick',[0:1:15])
%     ylim([2.1*10^-5 3.8*10^-5])
    grid on;
end

saveas(gcf,strcat('Plot_Vrms_Cal_seq10','.png'));
% close all;
%%

% Save Vrms dataset
% net_Vrms = [net_Vrms; Exp_3; Exp_4];
save('NET_Vrms_Dataset.mat','Vrms');






