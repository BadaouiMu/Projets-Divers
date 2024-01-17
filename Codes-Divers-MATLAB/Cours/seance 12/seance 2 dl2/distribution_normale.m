clear all ; 
close all ; 
clc; 

%generation la dist rayleigh apartir de dist unif
N=10000;
U=rand(1,N);
s=1 ; %valeur de l ecart type
m=1; 


%application de la fct inverse 
R= s*sqrt(2)*erfinv(2*U-1)+m;

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
s2=s^2 ;
pth=1/s/sqrt(2*pi)*exp(-(pointsR-m).^2/2/s2);

plot (pointsR, pth, 'r' ) , hold off ;
grid
