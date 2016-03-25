% Linear regression with single variable but after averaging data
% http://www.mathworks.com/help/stats/linearmodel.fit.html

clc;
clear all;
close all;

% Path1 = './Processed_data(Exp-3)/';

% % Import the data into a dataset array.
load('NET_Vrms_Dataset.mat');
load('Actual_Power_Waveform.mat');

% Compute average Vrms from all the calibrator traces measured from sensing coils 
for j=1:15
    avg_Vrms(j) = mean(net_Vrms(1:10,j));
end

%% Load dataset in to tables for learning model
ds = dataset(Act_PW',avg_Vrms','VarNames',{'W','avg_Vrms'});

% Terms Matrix
T = [0 0;0 1;];

%%  Learning Phase

% Learn the linear model
% MPG = 'BloodPressure ~ 1 + Sex + Age + Smoker';
mdl1 = LinearModel.fit(ds,T);

%% Plot residuals
plotResiduals(mdl1)
% plotResiduals(mdl1,'probability')
% Find outliers
% outl = find(mdl1.Residuals.Raw <= -10);
% mdl2 = LinearModel.fit(ds,T,'Exclude',outl);

%% Predict using this linear model
ds_test = net_Vrms(11,:)';
[ypred1 yci1] = predict(mdl1,ds_test);
% [ypred2 yci2] = predict(mdl2,ds_test1);

%% Plot the data for visualization

x_range = 1:1:15;

for i=1:15
    plot(x_range,ypred1,'r-*');
    text(x_range(i),ypred1(i),num2str(ypred1(i)),'HorizontalAlignment','right')
    hold on;
    plot(yci1,'g-');
    plot(Act_PW,'b-+')
    grid on;
    legend('Predicted','Conf-bounds(Upp)','Conf-bounds(Low)','Ground-Truth')
    xlim([1 15]);
    set(gca,'XTick',[1:1:15])
    ylim([0 250]);
    set(gca,'YTick',[0:10:250])
    ylabel('Actual Power wattage');
    xlabel('Time(each tick is computed over 10seconds)');
    % plot(ds_test(:,1),'g');
end








