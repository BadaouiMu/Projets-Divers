%%%Mustapha badaoui

clear all;
close all, clear all;
load('RP_Exo4.mat')


N=length(Xma);
n=0:N-1;

s2=3;
b1=0.75;
b2=-0.2; 
B=[1,b1,b2];

X=Xma;
subplot(211) ,plot(n,X);
title('Xma')
Nf = 512;
f=(0:Nf/2-1);
Sa =fft(Xma,Nf);
SadB = 20*log10(abs(Sa(1:Nf/2)));
subplot(212),plot(f,SadB), 
title('spectre')