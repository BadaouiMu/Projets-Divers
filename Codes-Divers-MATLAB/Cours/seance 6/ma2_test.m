close all ; 
clear all ; 
clc ; 

B=[1 1.5 -1.2]; 
w=randn(1,300) ;
x=filter(B, 1, w) ;
subplot (211) ,plot(w); grid
subplot (212) ,plot(x); grid