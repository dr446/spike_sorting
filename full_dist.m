function [dist_mat] = full_dist(data, templates)
Nrank = 3;
tic;
dist_mat = zeros(size(data,2)-81,256);
for j = 1:256
    fprintf('running for template %d \n', j)
    temp = squeeze(templates(j,:,:))';
    for i = 1:(size(data,2)-81)
        [W, U, mu] = get_svds_new(data(:,i:i+81), Nrank);
        K = W*U';
        dist_mat(i,j) = calc_dist(K,temp);
    end
end
toc;
end