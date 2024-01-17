close all ; 
clear all;
 clc;

 N=1000; 
 B=randn(N,1);
 a0=.5 ;
 a1=-.2; a2=.65;
taffine= a0 + a1*(0:N-1)'+a2*((0:N-1).^2)'  ; X=taffine+B;

[A, Res]=TrendQuad(X);

subplot(311) ; plot(B); grid; set(gca,'ylim',[-4 4])
subplot(312); plot(X); grid;
text (1,3000,[ 'a0_{est}= ', num2str(A(1)) ,'a1_{est}= ', num2str(A(2)) , ' a2_{est}= ' , num2str(A(3)) ])  
subplot(313); plot(Res); grid; set(gca,'ylim',[-4 4])
A %a0,a1 et a2

