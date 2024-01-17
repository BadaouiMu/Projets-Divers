clear all ; 
close all ; 
clc; 

%generation la dist rayleigh apartir de dist unif
N=1000;
U=rand(1,N);
m=1 ; 
l=1; %lamda 


%application de la fct inverse 
R= -log(U)*m/l;

%verification 
maxR =max(R) ; 
minR =min(R) ; 

%choix de resolution 
lk =(maxR-minR)/30 ;
pointsR= (0: lk:maxR); 
%
[nn,xx] =hist(R,pointsR); 
bar(xx, nn/(N*lk)); hold on 

% theoretical distribution 
pth=(l.^m).*pointsR.^(m-1).*exp(-pointsR.*l)./gamma(m);

plot (pointsR, pth, 'r' ) , hold off ;
grid
