clc;
clear all;
close all;

load('EXP-05_Filtered.mat');


%% Using convolution with complex exponential to extract phase information
SAMPLE_RATE = 10000;

Td = 200; % Total time duration of calibrator sequence 

act_freq = 60; % freq of input signal

t = (0:(Td*SAMPLE_RATE-1))/SAMPLE_RATE;
comp_sin = exp(2*pi*1i*act_freq * t);

% seq=[1,4,7,10,13,15];
for i=1:9
    Y(:,i) = y(:,i)';
    demod(:,i) = Y(:,i)' .* comp_sin;
    demod_smoothed(:,i) = smooth(demod(:,i), 100);
    Y_Phase(:,i) = angle(demod_smoothed(:,i));
    Y_Mag(:,i) = abs(demod_smoothed(:,i));
%     phase_deg(:,i) = rad2deg(phase(:,i)); 
end

%% Extract complex vector by computing FFT 

offset = 0;
for i=1:320
    V_FFT(i,:) = fftshift(fft(y(1+offset:10000+offset,1)));
    V_FT(i,:) = V_FFT(i,5001:end);
    Data(i) = V_FT(i,61);
    offset = offset+10000;
end



    
    
    













%%
for j=1:6
    h(j) = subplot(3,2,j);
    plot(time,unwrap(phase_deg(:,j), 2*pi),'r')
    xlabel('Time (in seconds)')
%     ylabel('Unwrapped Phase')
    set(gca,'XTick',[0:20:320]);
    grid on;
    xlim([0 Td]);
    linkaxes(h(j),'x')
end
%% Zero crossing detector

x = diff(sign(Y));
indx_up = find(x>0);
indx_down = find(x<0);
indx = find(x<0|x>0);

for i=1:size(indx_down,2)
    DF(i) = indx_up(1,i)-indx_down(1,i);
end

plot(Y,'b');
hold on
plot(indx_up,0,'r*');
plot(indx_down,0,'g*');
grid on;


