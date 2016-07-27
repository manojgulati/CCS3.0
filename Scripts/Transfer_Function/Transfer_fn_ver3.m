% Script to learn transfer function by solving set of linear equations from
% measured sensor data

% V3: Is adapted code to work with complex data extracted from FFT based technique

clear all;
close all;
clc;

% % load ground tr current data and measured voltage data frm sensing coils
format long e;
Path1 = 'Exp-0'; % file having measured voltage and current data for learning xfer function
Path2 = '_Ext_CalSeq.mat';
% seq = [5,6,7,8];
seq = [1,2,3,4];
num_circuits = 4;
V_channels = 5;
I_channels = 4;
T_Total = 600;

V = [];
I = [];
for index=1:num_circuits
    load(strcat(Path1,num2str(seq(index)),Path2));
    V = [V; Data_Slot(:,1:V_channels)];
    I = [I; Data_Slot(:,V_channels+1:V_channels+I_channels)];
    clear Data_Slot;
end

I=I';
V=V';


%%

imagesc(abs(A));
colorbar;

saveas(gcf,strcat('Tr_func_withoutBGL_2D_Plot','.png'));
save(strcat('Tr_func_withoutBGL_2D_Plot','.mat'),'A');
close all

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
load Tr_func_withBGL_2D_Plot.mat;
A2=A; clear A;
load Tr_func_withoutBGL_2D_Plot.mat;
%%
figure, hold on; grid on;
plot(real(A),imag(A),'color','r');
plot(real(A2),imag(A2),'color','b');
legend('without BGL','','','','with BGL','','','')
xlabel('Real');
ylabel('Imaginary');








