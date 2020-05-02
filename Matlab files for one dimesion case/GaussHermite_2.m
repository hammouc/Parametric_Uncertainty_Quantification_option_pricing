function [x, w] = GaussHermite_2(n)

% This function determines the abscisas (x) and weights (w) for the
% Gauss-Hermite quadrature of order n>1, on the interval [-INF, +INF].
i   = 1:n-1;
a   = sqrt(i/2);
CM  = diag(a,1) + diag(a,-1);

% Determining the abscissas (x) and weights (w)
[V L]   = eig(CM);
[x ind] = sort(diag(L));
V       = V(:,ind)';
w       = sqrt(pi) * V(:,1).^2;
end