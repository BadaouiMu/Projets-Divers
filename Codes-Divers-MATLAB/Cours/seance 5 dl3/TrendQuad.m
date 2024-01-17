function [A,dx]=TrendQuad(x)
x=x(:); 
N=length(x); 
w=[ones(N,1)  (0:N-1)' ((0:N-1).^2)' ];
A=w\x; dx=x-w*A;
return