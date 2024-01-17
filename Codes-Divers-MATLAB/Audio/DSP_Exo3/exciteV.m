
function x = exciteV(N, Np)
%%%Mustapha badaoui

%% excitation for voiced segments
n = 0:N-1;
x = zeros(1, N);

I = find(rem(n, Np)==0);
x(I) = 1;
