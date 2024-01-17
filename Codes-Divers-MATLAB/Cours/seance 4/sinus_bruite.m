close all ; 
clear all ; 
clc; 
 
N=20; %nb d echan 

n= 0: N-1 ; %vecteur temps normalise 

Fs =  1000 ;  %frequance d echan
Ts = 1/Fs ; 

n= n*Ts; %vecteur temps reel 


F0 = 80; % frequence de la sins 
A =3 ; %ampl de la sinus

SNRdB = 15 ; %donnee 
SNR = 10^(SNRdB/10 ); 
S= A*A/2 ; %Puiss signal
B= S/SNR;  %puiss bruit 

s = sqrt (B) ; % ecart-type bruit 


ss = A*sin(2*pi*F0*n);

sb = s*randn (1,N)  ; %signal bruit 
ssb = ss+ sb; 

subplot (311) , plot (n,ss) , title ('sinus non bruite ') ; 
subplot (312) , stem(sb) , title ('bruit gaussien  ') ;
subplot (313) , plot (n,ssb) , title ('sinus bruite ') ; 
hold on 
plot(n,ss,'x') 


