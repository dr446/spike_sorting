% this file takes in the spike data and streams it x bits at a time. 
function data_stream
% open file and plot

% 64 channels of
fid = fopen('wireless_processed.bin','r');
dat_t = fread(fid,'*int16');
data=reshape(dat_t,64,length(dat_t)/64); 
data_offset=data+int16(repmat([(0:63)*200]',1,size(data,2)));
data_size = size(data);
n_o_tetrodes = data_size(1,1);
n_o_samples = data_size(1,2);
%add timestamp in first column
timestamp = [1:n_o_samples];
data = double(data);
shaped_data  = vertcat(timestamp, data);
shaped_data = transpose(double(shaped_data));
save('shaped_data', 'shaped_data');
plot(data_offset');

