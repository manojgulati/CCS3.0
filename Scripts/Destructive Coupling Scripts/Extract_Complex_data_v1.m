clc;
clear all;
close all;

Path1 = 'EXP-08';

load(strcat(Path1,'_ComplexData.mat'));
var_length = 9; % No. of channels

T_calseq = 150;

Ext_Data = Ext_Data';


%% Code for extracting 150sec waveform having calibrator sequence

% Set this var to define start of 150sec complex waveform 
x_begin =  23;
x_end = x_begin+(T_calseq-1);

% %
Data_Slot = Ext_Data(x_begin:x_end,:);


% % Plot time domain data from Inductive coils
figure('units','normalized','outerposition',[0 0 1 1])
for j=1:var_length
    h(j) = subplot(var_length/3,3,j);
    plot([1:1:T_calseq],abs(Data_Slot(:,j)),'b')
    xlabel('Time (in seconds)')
    ylabel('Amplitude (in volts)')
    grid on;
    xlim([0 T_calseq]);
    set(gca,'XTick',[0:10:T_calseq])
    linkaxes(h,'x')
end
saveas(gcf,strcat(Path1,'_Ext_CalSeq','.png'));
% 
save(strcat(Path1,'_Ext_CalSeq','.mat'),'Data_Slot');
close all;








