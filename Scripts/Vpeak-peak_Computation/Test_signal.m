clc;
clear all;
close all;

% time base
t=0:.0001:.02; % in seconds
f=100; % in Hz
% generate test sinusoid
x = 5*sin(2*pi*f*t);

% peak finder 
[pks,locs] = findpeaks(x);

% plot the test signal and peak detection o/p
plot(x,'b');
hold on;
plot(locs,pks,'r*');