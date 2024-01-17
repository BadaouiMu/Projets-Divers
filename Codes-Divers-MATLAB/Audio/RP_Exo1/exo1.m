%%%Mustapha badaoui

clear all;
close all;
clc;
N=1000;
U=rand(1,N);



X=acos(1-2*U);
moyX=0;
lk=(pi/2)/pi; 
maxX=max(X);
pointsX=(0:lk:maxX);
[nn xx]=hist(X,pointsX);

bar(xx,nn/(N*lk)),hold on 
pth=(1/2)*sin(pointsX);
plot(pointsX,pth,'r'), hold off; grid

E=pi/2 
V=(pi^2)/4-2 

E_est=mean(X)  
V_est=var(X)   


derive_E=abs(E-E_est/E) 
derive_V=abs(V-V_est/V) 

