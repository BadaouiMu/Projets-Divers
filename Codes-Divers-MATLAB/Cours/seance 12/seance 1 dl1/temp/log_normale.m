clear all ; 
close all ; 
clc; 

%generation sla dist exp apartir de dist unif
N=2000;
U=rand(1,N);
lambda= 2 ; 

%application de la fct inverse 
X=-log(U)/ lambda ;

subplot(121),
plot(X,'.','MarkerSize',10);
% axis([1,N,a-1,b+1]); 
hold on ,
plot ([1,N] , [a a], 'g:') 
plot ([1,N] , [b b], 'g:') 
hold off, 

subplot(122),

%verification 
maxx =max(X) ; 
moyX=1/lambda;
%choix de resolution 
lk =moyX/10 ; pointsx= (0: lk:maxx); 
%
[nn,xx] =hist(X,pointsx); 
bar(xx, nn/(N*lk)); hold on 
% theoretical exp distribution 
pth=lambda * exp(-lambda*pointsx) ; 
plot (pointsx, pth, 'r' ) , hold off ;
grid
