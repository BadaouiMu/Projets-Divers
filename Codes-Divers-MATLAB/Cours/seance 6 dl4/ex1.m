clear all; 
close all ; 
clc ; 

Fs=10000;% freq d'echan
N=1000;

n= 0: N-1 ; %vecteur temps normalise 

Fs =  1000 ;  %frequance d echan
Ts = 1/Fs ; 

n= n*Ts; %vecteur temps reel 

A=sqrt(2); 
F0=80;

s = A*sin(2*pi*F0*n);
s=s.*randn(1,N);
subplot(211); plot(s); grid;

f =  1: 0.01 : 2; 
Sw = fft(s, length(f));
subplot(212) ,plot(f, 20*log10(abs(Sw)))
