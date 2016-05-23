% Script to compute angle between measured current and voltage data.
% This is to compute lag and derive real and reactive wattage.

% Author Name :- Manoj Gulati
% IIIT-Delhi


clc;
clear all;
close all;

% Sample code
t = 1:0.001:10; % generate time vector
% fs = 1; % sampling frequency (seconds)
A = 2; % amplitude
% P = 1000; % period (seconds), the time it takes for the signal to repeat itself
f1 = 60; % number of cycles per second (i.e. how often the signal repeats itself every second).
y1 = A*sin(2*pi*f1*t); % signal 1
phi = 90; % phase shift
y2 = A*sin(2*pi*f1*t + (phi*pi/180)); % signal 2 % 

YY = [y1',y2'];

plot(t,y1,'r')
hold on;
plot(t,y2,'b-')

%%

y1_h = hilbert(y1);
y2_h = hilbert(y2);

y1_angle = radtodeg(angle(y1_h));
y2_angle = radtodeg(angle(y2_h));

plot(y1_angle,'r');
hold on;
plot(y2_angle,'b');

% phase_rad = angle(y1_h ./ y2_h);
% phase_deg = (180*phase_rad)/pi;
% plot(phase_deg)

