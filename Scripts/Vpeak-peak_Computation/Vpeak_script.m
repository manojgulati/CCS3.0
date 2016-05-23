% Script to computed Vpeak and Vrms from peaks computed from raw waveforms

clc;
clear all;
close all;

Path1 = './Processed_data(Exp-4)/';
Path2 = 'AUT_';

for i=1:15
    pks = [];
    % load slotted waveform data for computation
    load(strcat(Path1,Path2,num2str(i),'.mat'));
    eval(sprintf('X%d = pks'';',i));
end

% % Make box plot for Vpeak data from 15 appliances
% temp_var=[];
% grp=[];
% for i=1:15
%     eval(sprintf('temp_var = [temp_var X%d];',i));
%     eval(sprintf('grp = [grp i*ones(1,size(X%d,2))];',i));
% end
% boxplot(temp_var,grp);
% grid on;
% % ylim([0.6*10^-4 1.2*10^-4])
% xlabel('Different appliances');
% ylabel('Measured amplitude (volts)');
% % Compute average Vpeak from 10 seconds of calibrator sequence (15 appliances)  

for j=1:15
    eval(sprintf('Vpeak_avg(j) = mean(X%d);',j));    
    Vrms(j) = Vpeak_avg(j)/2.8280;
end
% % Plot Vrms and Vpeak data measured from 15 appliances

% plot(Vrms,'r-*');
% xlabel('Appliances (increasing order of power ratings)');
% ylabel('Measured Voltage');
% xlim([1 15]);
% set(gca,'XTick',[0:1:15])
% grid on;
% % ylim([2.6*10^-5 3.8*10^-5])
% saveas(gcf,strcat(Path1,'Plot_Vrms_Cal_seq','.png'));
% close all;
save(strcat(Path1,Path2,'Vrms','.mat'),'Vrms','Vpeak_avg');









