% Script to scale measured voltage data across CTs back to absolute current

% Manoj Gulati
% IIIT-Delhi

clc;
clear all
close all

Num_Sensors = 19;
Coil_channels = 10;
CT_channels = 9;


cal_index=7;

Path1 = '/Volumes/Omkar_HD/UW Project Data/Data Analysis/Alex_APT_2017/Calibrator Sequnce [19AUG16] with BG load/';
Path2 = 'Data_Filt_Sel';

Breaker_labels = {'2_r1','4_r1','6_r1','8_r1','10_r1','14_r1','16_r1'};

load(strcat(Path2,char(Breaker_labels(cal_index)),'.mat'));


% % Current Scaling Factor-1
K=1;

turn_ratio = 3000;

% % Current Scaling Factor-2
while(K<=CT_channels)
    if(K==1 | K==6)
        % Shunt resistor value (in Ohms)
        R_shunt = 1250;
        Isec(:,K) = Data_SEL(:,K+Coil_channels)/R_shunt;
        % Load primary current data to scaled data vector
        data_scaled(:,K) = Isec(:,K)*turn_ratio;
        disp(K);
        disp(R_shunt);
    else
        % Shunt resistor value (in Ohms)
        R_shunt = 1250;
        Isec(:,K) = Data_SEL(:,K+Coil_channels)/R_shunt;
        % Load primary current data to scaled data vector
        data_scaled(:,K) = Isec(:,K)*turn_ratio;
        disp(K);
        disp(R_shunt);
    end   
    K=K+1;
end

% % Plot scaled CT data in Amps
% close all

% plot(time, data_scaled(:,1),'r--');
% grid on;
% hold on;
% plot(time, data_scaled(:,2),'g--');
% plot(time, data_scaled(:,3),'k--');
% plot(time, data_scaled(:,4),'b--');
% plot(time, data_scaled(:,5),'c--');

% ylim([-0.06 0.06]);
% % ylim([-0.8 0.8]);
% % 
% plot(time, data_scaled(:,6),'r--');
% grid on;
% hold on;
% plot(time, data_scaled(:,7),'g--');
% plot(time, data_scaled(:,8),'k--');
% plot(time, data_scaled(:,9),'b--');
% 
% saveas(gcf,strcat(Path1,'Data',char(Breaker_labels(cal_index)),'_scaled_2','.png'));
% saveas(gcf,strcat(Path1,'Data',char(Breaker_labels(cal_index)),'_scaled_2','.fig'));

% %
Scaled_data = Data_SEL(:,1:Coil_channels);

% %
Scaled_data = [Scaled_data data_scaled];

save(strcat(Path1,'Data',char(Breaker_labels(cal_index)),'_scaled_data.mat'),'Scaled_data','time');




