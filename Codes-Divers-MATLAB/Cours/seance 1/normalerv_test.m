close all ;
 
N=10000; %echamtillons 
 m=4 ; %moy 
v=3 ;  %var
s=sqrt(v);
% s=4;
% x=m+s*randn(1,N); 
x=random('norm',4,s,1,N);
a=5 ; 

subplot(121),
plot(x,'.','MarkerSize',10);
axis([1,N,m-a*s, m+a*s]); 
hold on ,
plot ([1,N] , [m m], 'g:') 
hold off, 

rba=1/s/sqrt(2*pi);
subplot(122),
Nb=15;
[F,C] = hist(x,Nb);
P=F/N*Nb*rba/3;   %3 c est uniquement aproximative il n a pas de sens 
bar(C,P) 
axis([m-a*s,m+a*s, 0 , rba+.2]); 
hold on , 
n=a-m-a*s:.01:m+a*s;
px = exp(-(n-m).^2/2/v) *rba ; 
plot (n,px,'r') 
plot ( [m,m] , [0 rba+.2] , 'g:') 





