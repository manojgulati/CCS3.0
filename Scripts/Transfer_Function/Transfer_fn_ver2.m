% Script to learn transfer function by solving set of linear equations from
% measured sensor data

clear all;
close all;
clc;

% % load ground tr current data and measured voltage data frm sensing coils
format long e;
Path1 = 'Exp-'; % file having measured voltage and current data for learning xfer function
num_circuits = 8;
V = [];
for index=1:2:num_circuits
    load(strcat(Path1,num2str(index),'_RMS.mat'));
    V = [V Vrms];
    disp(index);
end

load('Ground_truth.mat');
nloads = 15; % Number of loads in calibrator seq.

%% As per signal deconvolution Eqn is V = A*I [All are vectors/matrices]
% We have to extract A from this by solving eqn V*inv(I) 
% but here direct inverse is not possible as I is not a square matrix

for i=1:60
    I_train = [I(:,1:i-1) I(:,i+1:60)];
    V_train = [V(:,1:i-1) V(:,i+1:60)];
    V_test = V(:,i);
    I_test = I(:,i);
    
    Inv_I_train = pinv(I_train);
    A = V_train*Inv_I_train;
    Inv_A = pinv(A);
    I_pred(:,i) = Inv_A*V_test;
    error(:,i) = I_test-I_pred(:,i);
%     size(Inv_I_train)
    size(Inv_A)  
end

%% Preprocess

for i=1:30
    if I_pred(1,i)<0
        I_pred(1,i)=0;
    end
    if I_pred(2,i)<0
        I_pred(2,i)=0;
    end
end


%% Plot predicted current data
close all;
clc;
cmap = colormap(prism);

num_channel=4;
range=16+30:30+30;

for j=1:num_channel
%     figure;
    plot(I(j,range),'color',cmap(j+1,:),'LineStyle','-','DisplayName',i);
    hold on;   
    plot(I_pred(j,range),'color',cmap(j+1,:),'LineStyle','*','DisplayName',i);
    xlim([0 15]);
    ylim([-0.2 1.9])
end
legend('show','Location','northwest');





