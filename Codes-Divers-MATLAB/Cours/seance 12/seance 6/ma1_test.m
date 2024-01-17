close all ; 
clear all ; 
clc ; 
 
%parametre du modele Ma-1 
b=1 ; 

N=1000 ; 
w=randn(1,N ) ;
B=[1,b] ; 
x=filter(B,1,w) ; 

x1 = [ 0 x(1:end-1)] ; 
sp1 = sum(x.*x1 ); 
sp = sum(x.*x ); 

if (sp >=0 ) 
    rho = min(.5,sp1/sp ) ; 
else 
    rho = max (-.5 , sp1/sp) ; 
end

b1 = (1+sqrt(1-4*rho^2)) / (2*rho) 
b2 = (1-sqrt(1-4*rho^2)) / (2*rho)  

