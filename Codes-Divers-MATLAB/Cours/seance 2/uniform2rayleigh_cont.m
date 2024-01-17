clear all ; 
close all ; 
clc; 

%generation la dist rayleigh apartir de dist unif
N=2000;
U=rand(1,N);
s=1 ; %valeur de l ecart type


%application de la fct inverse 
R= s*sqrt(-2*log(U));

%verification 
maxR =max(R) ; 
minR =min(R) ; 


%choix de resolution 
lk =(maxR-minR)/20 ;
pointsR= (0: lk:maxR); 
%
[nn,xx] =hist(R,pointsR); 
bar(xx, nn/(N*lk)); hold on 
% theoretical exp distribution 
s2=s^2 ;
pth=pointsR/s2 .* exp(-pointsR.^2/2/s2) ; 
plot (pointsR, pth, 'r' ) , hold off ;
title(['distrb de ray.. de sigma2= ' , num2str(s2) ]);
grid
