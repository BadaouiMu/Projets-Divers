function x= exciteV(N,Np) 

n=0:N-1 ; 

x = zeros (1,N) ; 

I=find(rem(n,Np)== 0 ) ; %au premier etait n non n/2 
x(I) = 1 ; 