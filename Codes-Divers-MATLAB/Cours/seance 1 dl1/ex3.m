clear all;
close all;
clc;

N=10000; %nombre d'echantillons

% distribution normale 
lamda = 1;  

%distribution théorique 
step = .01;
x = -0:step:12; 
Xth =lamda*exp(-lamda*x);

%estimation de N echantillons la distribution exponentielle
Xest = randn(1, N); 
Xest = lamda-lamda*Xest; 
subplot(121)
plot(Xest, '.', 'MarkerSize', 10)
axis([1, N, -3*lamda, 3*lamda+1]) ;
hold on 
plot([1, N], [lamda, lamda], 'r-')

%distribution des échantillons
[F, C] = hist(Xest, 10);
histp= F/N*lamda;
subplot(122)
bar(C,histp)
hold on
plot(x, Xth, 'g')
axis([lamda, 3*lamda+1, 0, lamda+.1]);



