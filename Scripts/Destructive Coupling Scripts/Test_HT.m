clc;
clear all;
close all;


hsin1 = dsp.SineWave(2, 10);
hsin1.SamplesPerFrame = 10000;
y1 = step(hsin1);

hsin2 = dsp.SineWave;
hsin2.Frequency = 10;
hsin2.Amplitude = 2;
hsin2.PhaseOffset = pi/2;
hsin2.SamplesPerFrame = 10000;
y2 = step(hsin2);
%%
plot(y1(1:10^3,1),'b');
hold on
% plot(y2(1:10^3,1),'g'); 

%%
% Y = [y1',y1',y2',y1'];

% Y_H = hilbert(Y);

% plot(rad2deg(angle(Y_H)))
%% Using convolution with complex exponential to extract phase information
clear all; clc;
load('EXP-3_Filtered.mat');
SAMPLE_RATE = 10000;

Td = 320; % Total time duration of calibrator sequence 

t = (0:(Td*SAMPLE_RATE-1))/SAMPLE_RATE;
comp_sin = exp(2*pi*1i*60 * t);


seq=[1,4,7,10,13,15];
for i=1:6
    Y(:,i) = y(:,i)';
    demod(:,i) = Y(:,i)' .* comp_sin;
    demod_smoothed(:,i) = smooth(demod(:,i), 100);
    phase(:,i) = angle(demod_smoothed(:,i));
    phase_deg(:,i) = rad2deg(phase(:,i)); 
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


