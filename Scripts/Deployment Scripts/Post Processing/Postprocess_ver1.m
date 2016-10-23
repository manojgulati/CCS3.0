% Post processing of measured data from CTs and sensing coils
% Author Name :- Manoj Gulati
% IIIT-Delhi

close all;
clear all;
clc;
Path1 = './Data/';

file_name = 'CT_Test_Data_16CH';
load(strcat(file_name,'.mat'));
num_of_sensors = 16;
seq = [1,3,5,7,9,11,13,15];

%% Design a BPF
% Filter Specs
Fs = 10*10^3; % Sampling frequency of signal in Hz

Fp1 = (35*2)/Fs; % Passband cutoff frequency in Hz
Fp2 = (65*2)/Fs; % Passband cutoff frequency in Hz
Fst1 = (30*2)/Fs; % Stopband frequency in Hz
Fst2 = (70*2)/Fs; % Stopband frequency in Hz
d = fdesign.bandpass('Fst1,Fp1,Fp2,Fst2,Ast1,Ap,Ast2',Fst1,Fp1,Fp2,Fst2,80,0.001,80);
% Create an FIR equiripple filter 
Hd = design(d,'butter');

for i=1:num_of_sensors
    data_filt(:,i) = filter(Hd, data(:,i));
end

%% Scaling factor for CT data

% Shunt resistor value (in Ohms)
R_shunt = 250;
turn_ratio = 3000;
CT_channels = 8;

for k=1:CT_channels
    disp(k);
    Isec(:,k) = data_filt(:,seq(k))/R_shunt;
    % Load primary current data to scaled data vector
    data_scaled(:,k) = Isec(:,k)*turn_ratio;
end


%% Plot time domain data from Inductive coils
clc;

for j=1:num_of_sensors
    h(j) = subplot(num_of_sensors/4,4,j);
    plot(time,data_scaled(:,j),'b')
%     hold on;
%     plot(time,y(:,j),'b')
    xlabel('Time (in seconds)')
    ylabel('Amplitude')
    % ylim([.0000 .00015])
    grid on;
%     xlim([0 200]);
%     set(gca,'XTick',[0:10:200])
    linkaxes(h(j),'x')
end

%%
saveas(gcf,strcat(Path2,'_BW_LPF3_New','.png'));

%%
saveas(gcf,strcat(file_name,'_Scaled_Current','.png'));

%%
save(strcat(file_name,'_Filtered','.mat'),'time','data_filt');
close all;





