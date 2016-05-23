% FIR BPF to chop of non-60Hz components from measured data
% Author Name :- Manoj Gulati
% IIIT-Delhi

function [F] = BPF_60Hz(Fs) % function input is sampling rate of measured signal

% Design a BPF
% Filter Specs
Fs = 10*10^3; % Sampling frequency of signal in Hz

Fp1 = (35*2)/Fs; % Passband cutoff frequency in Hz
Fp2 = (65*2)/Fs; % Passband cutoff frequency in Hz
Fst1 = (30*2)/Fs; % Stopband frequency in Hz
Fst2 = (70*2)/Fs; % Stopband frequency in Hz
d = fdesign.bandpass('Fst1,Fp1,Fp2,Fst2,Ast1,Ap,Ast2',Fst1,Fp1,Fp2,Fst2,80,0.001,80);
% Create an FIR equiripple filter 
F = design(d,'butter');
% fvtool(Hd)
end