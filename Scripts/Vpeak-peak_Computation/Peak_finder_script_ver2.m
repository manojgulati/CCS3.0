% Script to load preprocessed slotted data and find peaks to computed Vpeak and Vrms

clc;
clear all;
close all;

Path1 = 'Exp-';
input_channel = 1;
num_channels = 5;
Path2 = './Processed_data/';
Path3 = './Filtered_data/';
exp_num = 7;

while (input_channel<=num_channels)

    load(strcat(Path3,Path1,num2str(exp_num),'_Filtered_extracted_',num2str(input_channel),'.mat')); 
    for j=1:15
        AUT_demean(:,j) = data_ext(:,j) - mean(data_ext(:,j));
        AUT_rms(j) = rms(AUT_demean(:,j));
%         disp('PQR:');
%         disp(j);
    end
    Vrms(input_channel,:) = AUT_rms;
% %     disp('CHK:');
%     disp(input_channel);
    clear AUT_rms;
    input_channel = input_channel+1;    
end

save(strcat(Path2,Path1,num2str(exp_num),'_RMS','.mat'),'Vrms');





