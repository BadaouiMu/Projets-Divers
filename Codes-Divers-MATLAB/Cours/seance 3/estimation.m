%exemple de loi des grands nb 
%l estimation de moy et variance 

clear all ; 
close all; 
clc; 


M=10 ; %# d experience
N=10 ; %# nb d ech par exp 

%th 
a=1; 
b=4; %a,b bornes d intervalle de la distribution uniforme 
m= (a+b)/2; %moyenne theorique 
v= (b-a)^2 /12 ; %variance 

dsp_th = v/N ; %dispertion th voir cours (s^2 = sx^2/N ) 

%exp 
mexp = zeros(1,M) ; %vecteur moy exp
dsp_exp = zeros(1,M) ; %vecteur var exp

for e = 1: M; 
    u= a + (b-a) * rand (1,N); %generation de N ech ubiformement distribues dans l'intervalle a b  
    mexp(e) = sum(u) /N ;
    dsp_exp(e) = sum(((u-m)-(mexp(e)-m)).^2)/N ; %voir cours 
    
    
end 
dsp_expm= sum(dsp_exp)/M/N ; 
stem(mexp, 'fill' ); hold on 
plot ([0 M+1 ] , [m m] ) 
legend ('moy th ', 'moy estm' );
title ([ ' Dispersion th = ' , num2str(dsp_th),' Dispersion exp = ' , num2str(dsp_expm), ' # echant = ' , num2str(N)]) ; 
    
    
    
    
    
    
