% Script to learn transfer function by solving set of linear equations from
% measured sensor data

clear all;
close all;
clc;

% load ground tr current data and measured voltage data frm sensing coils

Path1 = 'V_I_Data'; % file having measured voltage and current data for learning xfer function
load(strcat(Path1,'.mat'));
load('Ground_truth.mat');
nloads = 15; % Number of loads in calibrator seq.

%% As per signal deconvolution Eqn is V = A*I [All are vectors/matrices]
% We have to extract A from this by solving eqn V*inv(I) 
% but here direct inverse is not possible as I is not a square matrix

% Computing psuedo inverse of I using pinv
Inv_I = pinv(I); 
% Solving for transfer function (A)
A = V*Inv_I; 
% Compute inverse of A and store this inverse(A) as a transfer function for predicting current
Inv_A = inv(A); % as A is a sq. matrix its inverse is possible


%% Predict current from measured voltage data and pre-stored xfer fn

I_pred = Inv_A*V; % Here V(2x30) and Inv_A(2x2) so we will get predicted I as I_pred(2x30) corresponding to measured set of voltages

error_MCB1(1,1:nloads) = I(1,1:nloads)-I_pred(1,1:nloads);
error_MCB1(2,1:nloads) = I(2,1:nloads)-I_pred(2,1:nloads);

rmse_MCB1(1) = rms(error_MCB1(1,:));
rmse_MCB1(2) = rms(error_MCB1(2,:));

error_MCB2(1,1:nloads) = I(1,1+nloads:2*nloads)-I_pred(1,1+nloads:2*nloads);
error_MCB2(2,1:nloads) = I(2,1+nloads:2*nloads)-I_pred(2,1+nloads:2*nloads);

rmse_MCB2(1) = rms(error_MCB2(1,:));
rmse_MCB2(2) = rms(error_MCB2(2,:));


%% Plot predicted current data
range = 16:30;
plot(I_pred(1,range),'b'); 
hold on; 
grid on;
plot(I_pred(2,range),'k');
plot(I(1,range),'r');
plot(I(2,range),'g');
xlabel('Load sequence (increasing order of wattage)');
ylabel('Current (Amps)');
ylim([-0.2 2])
xlim([-0.1 15])
legend('I-pred Coil-1','I-pred Coil-2','I-actual MCB-1','I-actual MCB-2','Location','northwest');







