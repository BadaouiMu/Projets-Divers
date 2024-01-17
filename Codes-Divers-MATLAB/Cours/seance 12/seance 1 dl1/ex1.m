clear all;
close all;
clc;
N=10000; %nombre d'echantillons

m =5; %moyenne 
s =1; %ecart-type

U = randn(1, N); 
X = m + s*U; 

subplot(121)
plot(X, '.', 'MarkerSize', 10)
axis([1, N, m-3*s, m+3*s]) 
hold on 
plot([1, N], [m, m], 'r-')

%distribution des échantillons
[F, C] = hist(X, 20);
histp= 2*F/N;
subplot(122)
bar(C,histp)
hold on
plot(x,p_th, 'g')
axis([m-2*s, m+2*s, -.1, 1/s/sqrt(2*pi)+.1]) ;

