% Script to load preprocessed slotted data and find peaks to computed Vpeak and Vrms

clc;
% clear all;
% close all;

Path3 = 'EXP-';
Path1 = './Processed_data1/';
% load Vrms data measured in all the experiments
net_Vrms = [];

% for j=1:10
%     load(strcat(Path1,Path3,num2str(j),'.mat'));
%     net_Vrms = [net_Vrms; Vrms];
% end
load('exp3.mat');
net_Vrms = [net_Vrms; Vrms];
load('exp4.mat');
net_Vrms = [net_Vrms; Vrms];


%% Plot the Vrms data measured in all calibrator seq

for i=1:10
    plot(net_Vrms(i,:),'b-*');
    hold on;
%     plot(net_Vrms(11,:),'r-*');
%     plot(net_Vrms(12,:),'g-*');
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
save('NET_Vrms_Dataset_March10.mat','net_Vrms');






