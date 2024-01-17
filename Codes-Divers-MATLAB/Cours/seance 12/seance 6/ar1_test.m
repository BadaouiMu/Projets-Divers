close all ; 
clear all ; 
clc ; 
 
%parametre du modele AR-1 
a1=-.15 ; 
s2= 1.3 ; 

N=1000 ; 
w=sqrt(s2) * randn(1,N ) ;
A=[1,a1] ; 
x=filter(1,A,w) ; 
x1 = [ 0 x(1:end-1)] ; %x(n+1) 

%%estimation des coefficients de la fct d auto covariance apartir des
%coefficients de modele 

R0_par = s2 / (1-a1^2)  
% R1_par = -a1 * R0_par 
% R2_par = -a1 * R1_par 
% R3_par = -a1 * R2_par 

K=5 ; 
R=zeros (1,2*K-1) ;  
R(K)=R0_par ;

for k=1:K-1,
    R(K+k) = -a1*R(K+k-1); 
    R(K-k) = R(K+k); 
end 
stem(R,'fill') 

%estimation des coeff du modele apartir des coff de la fctd'auto covariance 
R0 = sum(x.*x ) 
R1 = sum(x.*x1 )

a1_est = -R1/R0  
s2_est = R0/N*(1-a1_est^2 )

