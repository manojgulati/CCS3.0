% Script to plot NI 6259 Time domain data 
% Manoj Gulati
% IIIT-Delhi

clc;
clear all;
close all;
var = 5;

Path1 = '';
Path2 = strcat('EXP-',num2str(var));
 
load(strcat(Path1,Path2,'.mat'));


% % Design a FIR Butterworth LPF

d = fdesign.lowpass('Fp,Fst,Ap,Ast',0.001,0.002,.001,80);

% Design Specs
% Ap — amount of ripple allowed in the pass band in decibels (the default units). Also called Apass.
% Ast — attenuation in the stop band in decibels (the default units). Also called Astop.
% F3db — cutoff frequency for the point 3 dB point below the passband value. Specified in normalized frequency units.
% Fc — cutoff frequency for the point 6 dB point below the passband value. Specified in normalized frequency units.
% Fp — frequency at the start of the pass band. Specified in normalized frequency units. Also called Fpass.
% Fst — frequency at the end of the stop band. Specified in normalized frequency units. Also called Fstop.
% N — filter order.
% Na and Nb are the order of the denominator and numerator.

% To query the design methods
% designmethods(d);

% Create an FIR equiripple filter 
Hd = design(d,'butter');
% fvtool(Hd)

% % Applying filter to measured data
% P.S.currently running for only one channel

for i=1:4
    disp(i);
    x(:,i) = data(:,i);
    y(:,i) = filter(Hd, x(:,i));
end

%% Plot time domain data from Inductive coils

h=figure;

subplot(2,2,1);
% plot(time,data(:,1),'r')
% hold on;
plot(time,y(:,1),'b')
xlabel('Time (in seconds)')
ylabel('Amplitude (in volts)')
% legend('Raw TD',
legend('After Filtering')
grid on;
xlim([0 220]);
set(gca,'XTick',[0:10:220])
title('MCB-1A')

subplot(2,2,2);
% plot(time,data(:,1),'r')
% hold on;
plot(time,y(:,3),'b')
xlabel('Time (in seconds)')
ylabel('Amplitude (in volts)')
% legend('Raw TD',
legend('After Filtering')
grid on;
xlim([0 220]);
set(gca,'XTick',[0:10:220])
title('MCB-2B')

subplot(2,2,3);
% plot(time,data(:,1),'r')
% hold on;
plot(time,y(:,2),'b')
xlabel('Time (in seconds)')
ylabel('Amplitude (in volts)')
% legend('Raw TD',
legend('After Filtering')
grid on;
xlim([0 220]);
set(gca,'XTick',[0:10:220])
title('MCB-3A')

subplot(2,2,4);
% plot(time,data(:,1),'r')
% hold on;
plot(time,y(:,4),'b')
xlabel('Time (in seconds)')
ylabel('Amplitude (in volts)')
% legend('Raw TD',
legend('After Filtering')
grid on;
xlim([0 220]);
set(gca,'XTick',[0:10:220])
title('MCB-4B')

saveas(h,strcat(Path2,'_BW_LPF2','.png'));
save(strcat('./Filtered_data_calibrator/cal-seq-180sec-march26-',Path2,'.mat'),'time','y');
% close all;


