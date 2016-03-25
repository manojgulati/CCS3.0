% Linear regression: Sample with multiple input variables. 
% http://www.mathworks.com/help/stats/linearmodel.fit.html

clc;
clear all;
close all;

% Path1 = './Processed_data(Exp-3)/';

% % Import the data into a dataset array.
load hospital
ds = dataset(hospital.BloodPressure(:,1),hospital.Sex,hospital.Age,hospital.Smoker,'VarNames',{'BloodPressure','Sex','Age','Smoker'});
ds_train = ds(1:80,:);
ds_test = ds(81:100,:);
ds_test1 = ds_test(:,2:4);
% Terms Matrix
T = [0 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1];

%%  Learning Phase

% Learn the linear model
MPG = 'BloodPressure ~ 1 + Sex + Age + Smoker';
mdl1 = LinearModel.fit(ds_train,T);
% Plot residuals
% plotResiduals(mdl1)
plotResiduals(mdl1,'probability')
% Find outliers
% outl = find(mdl1.Residuals.Raw <= -6);
% mdl2 = LinearModel.fit(ds_train,T,'Exclude',outl);

%% Predict using this linear model

[ypred1 yci1] = predict(mdl1,ds_test1);
[ypred2 yci2] = predict(mdl2,ds_test1);

%% Plot the data for visualization
plot(ypred2,'b');
hold on;
plot(yci2,'r');
plot(ds_test(:,1),'g');










