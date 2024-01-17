close all ; 
clear all;
 clc;

 N=100; 
 B=randn(N,1); 
 a1=2; a2=-0.1;
taffine= a1 + a2*(0:N-1)'; X=taffine+B;

[A, Res]=trendaff(X);

subplot(311) ; plot(B); grid; set(gca,'ylim',[-4 4])
subplot(312); plot(X); grid;
text (1,3,[ 'a1_{est}= ', num2str(A(1)) , ' a2_{est}= ' , num2str(A(2)) ])  
subplot(313); plot(Res); grid; set(gca,'ylim',[-4 4])
A %a1 et a2

