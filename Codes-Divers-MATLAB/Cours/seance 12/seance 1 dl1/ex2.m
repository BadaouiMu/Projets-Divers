clear all;
close all;
clc;

N=10000; %nombre d'echantillons

% distribution normale 
s = 0.5; 

%distribution théorique 
step = .01;
x = -0:step:12; 
Xth = raylpdf(x,s); 
plot(x, Xth) 

%estimation de N echantillons la distribution 
Xest = randn(1, N); 

%appliquer une transformation lineaire 
Xest =  s*Xest;  
subplot(121)
plot(Xest, '.', 'MarkerSize', 10)
axis([1, N, -3*s, 3*s]) ;
hold on 
plot([1, N], [s*sqrt(pi/2), s*sqrt(pi/2)], 'r-')

%distribution des échantillons
[F, C] = hist(Xest, 10);
histp= F/N*3;
subplot(122)
bar(C,histp)
hold on
plot(x, Xth, 'g')
axis([0, 7*s, -.1, 1/s+.1]) ;



