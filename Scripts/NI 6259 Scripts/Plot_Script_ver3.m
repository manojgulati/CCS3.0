% Script to plot NI 6259 Time domain data after filtering through a
% butterworth BPF 

% Manoj Gulati
% IIIT-Delhi

clc;
clear all;
close all;

var = 2;
var_length = 6;
% while(var<2)
    
Path1 = '';
Path2 = strcat('EXP-',num2str(var));
 
load(strcat(Path1,Path2,'.mat'));

% % Design a BPF LPF

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
    x(:,i) = data(:,i);
    y(:,i) = filter(Hd, x(:,i));
end

% % Plot time domain data from Inductive coils

for j=1:var_length
    h(j) = subplot(var_length/2,2,j);
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
    linkaxes(h(j),'x')
end
% saveas(gcf,strcat(Path2,'_BW_LPF3','.png'));
save(strcat(Path1,Path2,'_Filtered','.mat'),'time','y');
% close all;
% var=var+1;
% end

