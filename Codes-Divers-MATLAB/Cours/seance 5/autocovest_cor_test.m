close all; 
clear all; 
clc; 

%*******************METHODE : méthode de corrélation**********************

%construction de la matrice D
N=100 ; 
K=N/10 ;
Res=randn(N,1);
C =[Res; zeros(K-1,1)];     % première colonne de D slide 80
R =[Res(1), zeros(1, K-1)]; % première ligne de D slide 80

D = toeplitz(C,R);

R_est = D'*D/N; % relation slide 80 //c'est la matrice de covariance estimee par la methode de correlation

figure
R = [R_est(1, end:-1:2), R_est(1, :)]; % vecteur ligne qui contient: R(-k+1) ... R(-1) R(0) R(1) ... R(k-1)
subplot(211), stem(-K+1:K-1, R, 'fill')
title('Estimation de la covariance par la méthode de corrélation');



