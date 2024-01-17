clear all ; 
close all ; 
clc  ; 

load coeff.mat 

Fs = 8000 ; 
Tp= .008 ; 
D= .04 ; %la duree a cree %au premier etait .04 non  1(pour l ecouter) 
Np = Tp*Fs ; %# d echan par Tp
N=D*Fs ; 

x= exciteV(N,Np) ;
% x= exciteNV(N) ;%fait a la fin pour test non voise 

n=0:N-1 ; 
stem(n,x) 

s1=filter(1,[1,-A1],x) ; 
s2=filter(1,[1,-A2],x) ; 
s3=filter(1,[1,-A3],x) ; 

t=n/Fs ; 
subplot(311) , plot (t,s1) ,title ('segment synthetique 1 ') 
subplot(312) , plot (t,s2) ,title ('segment synthetique 2 ') 
subplot(313) , plot (t,s3) ,title ('segment synthetique 3 ') 
figure
% soundsc(s1) , pause(2) 
% soundsc(s2) , pause(2) 
% soundsc(s3) , pause(2) 

m=1 ; 
L=4*Np ;
Nf=512 ; %resolution
ov= L/4 ; %floor(L/4); 

F=0:Nf/2-1;
f=(0:Nf/2-1)/Nf*Fs; 

S1=DFTwin(s1,L,m,Nf) ; 
S1=abs(S1); 
S1dB=20*log10(S1) ; 
subplot (321),
plot (f,S1(F+1)) , title('"S1" spctrum') 


subplot(322), Specgm(s1,L,ov,Nf);title('"s1" spectogram')  


F=0:Nf/2-1;
f=(0:Nf/2-1)/Nf*Fs; 

S2=DFTwin(s2,L,m,Nf) ; 
S2=abs(S2); 
S2dB=20*log10(S2) ; 
subplot (323),
plot (f,S2(F+1)) , title('"S2" spctrum') 

subplot(324), Specgm(s2,L,ov,Nf);title('"s2" spectogram')  
 
%s3
F=0:Nf/2-1;
f=(0:Nf/2-1)/Nf*Fs; 

S3=DFTwin(s3,L,m,Nf) ; 
S3=abs(S3); 
S3dB=20*log10(S3) ; 
subplot (325),
plot (f,S3(F+1)) , title('"S3" spctrum') 

subplot(326), Specgm(s3,L,ov,Nf);title('"s3" spectogram') 

figure 
subplot(131) , [H1,W1] = freqz(1,[1,-A1],Nf) ;
plot(W1/pi*Fs/2,20*log10(abs(H1))) 
%%%%%%%%%%%%%%%%%%%%%W est normalise de 1 a pi donc on fait(W1/pi*Fs/2)
subplot(132) , [H2,W2] = freqz(1,[1,-A2],Nf) ;
plot(W2/pi*Fs/2,20*log10(abs(H2)))
subplot(133) , [H3,W3] = freqz(1,[1,-A3],Nf) ; 
plot(W3/pi*Fs/2,20*log10(abs(H3)))

