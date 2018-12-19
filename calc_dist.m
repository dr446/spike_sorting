function [dist] = calc_dist(data, template)
tic;
distance = data - template;
sqr = distance.*distance;
dist = sum(sqr(:));
end