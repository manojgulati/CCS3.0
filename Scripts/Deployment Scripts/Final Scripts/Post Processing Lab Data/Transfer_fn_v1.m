% Script to learn transfer function by solving set of linear equations from
% measured sensor data

% V3: Is adapted code to work with complex data extracted from FFT based technique

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
I = Data_loaded(:,V_channels+1:V_channels+I_channels);

I=I';
V=V';


%%
close all;
imagesc(abs(I));
colorbar;

% saveas(gcf,strcat('I_2D_Plot','.png'));
% close all
%%
save(strcat('Tr_func_withoutBGL','.mat'),'A');

%% As per signal deconvolution Eqn is V = A*I [All are vectors/matrices]
% We have to extract A from this by solving eqn V*inv(I) 
% but here direct inverse is not possible as I is not a square matrix

for i=1:T_Total
    I_train = [I(:,1:i-1) I(:,i+1:T_Total)];
    V_train = [V(:,1:i-1) V(:,i+1:T_Total)];
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

%% Compare complex transfer function with and without background load
clc
clear all
load Tr_func_withBGL.mat;
A2=A; clear A;
load Tr_func_withoutBGL.mat;
%%
figure, hold on; grid on;
plot(real(A),imag(A),'color','r');
plot(real(A2),imag(A2),'color','b');
legend('without BGL','','','','with BGL','','','')
xlabel('Real');
ylabel('Imaginary');








