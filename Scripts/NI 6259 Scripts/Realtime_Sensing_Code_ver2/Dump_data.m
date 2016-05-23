function Dump_data(src,event,sampling_rate,filt_hand,num_sensors)
% Dump data collected by listener
data_acq = [event.Data];
for i=1:num_sensors
%     disp(i);
    data_filt(:,i) = filter(filt_hand, data_acq(:,i));
    data_rms(i) = rms(data_filt(:,i)); % compute RMS value of measured signals
    plot(data_rms(:,i));
end
disp(size(data_rms));
fname = sprintf('./Data/Data_%s.mat',datestr(clock,30));
save(fname,'data_rms');
end