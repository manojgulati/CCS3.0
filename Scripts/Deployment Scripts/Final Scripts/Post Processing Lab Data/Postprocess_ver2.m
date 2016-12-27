% Post processing of measured data from CTs and sensing coils captured in
% continous mode
% Author Name :- Manoj Gulati
% IIIT-Delhi

close all;
clear all;
clc;
Path1 = '/Calibrator Sequnce [8AUG16]/';

CH_INFO =  [1,4,7,10,13,16,17,20,23,26,29,32,33,35,37,39,41,43,45,47];

Num_Sensors = 20;
Td = 220; % Time Duration

Path2 = 'CAL_SEQ_BRK-12_r1';
% load(strcat(Path2,'_CT_Scaled.mat'));
% load(strcat(Path2,'_Filtered_Data.mat'));
load(strcat(Path2,'.mat'));


%% Design a BPF
% Filter Specs
Fs = 10*10^3; % Sampling frequency of signal in Hz

Fp1 = (35*2)/Fs; % Passband cutof f frequency in Hz
Fp2 = (65*2)/Fs; % Passband cutoff frequency in Hz
Fst1 = (30*2)/Fs; % Stopband frequency in Hz
Fst2 = (70*2)/Fs; % Stopband frequency in Hz
d = fdesign.bandpass('Fst1,Fp1,Fp2,Fst2,Ast1,Ap,Ast2',Fst1,Fp1,Fp2,Fst2,80,0.001,80);
% Create an FIR equiripple filter 
Hd = design(d,'butter');


for i=1:Num_Sensors
    Data_Filt(:,i) = filter(Hd, data(:,CH_INFO(i)));
    disp(i);
end

%% Scaling factor for CT data

% Shunt resistor value (in Ohms)
R_shunt = 250;
turn_ratio = 3000;
CT_channels = 7;
Coil_channels = 9;

for k=1:CT_channels
    disp(k);
    Isec(:,k) = Data_Filt(:,Coil_channels+k)/R_shunt;
    % Load primary current data to scaled data vector
    Data_SC_CT(:,k) = Isec(:,k)*turn_ratio;
end

%% Plot CT Channels Data
clc;
close all;
figure('units','normalized','outerposition',[0 0 1 1])
for j=1:CT_channels
    h(j) = subplot(CT_channels/3,4,j);
    plot(time,Data_SC_CT(:,j),'b')
    xlabel('Time (in seconds)')
    ylabel('Amplitude')
    % ylim([.0000 .00015])
    grid on;
    xlim([0 Td]);
    set(gca,'XTick',[0:10:Td])
    linkaxes(h(j),'x')
end
%%
saveas(gcf,strcat(Path2,'_Scaled_Current','.png'));
close all;
%%
save(strcat(Path2,'_CT_Scaled','.mat'),'time','Data_SC_CT');
close all;

%% Plot Coil Channels Data
clc;

figure('units','normalized','outerposition',[0 0 1 1])
for j=1:Coil_channels
    h(j) = subplot(Coil_channels/3,4,j);
    plot(time,Data_Filt(:,j),'b')
    xlabel('Time (in seconds)')
    ylabel('Amplitude')
    % ylim([.0000 .00015])
    grid on;
    xlim([0 Td]);
    set(gca,'XTick',[0:10:Td])
    linkaxes(h(j),'x')
end
%%
saveas(gcf,strcat(Path2,'_Coil_Data','.png'));
close all;

%%
save(strcat(Path2,'_Filtered_Data','.mat'),'time','Data_Filt');

