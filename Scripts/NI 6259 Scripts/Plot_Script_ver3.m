% Script to plot NI 6259 Time domain data after filtering through a
% butterworth BPF 

% Manoj Gulati
% IIIT-Delhi

clc;
clear all;
close all;

var = 1;
var_length = 9;
seq = [1,4,7,10,13,17,20,23,26];

% while(var<2)
    
Path1 = '';
Path2 = strcat('EXP-0',num2str(var));
% Path3 = '_Filtered'; 
Path3 = []; 
load(strcat(Path1,Path2,Path3,'.mat'));

%% Design a BPF LPF

% Filter Specs
Fs = 10*10^3; % Sampling frequency of signal in Hz

Fp1 = (35*2)/Fs; % Passband cutoff frequency in Hz
Fp2 = (65*2)/Fs; % Passband cutoff frequency in Hz
Fst1 = (30*2)/Fs; % Stopband frequency in Hz
Fst2 = (70*2)/Fs; % Stopband frequency in Hz

d = fdesign.bandpass('Fst1,Fp1,Fp2,Fst2,Ast1,Ap,Ast2',Fst1,Fp1,Fp2,Fst2,80,0.001,80);

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

% % Create an FIR equiripple filter 
Hd = design(d,'butter');
% fvtool(Hd)

% % Applying filter to measured data

for i=1:var_length
    disp(i);
    x(:,i) = data(:,seq(i));
    y(:,i) = filter(Hd, x(:,i));
end

%% Plot time domain data from Inductive coils
figure('units','normalized','outerposition',[0 0 1 1])

for j=1:var_length
    h(j) = subplot(var_length/3,3,j);
%     plot(time,data(:,j),'r')
    hold on;
    plot(time,y(:,j),'b')
    xlabel('Time (in seconds)')
    ylabel('Amplitude (in volts)')
    % legend('Raw TD','After Filtering')
    % ylim([.0000 .00015])
    grid on;
    xlim([0 200]);
    set(gca,'XTick',[0:10:200])
    linkaxes(h,'x')
end
clc

% saveas(gcf,strcat(Path2,'_BW_LPF3_New','.png'));
% save(strcat(Path1,Path2,'_Filtered_New','.mat'),'time','y');
% close all;
% var=var+1;
% end
%%
figure;
h(1) = subplot(2,1,1);
plot(time,y(:,1),'b')
ylabel('Amplitude (in volts)')
% xlabel('Time (in seconds)')
grid on;
title('Voltage measured across sensing coil')
h(2) = subplot(2,1,2);
plot(time,y(:,6),'b')
xlabel('Time (in seconds)')
ylabel('Amplitude (in volts)')
grid on;
title('Voltage measured across CT output')
linkaxes(h,'x')
saveas(gcf,strcat('Filtered_Output','.png'));


%%
clc;
clear all;
seq = ['1','3','5','7'];
for i=1:4

    load(strcat('Exp-',num2str(seq(i)),'_RMS','.mat'));
%     V(i) = Vrms;
    eval(sprintf('V%d = Vrms;', i));
    clear Vrms;
end
%%
figure;
h(1) = subplot(2,2,1);
plot(V1(1,:),'blue')
hold on;
plot(V1(2,:),'green')
plot(V1(3,:),'magenta')
plot(V1(4,:),'black')
plot(V1(5,:),'red')
ylabel('Amplitude (in volts)')
xlabel('Calibrator Load Sequence')
xlim([1 15]);
set(gca,'XTick',[1:1:15])
% grid on;
legend('Coil-0','Coil-1','Coil-2','Coil-3','Coil-4','Location','northwest');
title('Circuit Breaker-1')

h(2) = subplot(2,2,2);
plot(V2(1,:),'blue')
hold on;
plot(V2(2,:),'green')
plot(V2(3,:),'magenta')
plot(V2(4,:),'black')
plot(V2(5,:),'red')
ylabel('Amplitude (in volts)')
xlabel('Calibrator Load Sequence')
xlim([1 15]);
set(gca,'XTick',[1:1:15])
% grid on;
legend('Coil-0','Coil-1','Coil-2','Coil-3','Coil-4','Location','northwest');
title('Circuit Breaker-2')

h(3) = subplot(2,2,3);
plot(V3(1,:),'blue')
hold on;
plot(V3(2,:),'green')
plot(V3(3,:),'magenta')
plot(V3(4,:),'black')
plot(V3(5,:),'red')
ylabel('Amplitude (in volts)')
xlabel('Calibrator Load Sequence')
xlim([1 15]);
set(gca,'XTick',[1:1:15])
% grid on;
legend('Coil-0','Coil-1','Coil-2','Coil-3','Coil-4','Location','northwest');
title('Circuit Breaker-3')

h(4) = subplot(2,2,4);
plot(V4(1,:),'blue')
hold on;
plot(V4(2,:),'green')
plot(V4(3,:),'magenta')
plot(V4(4,:),'black')
plot(V4(5,:),'red')
ylabel('Amplitude (in volts)')
xlabel('Calibrator Load Sequence')
xlim([1 15]);
set(gca,'XTick',[1:1:15])
% grid on;
legend('Coil-0','Coil-1','Coil-2','Coil-3','Coil-4','Location','northwest');
title('Circuit Breaker-4')
linkaxes(h,'x')
saveas(gcf,strcat('Measured_Cal_Sequence','.png'));








