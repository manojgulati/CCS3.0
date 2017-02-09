% Script to scale measured voltage data across CTs back to absolute current

% Manoj Gulati
% IIIT-Delhi

clc;
clear all
close all

Num_Sensors = 16;
Coil_channels = 9;
CT_channels = 7;

cal_index=4;

Path1 = '/Volumes/Omkar_HD/UW Project Data/Data Analysis/WilSonian_APT_503/Calibrator Sequnce [8AUG16]/';
Path2 = 'Data_Filt_Sel';

Breaker_labels = {'12_r1','5_r1','6_r2','7_r1'};

load(strcat(Path2,char(Breaker_labels(cal_index)),'.mat'));


%% Current Scaling Factor-1
K=1;

turn_ratio = 3000;

% % Current Scaling Factor-2
while(K<=CT_channels)
    if(K==1 | K==6)
        % Shunt resistor value (in Ohms)
        R_shunt = 250;
        Isec(:,K) = Data_SEL(:,K+Coil_channels);%/R_shunt;
        % Load primary current data to scaled data vector
        data_scaled(:,K) = Isec(:,K)*turn_ratio;
        disp(K);
        disp(R_shunt);
    else
        % Shunt resistor value (in Ohms)
        R_shunt = 1250;
        Isec(:,K) = Data_SEL(:,K+Coil_channels);%/R_shunt;
        % Load primary current data to scaled data vector
        data_scaled(:,K) = Isec(:,K)*turn_ratio;
        disp(K);
        disp(R_shunt);
    end   
    K=K+1;
end

%% Plot scaled CT data in Amps
close all

plot(time, data_scaled(:,1),'r--');
grid on;
hold on;
plot(time, data_scaled(:,5),'g--');
plot(time, data_scaled(:,6),'k--');
plot(time, data_scaled(:,7),'b--');
% ylim([-0.06 0.06]);
% ylim([-0.8 0.8]);

saveas(gcf,strcat(Path1,'Data',char(Breaker_labels(cal_index)),'_scaled','.png'));
saveas(gcf,strcat(Path1,'Data',char(Breaker_labels(cal_index)),'_scaled','.fig'));

%%
Scaled_data = Data_SEL(:,1:Coil_channels);

% %
Scaled_data = [Scaled_data data_scaled];

save(strcat('/Volumes/Omkar_HD/UW Project Data/Data Analysis/Data_25July/Raw Data/EXP-0',num2str(VAR),'_scaled_data.mat'),'Scaled_data','time');




