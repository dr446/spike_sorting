function [dist_mat1] = full_dist_one(data, template)
Nrank = 3;
tic;
dist_mat1 = zeros(size(data,2)-81,1);
    for i = 1:(size(data,2)-81)
        [W, U, mu] = get_svds_new(data(:,i:i+81), Nrank);
        K = W*U';
        dist_mat1(i) = calc_dist(K,template);
    end
toc;
end