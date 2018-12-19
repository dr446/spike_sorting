function [filt] = filter_data(data, fhigh, flow, fs)
%taken from preprocess data in kilosort
tic;
if flow<fs/2
    [b1, a1] = butter(3, [fhigh/fs,flow/fs]*2, 'bandpass');
else
    [b1, a1] = butter(3, fhigh/fs*2, 'high');
end

%filt = filter(b1,a1,data);

filt = filter(b1, a1, data);
filt = flipud(filt);
filt = filter(b1, a1, filt);
filt = flipud(filt);
toc;
end