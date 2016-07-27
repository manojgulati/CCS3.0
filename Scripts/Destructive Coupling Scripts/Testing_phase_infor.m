clear all;
close all;
clc;

format long e;

load('EXP-1.3_Filtered.mat');
NUM1 = 10;
NUM2 = 10;


% % Compute HT
YT = hilbert(y(4001:14000,NUM1));
Y1 = hilbert(y(:,NUM1));

% phase_rad = atan2(imag(Y1),real(Y1));
% phase_grad = gradient(phase_rad);
    
% YT = Y1(10001:20000,1);
%%
% offset=0;
% Y1 = [];

% offset=0;
% Y1 =[];
% for i=1:200
%     Y1 = [Y1 hilbert(y(1+offset:10000+offset,NUM1))];
%     offset = offset + 10000;
% end
% %
offset=0;
for i=1:200
    phase_rad(:,i) = angle(YT ./ Y1(1+offset:10000+offset,1));
    offset = offset+10000;
end

%%
phase_deg_res = rad2deg(reshape(phase_rad, [2000000 1]));
phase_deg_res = phase_deg_res';
% 
phase_deg_grad = gradient(abs(phase_deg_res));

% for i=1:2000000
%     if(phase_deg_res(1,i)<-74)
%         phase_deg_res(1,i) = abs(phase_deg_res(1,i));
%     end
% end

% % Test smoothing function to remove ripples
% k_loc = find(phase_deg_grad>50|phase_deg_grad<-50);
% 
% % % Refine recovered phase difference information  
% phase_deg_res_ref = phase_deg_res;
% phase_deg_res_ref(k_loc) = NaN;


%% Plot phase angle along with magnitude
clc;
figure
ax1 = subplot(3,1,1);
plot(time,real(Y1))
legend([strcat('Raw Data Y',num2str(NUM1))],'Location','northwest');

ax2 = subplot(3,1,2);
plot(time,phase_deg_grad)
legend(['Gradient of phase difference'],'Location','northwest');

ax3 = subplot(3,1,3);
plot(time,phase_deg_res)
hold on;
% plot(phase_deg_res_ref,'r-')
% ylim([-10 200]);
legend(['angle(Y10)-angle(Y-INIT)'],'Location','northwest');
grid on;

linkaxes([ax1,ax2,ax3],'x')
