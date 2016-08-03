% Post processing of measured data from CTs and sensing coils
% Author Name :- Manoj Gulati
% IIIT-Delhi

close all;
clear all;
clc;
Path1 = '/Data_MCB2/';

file_name = dir;
%%
num_of_sensors = 4;
net_data_rms = [];
for i=3:size(file_name,1)
    load(strcat(Path1,file_name(i).name));
%     Store computed RMS values from all traces in to net_data_rms vector
%     Each row has rms computed for each of the sensing channels (six in sample code) 
    net_data_rms = [net_data_rms; data_rms];    
end

% % Plot RMS data measured from each channel
for i=1:3:num_of_sensors
    plot(net_data_rms(:,i),'color',rand(1,3),'DisplayName',[num2str(i)]);
%     legend(num2str(i))
    hold on;
end
legend(gca,'show')
saveas(gcf,strcat('Plot_RMS_Data.png'));











