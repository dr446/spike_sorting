function [W, U, mu] = get_svds_new(dWU, Nrank)
%From kilosrt
[Wall, Sv, Uall] = svd(single(dWU), 0);
[~, imax] = max(abs(Wall(:,1)));
Uall(:,1) = -Uall(:,1) * sign(Wall(imax,1));
Wall(:,1) = -Wall(:,1) * sign(Wall(imax,1));

Wall = Wall * Sv;

Sv = diag(Sv);
mu = sum(Sv(1:Nrank).^2).^.5;
Wall = Wall/mu;

W = Wall(:,1:Nrank);
U = Uall(:,1:Nrank);