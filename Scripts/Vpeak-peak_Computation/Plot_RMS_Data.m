close all;
clear all;
clc;

input_channel = 1;
num_channel = 5;

load('Exp-7_RMS.mat');

for i=1:num_channel
    RMS_Data(i,:) = Vrms(i,:)-Vrms(i,1);
end
cmap = colormap(prism);

for j=1:num_channel
%     figure;
    plot(RMS_Data(j,:),'color',cmap(j+1,:),'DisplayName',i);
    hold on;    
    xlim([0 15]);
end
legend('show');
    
%     RMS_Data