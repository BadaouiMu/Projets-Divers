close all ; 
clear all ; 
clc; 

N=10000; B=randn(N,1); a=4; b = 3; f0=0.01; phi=pi/6;
tseason = a + b*cos(2*pi*f0*(0:N-1)'-phi);
X = tseason + B;
[A, Res]=trendseason(X,f0);
 Ath = [a; b*cos(phi); b*sin(phi)] ;
Aest_th = [A , Ath  ]
C = [A(1); sqrt(A(2)^2 + A(3)^2); 180/pi*atan(A(3)/A(2))]; %trouver b et gamma par beta1 et beta2
D = [a; b; phi*180/pi] ;
a_b_phi_est_the = [C D]
subplot(311) ; plot(B); grid; set(gca,'ylim',[-4 4])
subplot(312); plot(X); grid;
text (-1,-3,[ 'a_{est}= ', num2str(C(1)) , ' b_{est}= ' , num2str(C(2)) , ' phi_{est}= ' , num2str(C(3)),'°' ]);  

subplot(313); plot(Res); grid; set(gca,'ylim',[-4 4])
hold on 
plot (B,'x') 
