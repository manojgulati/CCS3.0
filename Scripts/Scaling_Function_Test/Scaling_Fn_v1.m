% Script to scale measured voltage data across CTs back to absolute current

% Manoj Gulati
% IIIT-Delhi

clc;
clear all
close all

VAR=8;
Path1 = '/Volumes/Omkar_HD/UW Project Data/Data Analysis/Data_25July/Raw Data/';
load(strcat(Path1,'EXP-0',num2str(VAR),'_Filtered_New.mat'));

% % Current Scaling Factor-1
K=1;
% Shunt resistor value (in Ohms)
R_shunt = 250;
turn_ratio = 3000;
Isec(:,K) = y(:,K+5)/R_shunt;
% Load primary current data to scaled data vector
data_scaled(:,K) = Isec(:,K)*turn_ratio;

% % Current Scaling Factor-2
while(K<5)
    K=K+1;
    % Shunt resistor value (in Ohms)
    R_shunt = 1250;
    turn_ratio = 3000;
    Isec(:,K) = y(:,K+5)/R_shunt;
    % Load primary current data to scaled data vector
    data_scaled(:,K) = Isec(:,K)*turn_ratio;
end

%% Plot scaled CT data in Amps
close all

plot(time, data_scaled(:,1),'r--');
grid on;
hold on;
plot(time, data_scaled(:,2),'g--');
plot(time, data_scaled(:,3),'k--');
plot(time, data_scaled(:,4),'b--');
% ylim([-0.06 0.06]);
ylim([-0.8 0.8]);

saveas(gcf,strcat(Path1,'EXP-0',num2str(VAR),'_scaled','.png'));
saveas(gcf,strcat(Path1,'EXP-0',num2str(VAR),'_scaled','.fig'));

%%
Scaled_data = y(:,1:5);

% %
Scaled_data = [Scaled_data data_scaled];

save(strcat('/Volumes/Omkar_HD/UW Project Data/Data Analysis/Data_25July/Raw Data/EXP-0',num2str(VAR),'_scaled_data.mat'),'Scaled_data','time');




