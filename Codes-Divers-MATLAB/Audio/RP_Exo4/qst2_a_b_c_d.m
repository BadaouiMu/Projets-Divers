%%%Mustapha badaoui

clear all;
close all, clear all;
load('RP_Exo4.mat')

X=Xar;
N=length(Xar);
sig=3;
n=0:N-1;
a1=0.5;
a2=-0.25;
A=[1,a1,a2];

subplot(211) ,plot(n,X);
title('Xar')
Nf = 512;
f=(0:Nf/2-1);
Sa =fft(Xar,Nf);
SadB = 20*log10(abs(Sa(1:Nf/2)));
subplot(212),plot(f,SadB), 
title('spectre')

figureS

%valeurs theo de R(k)
K=6;
A1= [1 a1 a2;% 1 er ligne
    a1 a2 0;
    a2 0 0];
A2= [1 0 0;% 1 er ligne
    a1 1 0;
    a2 a1 1];
s=[sig;0;0];
A12=A1+A2;
Rth=A12\s;
Rth(1)=2*Rth(1);
Rth=[Rth;zeros(K-3,1)];
for k= 4:K-1
    Rth(k)=-(a1*Rth(k-1) + a2*Rth(k-2));
end
Rsth=[Rth(K:-1:2)',Rth.'];
Rtheo=Rsth(K:end)


xi=[X, zeros(1,K-1)];
D=toeplitz(xi',[xi(1) zeros(1,K-1)]);
Rest=D'*xi'/N;
Rsest=[Rest(K:-1:2)',Rest.'];
Restimer=Rsest(K:end) %R0 R1 R2
 
stem(Rsth)%ou stem
hold on
stem(Rsest,'r')
