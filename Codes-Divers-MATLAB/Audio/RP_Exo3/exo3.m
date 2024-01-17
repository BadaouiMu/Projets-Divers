%%%Mustapha badaoui


close all, clear all

load('RP_Exo3.mat')
N = length(X);
[A, B]=polyTrend(X,4);
les_valeurs_de_ai=A' 
k=6;
C=[B;zeros(k-1,1)];
R=[B(1) zeros(1,k-1)];
D=toeplitz(C,R);
Rest= D' *D / N;
Rl=Rest(1, :);
R=[Rl(k:-1:2),Rl];
R_de_0_a_5=R(k:end)
stem(R,'fill')