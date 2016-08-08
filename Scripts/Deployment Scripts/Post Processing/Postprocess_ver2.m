% Post processing of measured data from CTs and sensing coils captured in
% continous mode
% Author Name :- Manoj Gulati
% IIIT-Delhi

close all;
clear all;
clc;
Path1 = '/Dataset/';

file_name = dir;
Data_Net = [];
%%
num_of_sensors = 48;

for i=3:size(file_name,1)
    load(strcat(Path1,file_name(i).name));
%     Store measured data from all traces in to net_data vector
    Data_Net = [Data_Net; data_acq];    
end

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
    Data_Filt(:,i) = filter(Hd, Data_Net(:,i));
end










