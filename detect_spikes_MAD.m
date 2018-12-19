function [spikes] = detect_spikes_MAD(data)
tic;
float = single(data);
spikes_mask = isoutlier(float,2,'ThresholdFactor',6);
spikes = spikes_mask;
toc;
end
        
