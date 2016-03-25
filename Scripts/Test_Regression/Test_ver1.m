% Script for computing linear regression estimates from training data

clc;
clear all;
close all;

load accidents
x = hwydata(:,14); %Population of states
y = hwydata(:,4); %Accidents per state
format long
% learned estimates by solving Y=XB
b1 = x\y;
% compute predicted values of y
y_pred1 = x*b1;
% define limits for bounds
y_bound = 500;

% Improve the fit by including a y-intercept B0
X = [ones(length(x),1) x];
b = X\y;
% compute improved predicted values of y
y_pred2 = X*b;


%% Plot the actual data and predicted data
scatter(x,y);
hold on;
plot(x,y_pred1,'r');
plot(x,y_pred2,'r--');
plot(x,y_pred2+y_bound,'g');
plot(x,y_pred2-y_bound,'g');





