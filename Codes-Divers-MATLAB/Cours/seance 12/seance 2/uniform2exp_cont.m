clear all ; 
close all ; 
clc; 

%generation sla dist exp apartir de dist unif
N=2000;

lambda= 2 ; 
U=rand(1,N);

%application de la fct inverse 
X=-log(1-U)/ lambda ; 

%verification 
maxx =max(X) ; 
moyX=1/lambda;
%choix de resolution 
lk =moyX/5 ; pointsx= (0: lk:maxx); 
%
[nn,xx] =hist(X,pointsx); 
bar(xx, nn/(N*lk)); hold on 
% theoretical exp distribution 
pth=lambda * exp(-lambda*pointsx) ; 
plot (pointsx, pth, 'r' ) , hold off ;
grid
