close all ;
 
N=10000;
 a=-3 ; 
b=+3 ; 
rba = 1/(b-a) ;
m=(a+b)/2 ;
x= a + (b-a) * rand (1,N);

subplot(121),
plot(x,'.','MarkerSize',10);
axis([1,N,a-1,b+1]); 
hold on ,
plot ([1,N] , [a a], 'g:') 
plot ([1,N] , [b b], 'g:') 
hold off, 

subplot(122),
Nb=15;
[F,C] = hist(x,Nb);
P=F/N*Nb*rba; %on choix pour que le max de l'axe y soit 1/b-a non a N  %on doit multiplie par nb de barette et diviser sur b-a    
bar(C,P) %on utiliser directement hist(x) mais l avantage de barette et qu'il choix des bar inf a 1 par default
axis([a-1,b+1,0,rba+.1]); 
hold on , 
n=a-1:.01: b+1;
px = ( (n-a>=0) - (n-b>=0 ) ) / (b-a) ; 
plot (n,px,'r') 
plot ( [m,m] , [0 rba+.2] , 'g:') 




