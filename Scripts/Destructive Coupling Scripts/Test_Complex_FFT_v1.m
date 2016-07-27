

clc;
clear all;
close all;

Path1 = 'EXP-08';

load(strcat(Path1,'_Filtered_New.mat'));
var_length = 9; % No. of channels

% % Extract complex vector by computing FFT 
SAMPLE_RATE = 10000;

Td = 200; % Total time duration of calibrator sequence 

act_freq = 60; % freq of input signal
L = size(y(:,1),1);

var = 1;    
while var<var_length+1

    offset=0;
    for i=1:Td
        V_FFT(i,:) = fftshift(fft(y(1+offset:SAMPLE_RATE+offset,var)));
        V_FT(i,:) = (V_FFT(i,:)/L);
        V_FT_N(i,:) = V_FT(i,5001:end);
        Data(i) = V_FT_N(i,61);
        offset = offset+SAMPLE_RATE;
    end
    Ext_Data(var,:)=Data;
    clear V_FFT;
    clear V_FT;
    clear V_FT_N;
    clear Data;
    offset=0; i=0;
    var=var+1;
end

% % Plot time domain data from Inductive coils
figure('units','normalized','outerposition',[0 0 1 1])
for j=1:var_length
    h(j) = subplot(var_length/3,3,j);
    plot([1:1:200],abs(Ext_Data(j,:)),'b')
%     hold on;
%     plot([1:1:200],unwrap(angle(Ext_Data(j,:))),'r')
    xlabel('Time (in seconds)')
    ylabel('Amplitude (in volts)')
    grid on;
    xlim([0 Td]);
    set(gca,'XTick',[0:10:Td])
    linkaxes(h,'x')
end
saveas(gcf,strcat(Path1,'_Ext_CompFFT_AMP','.png'));
% saveas(gcf,strcat(Path1,'_Ext_CompFFT_ANG','.png'));
save(strcat(Path1,'_ComplexData','.mat'),'Ext_Data');
close all;

figure('units','normalized','outerposition',[0 0 1 1])
for j=1:var_length
    h(j) = subplot(var_length/3,3,j);
%     plot([1:1:200],abs(Ext_Data(j,:)),'b')
%     hold on;
    plot([1:1:200],unwrap(angle(Ext_Data(j,:))),'r')
    xlabel('Time (in seconds)')
%     ylabel('Amplitude (in volts)')
    grid on;
    xlim([0 Td]);
    set(gca,'XTick',[0:10:Td])
    linkaxes(h,'x')
end
saveas(gcf,strcat(Path1,'_Ext_CompFFT_ANG','.png'));
close all
clc













