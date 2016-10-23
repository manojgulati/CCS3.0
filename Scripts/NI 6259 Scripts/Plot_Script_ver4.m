% Script to plot NI 6259 Time domain data after filtering through a
% butterworth BPF 
% Errata: Added scaling function for current transformer data
% Author Name :- Manoj Gulati
% IIIT-Delhi

clc;
clear all;
close all;

var = 1;
var_length = 6;
CT_channels = 3;
% while(var<2)
    
Path1 = '';
Path2 = strcat('EXP-',num2str(var));
 
load(strcat(Path1,Path2,'.mat'));

% % Scaling factor for CT data

% Shunt resistor value (in Ohms)
R_shunt = 250;
turn_ratio = 3000;

for k=1:CT_channels
    disp(k);
    Isec(:,k) = data(:,k)/R_shunt;
    % Load primary current data to scaled data vector
    data_scaled(:,k) = Isec(:,k)*turn_ratio;
end

for k=(var_length-CT_channels)+1:var_length
    disp(k);
    data_scaled(:,k) = data(:,k);
end

% % Design a BPF

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
    x(:,i) = data_scaled(:,i);
    y(:,i) = filter(Hd, x(:,i));
end

% % Plot time domain data from Inductive coils
clc;

figure('units','normalized','outerposition',[0 0 1 1])

for j=1:var_length
    h(j) = subplot(var_length/2,2,j);
%     plot(time,data_scaled(:,j),'r')
%     hold on;
    plot(time,y(:,j),'b')
    xlabel('Time (in seconds)')
    ylabel('Amplitude (in volts)')
    % legend('Raw TD','After Filtering')
    % ylim([.0000 .00015])
    grid on;
    xlim([0 320]);
    set(gca,'XTick',[0:20:320])
    linkaxes(h(j),'x')
end
% %
saveas(gcf,strcat(Path2,'_BW_LPF3_New','.png'));
% save(strcat(Path1,Path2,'_Filtered','.mat'),'time','y');
close all;
% var=var+1;
% end

