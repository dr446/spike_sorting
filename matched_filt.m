function [filtered, r, mxv, maxvec] = matched_filt(spike, templates)
tic;
%initialise ouput
filtered = zeros(256,151,64);
for i = 1:256
    %set to current template
    temp = flipud(squeeze(templates(i,:,:)));
   for j = 1:64
       %convolve current channel for signal and template
       filtered(i,:,j) = conv(spike(j,:),temp(:,j),'same');
   end
    
end
%find max value and index
%[mxv ind] = max(filtered(:));
%convert index: r = template, c = timestampe, p = channel
%[r,c,p] = ind2sub(size(filtered),ind);
%output vector of max values for each template
%maxvec = max(filtered,[],[2 3]);
filt_summed = sum(filtered,3);
[mxv ind] = max(filt_summed(:));
[r,c,p] = ind2sub(size(fil_summed),ind);
maxvec = max(filt_summed,[],2);
toc;
plot(maxvec)
end