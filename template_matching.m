fid = fopen('wireless_processed.bin','r'); % loads file
dat_t = fread(fid,'*int16'); %converts into int16s.
data=reshape(dat_t,64,length(dat_t)/64); %converts into 64 channels (for 64 tetrodes.
data_offset=data+int16(repmat([(0:63)*200]',1,size(data,2))); %adds an offset so all 64 channels can be seen together.
plot(data_offset')


