clear all;
close all;
clc;

N=10000; %nombre d'echantillons

% distribution normale 
lamda = 2; 
m = 0.5; 

%distribution théorique 
step = .01;
x = -12:step:12; 
Xth = gampdf(x,lamda,m); 
plot(x, Xth) 

%estimation de N echantillons la distribution
Xest = randn(1, N); 
Xest = m + lamda*Xest; 
subplot(121)
plot(Xest, '.', 'MarkerSize', 10)
axis([1, N, m-3*lamda, m+3*lamda]); 
hold on 
plot([1, N], [m, m], 'r-')

%distribution des échantillons
[F, C] = hist(Xest,10);
histp= F/N*m*lamda;
subplot(122)
bar(C,histp)
hold on
plot(x, Xth, 'g')
axis([lamda, m+5*lamda, 0, 0.5]);


