function [A,dx]=trendaff(x)
x=x(:); 
N=length(x); 
w=[ones(N,1) (0:N-1)'];
A=w\x; dx=x-w*A;
return