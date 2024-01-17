

function[A,B]=polyTrend(x,d)
%%%Mustapha badaoui

x=x(:); 
N=length(x); 
w = ones(N,1);
for i = 1:d
    w = [w ((0:N-1).^i)'];
end
A=w\x; 

B=x-w*A;
return