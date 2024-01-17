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
%valeurs theo de R(k)
K=6;
Rth=zeros(K,1);
Rth(1)=s2*(1+b1^2+b2^2);%val de R(0) théorique
Rth(2)=s2*(b1+b2*b1');%val de R(1) theo
Rth(3)=s2*(b2);%val de R(2) theo

Rsth=[Rth(K:-1:2)',Rth.'];
Rtheo=Rsth(K:end)


xi=[X, zeros(1,K-1)];
D=toeplitz(xi',[xi(1) zeros(1,K-1)]);
Rest=D'*xi'/N;
Rsest=[Rest(K:-1:2)',Rest.'];
Restimer=Rsest(K:end) 

stem(Rsth,'fill')%ou stem
hold on
stem(Rsest,'r')
legend('Therique','Estimation')