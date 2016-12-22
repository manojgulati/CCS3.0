% Script to plot measured and predicted current values

% clear all;
close all;
clc;

% % load ground tr current data and measured voltage data frm sensing coils
format long e;

imagesc(abs(I_pred));
caxis([0, 5*10^-4])
% ylim([1,4]);
colorbar;
xlabel('Time (in Seconds)');
% ylabel('Breaker Index');

%%

Tag_name = 'Ipred';
saveas(gcf,strcat(Tag_name,'_withBGL_2D_Plot_Scaled_CrossTest','.png'));

%% Compute absolute error
I_channels=size(I,1);
Td=size(I,2); % Time duration
for i_range=1:I_channels
    RMSE_BRK(i_range,:) =  error(i_range,:).^2;
    RMSE_BRK_Norm(i_range) =  sum(RMSE_BRK(i_range,:))/Td;
%     Take complex summation of error per breaker
    Error_BRK(i_range)=sum(error(i_range,:));
%     Compute normalised error per breaker
    Error_BRK_Norm(i_range) = Error_BRK(i_range)/Td; 
end

Tag = 'SelfTest';
% Tag = 'CrossTest';
save(strcat('Error_BRK_NORM_',Tag,'.mat'),'Error_BRK_Norm','RMSE_BRK_Norm');
%
A1 = abs(Error_BRK_Norm); A2 = abs(RMSE_BRK_Norm);

%% Plot magnitude of current as overlapping time series
figure;
hold on;
% 
plot(abs(I(1,:)),'b');
plot(abs(I(2,:)),'g');
plot(abs(I(3,:)),'r');
plot(abs(I(4,:)),'c');
 
plot(abs(I_pred(1,:)),'bo');
plot(abs(I_pred(2,:)),'go');
plot(abs(I_pred(3,:)),'ro');
plot(abs(I_pred(4,:)),'co');

% 
% plot(abs(I(5,:)),'y');
% plot(abs(I(6,:)),'b');
% plot(abs(I(7,:)),'g');
% plot(abs(I(8,:)),'r');
% % plot(abs(I(9,:)),'c');
% 
% plot(abs(I_pred(5,:)),'yo');
% plot(abs(I_pred(6,:)),'bo');
% plot(abs(I_pred(7,:)),'go');
% plot(abs(I_pred(8,:)),'ro');
% %plot(abs(I_pred(9,:)),'co');

xlim([-10 1100]);
ylim([-0.00001 4.5*10^-4]);
xlabel('Time (in Seconds)');

Tag_name = 'Ipred';
saveas(gcf,strcat(Tag_name,'_withBGL_Line_Plot_',Tag,'_1.png'));
% close all;











