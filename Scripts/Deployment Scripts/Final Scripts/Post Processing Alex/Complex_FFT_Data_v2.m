% Author Name :- Manoj Gulati
% IIIT-Delhi
% Script to compute complex waveform from real valued timeseries of
% measured data and also learn scaling function for 

close all;
clear all;
clc;

format long e;

Num_Sensors = 19;
Coil_channels = 10;
CT_channels = 9;

% Td = 300; % Time Duration
Breaker_labels = {'2_r1','4_r1','6_r1','8_r1','10_r1','14_r1','16_r1'};

Path1 = 'Data';
Path2 = '_scaled_data';
Path3 = 'Data_Complex_Sel-';
Path4 = 'Data_Complex_AVG-';

Cal_Index = 7; % Experiment file index which has to be loaded
CT_Index = 8; % Breaker Index which is running the calibrator load

load(strcat(Path1,char(Breaker_labels(Cal_Index)),Path2,'.mat'));

%%
SAMPLE_RATE = 10000;
Td = size(Scaled_data,1)/SAMPLE_RATE; % Total time duration of calibrator sequence 
Actual_Freq = 60; % freq of input signal
L = size(Scaled_data(:,1),1);

Index = 1;    
while Index<Num_Sensors+1  
    offset=0;
    clear AVG_Data;
    for i=1:L/SAMPLE_RATE
        AVG_Data(i) = rms(Scaled_data(1+offset:SAMPLE_RATE+offset,Index));
        offset = offset+SAMPLE_RATE;
        disp(offset);
    end
    Averaged_Data(Index,:) = AVG_Data;
    clear AVG_Data;
    Index=Index+1;
end
%%
plot(Averaged_Data(Coil_channels+CT_Index,:));
% ylim([0 0.35]);

saveas(gcf,strcat(Path1,num2str(Cal_Index),'_rms','.png'));
% saveas(gcf,strcat(Path1,num2str(Cal_Index),'_rms','.fig'));

%% Extract complex vector by computing FFT

var = 1;    
while var<Num_Sensors+1  
    offset=0;
    for i=1:Td
        Data_FFT(i,:) = fftshift(fft(Scaled_data(1+offset:SAMPLE_RATE+offset,var)));
        Data_FT(i,:) = (Data_FFT(i,:)/L);
        Data_FT_N(i,:) = Data_FT(i,5001:end);
        Data(i) = Data_FT_N(i,61);
        offset = offset+SAMPLE_RATE;
    end
    Ext_Data(var,:)=Data;
%     clear Data_FFT;
    clear Data_FT;
    clear Data_FT_N;
    clear Data;
    offset=0; i=0;
    var=var+1;
end
disp('FFT Completed!');
%%
plot(abs(Ext_Data(Coil_channels+CT_Index,:)));
% ylim([0 1.3*10^-3]);

saveas(gcf,strcat(Path1,num2str(Cal_Index),'_FFT','.png'));
% saveas(gcf,strcat(Path1,num2str(Cal_Index),'_FFT','.fig'));

%% Code for extracting 150sec waveform having calibrator sequence

% Set this var to define start of 150sec complex waveform 
T_calseq = 150;

Ext_Data = Ext_Data';
%%
x_begin =  27;
x_end = x_begin+(T_calseq-1);

%
Data_Slot = Ext_Data(x_begin:x_end,:);

plot([1:1:T_calseq],abs(Data_Slot(:,Coil_channels+CT_Index)));

%%
save(strcat(Path3,char(Breaker_labels(Cal_Index)),'.mat'),'Data_Slot');

% %
save(strcat(Path4,char(Breaker_labels(Cal_Index)),'.mat'),'Ext_Data','Averaged_Data');




















