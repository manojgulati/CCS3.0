clc;

clear all;

close all;


VAR=2;
Path1 = '/Users/manojgulati/Documents/Data_25July/Raw Data/Scaled_Data/';
load(strcat(Path1,'EXP-0',num2str(VAR),'_scaled_data.mat'));

%% Avg function

CT_Index = 7;

SAMPLE_RATE = 10000;
Td = 200; % Total time duration of calibrator sequence 
Actual_Freq = 60; % freq of input signal
L = size(Scaled_data(:,1),1);

offset=0;
clear AVG_Data;
for i=1:L/SAMPLE_RATE
    AVG_Data(i) = rms(Scaled_data(1+offset:SAMPLE_RATE+offset,CT_Index));
    offset = offset+SAMPLE_RATE;
    disp(offset);
end
% ylim([-0.8 0.8]);
%%
plot(AVG_Data(1,:));
ylim([0 0.35]);
%%
saveas(gcf,strcat(Path1,'EXP-0',num2str(VAR),'_rms','.png'));
saveas(gcf,strcat(Path1,'EXP-0',num2str(VAR),'_rms','.fig'));

%%
offset=0;
for i=1:Td
    Data_FFT(i,:) = fftshift(fft(Scaled_data(1+offset:SAMPLE_RATE+offset,CT_Index)));
    Data_FT(i,:) = (Data_FFT(i,:)/L);
    Data_FT_N(i,:) = Data_FT(i,5001:end);
    Data(i) = Data_FT_N(i,61);
    offset = offset+SAMPLE_RATE;
end
%%
close all;
plot(abs(Data(1,:)));
ylim([0 1.3*10^-3]);

%% Compute scaling factor
CT_Index = 9;

A = Averaged_Data(CT_Index,:);
B = Ext_Data(CT_Index,:);
C = A./abs(B);
%%
close all;
plot(C(1,:));

%% Check Scaling Factor
E = median(C);
D = 283*abs(B);

close all;
plot(D(1,:));



