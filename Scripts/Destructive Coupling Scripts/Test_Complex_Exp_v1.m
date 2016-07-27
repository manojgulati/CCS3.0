clc;
clear all;
close all;

load('EXP-05_Filtered.mat');
var_length = 9; % No. of channels

%% Using convolution with complex exponential to extract phase information
SAMPLE_RATE = 10000;

Td = 200; % Total time duration of calibrator sequence 

act_freq = 60; % freq of input signal

t = (0:(Td*SAMPLE_RATE-1))/SAMPLE_RATE;
comp_sin = exp(2*pi*1i*act_freq * t);

% seq=[1,4,7,10,13,15];
for i=1:var_length
    Y(:,i) = y(:,i)';
    demod(:,i) = Y(:,i)' .* comp_sin;
    demod_smoothed(:,i) = smooth(demod(:,i), 100);
    Y_Phase(:,i) = angle(demod_smoothed(:,i));
    Y_Mag(:,i) = abs(demod_smoothed(:,i));
%     phase_deg(:,i) = rad2deg(phase(:,i)); 
end


%% Plot time domain data from Inductive coils
figure('units','normalized','outerposition',[0 0 1 1])

for j=1:var_length
    h(j) = subplot(var_length/3,3,j);
    plot(time,unwrap(Y_Phase(:,j)),'b')
    xlabel('Time (in seconds)')
    ylabel('Amplitude (in volts)')
    grid on;
    xlim([0 Td]);
    set(gca,'XTick',[0:10:Td])
    linkaxes(h(j),'x')
end
saveas(gcf,strcat(Path2,'_Extrac_Phase','.png'));
% save(strcat(Path1,Path2,'_Filtered_New','.mat'),'time','y');
% close all;



    
    
    













