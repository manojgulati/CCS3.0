% Concatinating measured data from CTs 
% Author Name :- Manoj Gulati
% IIIT-Delhi
% Script to compute complex waveform from real valued timeseries of measured data

close all;
clear all;
clc;

Num_Sensors = 16;
Coil_channels = 9;
CT_channels = 7;

% Td = 300; % Time Duration
Breaker_labels = {'12_r2','5_r2','6_r2','7_r2'};
cal_index =1;

Path2 = 'Data_Filt_Sel';
Path3 = 'Data_Complex_Sel-';
% Data_SEL = [];

load(strcat(Path2,char(Breaker_labels(cal_index)),'.mat'));

%% % Extract complex vector by computing FFT 
SAMPLE_RATE = 10000;

Td = 220; % Total time duration of calibrator sequence 

Actual_Freq = 60; % freq of input signal
L = size(Data_SEL(:,1),1);

% %
var = 1;    
while var<Num_Sensors+1  
    offset=0;
    for i=1:Td
        Data_FFT(i,:) = fftshift(fft(Data_SEL(1+offset:SAMPLE_RATE+offset,var)));
        Data_FT(i,:) = (Data_FFT(i,:)/L);
        Data_FT_N(i,:) = Data_FT(i,5001:end);
        Data(i) = Data_FT_N(i,61);
        offset = offset+SAMPLE_RATE;
    end
    Ext_Data(var,:)=Data;
    clear Data_FFT;
    clear Data_FT;
    clear Data_FT_N;
    clear Data;
    offset=0; i=0;
    var=var+1;
end
%% Code for extracting 150sec waveform having calibrator sequence

% Set this var to define start of 150sec complex waveform 
T_calseq = 150;

Ext_Data = Ext_Data';
%%
x_begin =  24;
x_end = x_begin+(T_calseq-1);

CT_index = 10;

% %
Data_Slot = Ext_Data(x_begin:x_end,:);

plot([1:1:T_calseq],abs(Data_Slot(:,CT_index)));

%% Plot time domain data from Inductive coils
figure('units','normalized','outerposition',[0 0 1 1])
for j=1:Num_Sensors
    h(j) = subplot(Num_Sensors/8,8,j);
    plot([1:1:T_calseq],abs(Data_Slot(:,j)),'b')
    xlabel('Time (in seconds)')
    ylabel('Amplitude (in volts)')
    grid on;
    xlim([0 T_calseq]);
    set(gca,'XTick',[0:10:T_calseq])
    linkaxes(h,'x')
end
saveas(gcf,strcat(Path2,char(Breaker_labels(cal_index)),'_Ext_CalSeq','.png'));
%%
save(strcat(Path3,char(Breaker_labels(cal_index)),'.mat'),'Data_Slot');






















