function Dump_data(src,event,rate)
% Dump data collected by listener
data_acq = [event.Data];
% [rows, cols] = size(data_acq);
% rows_updated = rows_updated+rows;
% fwrite(fid, rows_updated, 'uint64');
% fwrite(fid, cols, 'uint64');
% fwrite(fid, data_acq, 'double');
disp(size(data_acq));
fname = sprintf('./Data/Data_%s.mat',datestr(clock,30));
save(fname,'data_acq');
end