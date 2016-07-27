clear all;
close all;
clc;

format long e;
Path1 = './Raw_Data/';
Fname = 'EXP-1';

load(strcat(Path1,Fname,'_Filtered.mat'));
NUM1 = 1;
NUM2 = 2;

% No of data points measured every sec (sampling rate)
N = 10000;

% The purpose of this excercise is to detect start and end timestamp for
% destructive coupling and detect polarity

%% Compute Hilbert Transform
YT = hilbert(y(1+5000:N+5000,NUM1));
Y1 = hilbert(y(:,NUM1));
Y2 = hilbert(y(:,NUM2));

% % Compute phase shift wrt to initial 1 second duration (10k data points)
offset=0;
for i=1:200
    phase_rad(:,i) = angle(YT ./ Y1(1+offset:N+offset,1));
    offset = offset+N;
end

% Reshape to make a 1D vector
phase_deg_res = rad2deg(reshape(phase_rad, [2000000 1]));
% phase_deg_res = wrapTo180(phase_deg_res);
phase_deg_res = phase_deg_res';

% Compute gradient of the phase difference to understand changes
phase_deg_grad = gradient(abs(phase_deg_res));

% % Fix the phase difference vector to account for phase crossover in angle computation
% for i=1:2000000
%     if(phase_deg_res(1,i)<-74)
%         phase_deg_res(1,i) = abs(phase_deg_res(1,i));
%     end
% end

%% Plot phase angle along with magnitude
clc;
figure
ax1 = subplot(3,1,1);
plot(time,real(Y1))
grid on;
legend([strcat('Raw Data Y',num2str(NUM1))],'Location','northwest');

ax2 = subplot(3,1,2);
plot(time,phase_deg_grad)
grid on;
legend(['Gradient of phase difference'],'Location','northwest');

ax3 = subplot(3,1,3);
plot(time,abs(phase_deg_res))
hold on;
grid on;
% plot(phase_deg_res_ref,'r-')
% ylim([-10 200]);
legend(['angle(Y10)-angle(Y-INIT)'],'Location','northwest');
grid on;

linkaxes([ax1,ax2,ax3],'x')

%% 
% NB: Currently this method for computing starting and ending timestamp for
% destructive coupling is manual and also same is the case with polarity,
% but this has to be fixed to make this system automated and spit out
% correct RMS values.

start_TS = 102;
end_TS = 103;

%% Compute RMS value for this time series

offset=0;
for i=1:200
    Vrms(i) = rms(y(1+offset:N+offset,NUM1));
    offset=offset+N;
end

% % Adjusting Magnitude to account for destructive coupling due phase cross over
Vrms_New = Vrms;
% Find amplitude before destructive coupling (3seconds before destructive coupling start TS)
Xinit = Vrms(1,start_TS-3);

del_V = Xinit-mean(Vrms(1,start_TS:end_TS));
for i=1:(end_TS-start_TS)
    Vrms_New(1,start_TS+i) = Vrms_New(1,start_TS+i)+2*del_V;
end
disp('Done');

plot(time,Vrms_New,'b');
hold on;
plot(time,Vrms,'g');
grid on;

%% Test plot for different functions

figure
ax1 = subplot(4,1,1);
plot(time,Y1)
grid on;
legend('Raw Data');

ax2 = subplot(4,1,2);
plot(time,abs(Y1))
grid on;
legend('Magnitude');

ax3 = subplot(4,1,3);
plot(time,angle(Y1))
grid on;
legend('Angle');

ax4 = subplot(4,1,4);
plot(time,unwrap(angle(Y1)))
grid on;
legend('Unwrapped Angle','Location','northwest');


linkaxes([ax1,ax2,ax3,ax4],'x')

%% Extracting phase difference using cross PSD (CPSD)

for i = 1:1;
    [Pxy,Freq] = cpsd(y(:,1),y(:,i));
    coP = real(Pxy);
    quadP = imag(Pxy);
    phase(:,i) = atan2(coP,quadP);
end

%% Extracting phase using FD information (FFT)
clc
N = 2*10^6;

fft_y1 = fft(y(:,1));
fft_Y1 = fftshift(fft_y1);
fft_y2 = fft(y(:,2));
fft_Y2 = fftshift(fft_y2);

T1 = abs(fft_Y1(N/2+1:end,1));
T1 = T1';
T2 = abs(fft_Y2(N/2+1:end,1));
T2 = T2';

plot(T1,'b');
hold on
plot(T2,'g');
plot(11999,T1(1,11999),'r*')
plot(11999,T2(1,11999),'k*')
% This return a single point phase difference(PD) not instantaneous PD 
phase_rad_test = angle(T1(1,11999)/T2(1,11999));

%% Zero crossing detector
Y = y(:,1);

x = diff(sign(Y));
indx_up = find(x>0);
indx_down = find(x<0);
indx = find(x<0|x>0);

for i=1:size(indx_down,1)
    DF(i) = indx_up(i,1)-indx_down(i,1);
end

DF_demean = DF-mean(DF);
%%
clc;
figure
ax1 = subplot(2,1,1);
plot(Y)
grid on;

ax2 = subplot(2,1,2);
% plot(indx_down(DF_demean>2|DF_demean<-2),DF_demean(DF_demean>2|DF_demean<-2),'r-')
plot(indx_down,DF_demean,'r-');
grid on;
linkaxes([ax1,ax2],'x')

