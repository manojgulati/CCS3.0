clear all;
close all;
clc;

load('EXP-1.3_Filtered.mat');
NUM1 = 10;
NUM2 = 10;
%% Compute HT
Y1 = y(:,NUM2);    
%%
offset=0;
for i=1:200
    T1(:,i) = hilbert(y(1+offset:10000+offset,NUM1));
    T2(i) = mean(real(T1(:,i)))+i*mean(imag(T1(:,i)));    
    offset = offset + 10000;
end

T3 = hilbert(y(:,NUM1));
phase1 = atan2(imag(T3),real(T3));
% plot(unwrap(phase1))

T4 = gradient(angle(T3));

plot(time,y(:,NUM1),'r')
hold on
plot(time,atan(imag(T3)./real(T3)),'b')

%%
for i=1:200
    phase_rad(i) = angle(T2(1,1)./T2(1,i));
end

%% Plot phase angle along with magnitude
figure
ax1 = subplot(3,1,1);
plot(time,real(Y1))
legend([strcat('Real Y',num2str(NUM1))]);

ax2 = subplot(3,1,2);
plot(time,gradient(angle(T3)))
legend(['atan']);

ax3 = subplot(3,1,3);
plot(time,angle(T3))
legend(['Angle']);

linkaxes([ax1,ax2,ax3],'x')
%% Compute RMS value for this time series
NUM1=10;
offset=0;
for i=1:200
    Vrms(i) = rms(y(1+offset:10000+offset,NUM1));
    offset=offset+10000;
end

% % Adjusting Magnitude to account for destructive coupling due phase cross over
T=1:200;
Vrms_New = Vrms;
X1 = Vrms(1,99);
del_V = X1-mean(Vrms(1,102:133));
for i=1:31
    Vrms_New(1,102+i) = Vrms_New(1,102+i)+2*del_V;
end
disp('Done');
plot(T,Vrms_New,'b');
hold on;
plot(T,Vrms,'g');
grid on;

%% Plot time domain data from Inductive coils
figure('units','normalized','outerposition',[0 0 1 1])
Path2 = 'Exp-1.3';
for j=1:6
    h(j) = subplot(3,2,j);
%     plot(time,data(:,j),'r')
    hold on;
    plot(T,V_T(j,:),'b')
    xlabel('Time (in seconds)')
    ylabel('Amplitude (in volts)')
    % legend('Raw TD','After Filtering')
    % ylim([.0000 .00015])
    grid on;
    xlim([0 200]);
    set(gca,'XTick',[0:10:200])
    linkaxes(h(j),'x')
end
saveas(gcf,strcat(Path2,'_BW_LPF3_New12','.png'));
% save(strcat(Path1,Path2,'_Filtered_New','.mat'),'time','y');
% close all;



