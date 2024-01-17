clear all ; 
close all ; 
clc; 

%generation la dist rayleigh apartir de dist unif
N=1000;
U=rand(1,N);
s=1 ; %valeur de l ecart type
s2=s^2 ;
m=1; 


%application de la fct inverse 
R= exp(sqrt(2*s2)*erfinv(2*U-1)+m);

%verification 
maxR =max(R) ; 
minR =min(R) ; 

%choix de resolution 
nbb=N^(1/3) ;

lk =(maxR-minR)/50 ;
pointsR= (0: lk:maxR); 
%
[nn,xx] =hist(R,pointsR); 
bar(xx, nn/(N*lk)); hold on 

% theoretical distribution 
pth=1./pointsR/s/sqrt(2*pi).*exp(-(log(pointsR)-m).^2/2/s2);

plot (pointsR, pth, 'r' ) , hold off ;
grid
