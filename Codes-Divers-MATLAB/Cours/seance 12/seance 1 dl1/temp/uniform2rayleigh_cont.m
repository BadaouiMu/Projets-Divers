clear all ; 
close all ; 
clc; 

%generation la dist rayleigh apartir de dist unif
N=1000;
U=randn(1,N);
m=5 ;
s=1 ; %valeur de l ecart type


%application de la fct inverse 
R=  m + s*U; 

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
pth=(1/s*pointsR*sqrt(2*pi)) .* exp(-((log10(pointsR)-m).^2)./(2*s2)) ; 
plot (pointsR, pth, 'r' ) , hold off ;
grid
