% Script to learn transfer function by solving set of linear equations from
% measured sensor data

% V3: Is adapted code to work with complex data extracted from FFT based technique

clear all;
close all;
clc;

% % load ground tr current data and measured voltage data frm sensing coils
format long e;
Path1 = 'Data_Complex_Sel-'; % file having measured voltage and current data for learning xfer function
Path2 = '.mat';
% seq = [5,6,7,8];
seq = [1,2,3,4];
num_circuits = 4;
V_channels = 5;
I_channels = 4;
T_Total = 600;

V = [];
I_raw = [];
for index=1:num_circuits
    load(strcat(Path1,num2str(seq(index)),Path2));
    V = [V; Data_Slot(:,1:V_channels)];
    I_raw = [I_raw; Data_Slot(:,V_channels+1:V_channels+I_channels)];
    clear Data_Slot;
end
%
I_raw=I_raw';
V=V';
I = I_raw;
%% Scaling factor for CT data

% % Shunt resistor value (in Ohms)
% R_shunt = 100;
% turn_ratio = 3000;
% 
%     I = I_raw/R_shunt;
%     % Load primary current data to scaled data vector
%     I = I*turn_ratio;


%%

imagesc(abs(I));
colorbar;

% YTickLabel = ;
% set(gca,'YTickLabel',{'','Circuit Breaker-1','','Circuit Breaker-2','','Circuit Breaker-3','','Circuit Breaker-4',''})
% set(gca,'YTickLabel',{'','Sensing Coil-1','','Sensing Coil-2','','Sensing Coil-3','','Sensing Coil-4','','Sensing Coil-5'})

xlabel('Time (in Seconds)');
saveas(gcf,strcat('I_withoutBGL_2D_Plot_CROSSTEST','.png'));
%%
save(strcat('Tr_func_withoutBGL_2D_Plot','.mat'),'A');
% close all

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
    % size(Inv_I_train)
    size(Inv_A)  
    % % Save Transfer Function
%     save(strcat('./Slotted_Transfer_Function/Tr_func_withoutBGL_',num2str(i),'.mat'),'A');

end

%% Compare complex transfer function with and without background load
clc
clear all
load Tr_func_withBGL_2D_Plot.mat;
A2=A; clear A;
load Tr_func_withoutBGL_2D_Plot.mat;

A = A./abs(A);
A2 = A2./abs(A2);
%% 
clc;
figure, hold on; grid off;
plot(real(A(:,1)),imag(A(:,1)),'color','blue');
plot(real(A(:,2)),imag(A(:,2)),'color','red');
plot(real(A(:,3)),imag(A(:,3)),'color','green');
plot(real(A(:,4)),imag(A(:,4)),'color','magenta');

plot(real(A2(:,1)),imag(A2(:,1)),'color','blue','marker','*','LineStyle','--');
plot(real(A2(:,2)),imag(A2(:,2)),'color','red','marker','*','LineStyle','--');
plot(real(A2(:,3)),imag(A2(:,3)),'color','green','marker','*','LineStyle','--');
plot(real(A2(:,4)),imag(A2(:,4)),'color','magenta','marker','*','LineStyle','--');
legend('BRK-1','BRK-2','BRK-3','BRK-4')
xlabel('Real');
ylabel('Imaginary');

% saveas(gcf,strcat('Normalised_Complex_Tr_Function','.png'));

%%
figure, hold on; grid on;
Diff_Matrix = A2-A;
plot(real(Diff_Matrix),imag(Diff_Matrix),'color','blue');
xlabel('Real');
ylabel('Imaginary');

%% Save Transfer Function

save('Tr_func_withBGL.mat','A');

% %
save('Results.mat','I_pred','error','I');

%%
save('Results_CrossTest.mat','I_pred','error','I');





