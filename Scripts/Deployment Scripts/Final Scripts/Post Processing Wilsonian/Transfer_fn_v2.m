% Script to learn transfer function by solving set of linear equations from
% measured sensor data

% V1: Is adapted code to work with complex data extracted from FFT based technique
% V2: is modified to add CT scaling function

clear all;
close all;
clc;

% % load ground tr current data and measured voltage data frm sensing coils
format long e;

% Td = 300; % Time Duration
Breaker_labels = {'12_r1','5_r1','6_r2','7_r1'};

Path3 = 'Data_Complex_Sel-';

cal_index =1;
Data_loaded = [];
for cal_index=1:4
    load(strcat(Path3,char(Breaker_labels(cal_index)),'.mat'));
    Data_loaded = [Data_loaded; Data_Slot];
    clear Data_Slot;
end


%%
num_circuits = 4;
V_channels = 9;
I_channels = 7;
T_Total = 600;

V = Data_loaded(:,1:V_channels);
I_raw = Data_loaded(:,V_channels+1:V_channels+I_channels);

I_old=I_raw';
V=V';

% Fixing unused CT Channels

I = [I_old(1,:); I_old(5:7,:)];

%% Scaling factor for CT data

% Shunt resistor value (in Ohms)
R_shunt = 100; % Actual marked value was 250 Ohm
turn_ratio = 3000;

    I = I/R_shunt;
    % Load primary current data to scaled data vector
    I = I*turn_ratio;

%%
% close all;
imagesc(abs(I_pred));
colorbar;

% saveas(gcf,strcat('I_2D_Plot','.png'));
% close all

xlabel('Time (in Seconds)');
Tag_name = 'Ipred_mod';

saveas(gcf,strcat(Tag_name,'_withBGL_2D_Plot_CrossTest','.png'));

%% As per signal deconvolution Eqn is V = A*I [All are vectors/matrices]
% We have to extract A from this by solving eqn V*inv(I) 
% but here direct inverse is not possible as I is not a square matrix

for i=1:T_Total
    I_train = [I(:,1:i-1) I(:,i+1:T_Total)];
    V_train = [V(:,1:i-1) V(:,i+1:T_Total)];
    V_test = V(:,i);
    I_test = I(:,i);
    
%     Inv_I_train = pinv(I_train);
%     A = V_train*Inv_I_train;
    Inv_A = pinv(A);
    I_pred(:,i) = Inv_A*V_test;
    error(:,i) = I_test-I_pred(:,i);
%     size(Inv_I_train)
    size(Inv_A)  
    % % Save Transfer Function
%     save(strcat('./Slotted_Transfer_Function/Tr_func_withoutBGL_',num2str(i),'.mat'),'A');
end

%% Compare complex transfer function with and without background load
clc
clear all
load Tr_func_withBGL_Modified.mat;
A2=A; clear A;
load Tr_func_withoutBGL.mat;

% A = A./abs(A);
% A2 = A2./abs(A2);

%%
clc;
% function [C] = orange();
% C = [1 .5 0];

figure, hold on; grid off;
plot(real(A(:,1)),imag(A(:,1)),'color','blue');
plot(real(A(:,2)),imag(A(:,2)),'color','red');
plot(real(A(:,3)),imag(A(:,3)),'color','green');
plot(real(A(:,4)),imag(A(:,4)),'color','magenta');
% plot(real(A(:,5)),imag(A(:,5)),'color','cyan');
% plot(real(A(:,6)),imag(A(:,6)),'color','yellow');
% plot(real(A(:,7)),imag(A(:,7)),'color','black');

plot(real(A2(:,1)),imag(A2(:,1)),'color','blue','marker','*','LineStyle','--');
plot(real(A2(:,2)),imag(A2(:,2)),'color','red','marker','*','LineStyle','--');
plot(real(A2(:,3)),imag(A2(:,3)),'color','green','marker','*','LineStyle','--');
plot(real(A2(:,4)),imag(A2(:,4)),'color','magenta','marker','*','LineStyle','--');
% plot(real(A2(:,5)),imag(A2(:,5)),'color','cyan','marker','*','LineStyle','--');
% plot(real(A2(:,6)),imag(A2(:,6)),'color','yellow','marker','*','LineStyle','--');
% plot(real(A2(:,7)),imag(A2(:,7)),'color','black','marker','*','LineStyle','--');

legend('BRK-1','BRK-2','BRK-3','BRK-4','BRK-5','BRK-6','BRK-7','BRK-8')

% legend('BRK-without-BGL','BRK-with-BGL');
xlabel('Real');
ylabel('Imaginary');

saveas(gcf,strcat('Complex_Tr_Function,'.png'));


%% Save Transfer Function

save('Tr_func_withBGL.mat','A');

% %
save('Results.mat','I_pred','error','I');

%%
save('Results_CrossTest.mat','I_pred','error','I');





