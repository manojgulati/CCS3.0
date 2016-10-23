% Post processing of measured data from CTs and sensing coils
% Author Name :- Manoj Gulati
% IIIT-Delhi

close all;
clear all;
clc;
Path1 = './Data/';

file_name = dir(Path1);
num_of_sensors = 6;
net_data_rms = [];
for i=3:size(file_name,1)
    load(strcat(Path1,file_name(i).name));
    for i=1:num_of_sensors
        data_demean(:,i) = data_filt(:,i) - mean(data_filt(:,i)); % Although this data is passed through BPF 
        % but still it we are doing demeaning to remove DC component if present.
        data_rms(i) = rms(data_demean(:,i)); % compute RMS value of measured signals
    end
%     Store computed RMS values from all traces in to net_data_rms vector
%     Each row has rms computed for each of the sensing channels (six in sample code) 
    net_data_rms = [net_data_rms; data_rms];    
end
% Dump RMS data computed from all sensing channels
save(strcat(Path1,'Data_RMS.mat'),'net_data_rms');

% % Plot RMS data measured from each channel
for i=1:num_of_sensors
    plot(net_data_rms(:,i),'color',rand(1,3),'DisplayName',[num2str(i)]);
%     legend(num2str(i))
    hold on;
end
legend(gca,'show')
saveas(gcf,strcat(Path1,'Plot_RMS_Data.png'));











