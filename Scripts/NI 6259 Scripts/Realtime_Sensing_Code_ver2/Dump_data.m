function Dump_data(src,event,sampling_rate,filt_hand,num_sensors)
% Dump data collected by listener
data_acq = [event.Data];
for i=1:num_sensors
%     disp(i);
    data_filt(:,i) = filter(filt_hand, data_acq(:,i));
    plot(data_filt(:,i));
end
disp(size(data_filt));
fname = sprintf('./Data/Data_%s.mat',datestr(clock,30));
save(fname,'data_filt');
end