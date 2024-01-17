function [theta, dx]=trendseason(x,f0)
x=x(:); N=length(x); U=ones(N,1);
C=cos(2*pi*f0*(0:N-1)') ; S=sin(2*pi*f0*(0:N-1)') ;
M = [N U'*C U'*S ; C'*U C'*C C'*S ; S'*U S'*C S'*S] ;
theta=inv(M)*[U';C'; S']*x;
dx = x - [U C S]*theta;
return