clear all ; 
close all ; 
clc ; 

load signal.mat 

L = 40 ; 
ov = 20 ; 
Nf = 512 ;
subplot(121) 
Specgm(signal,L,ov,Nf)  ;

L=320 ; 
ov= 60 ; 
subplot(122) 
Specgm(signal,L,ov,Nf) ; 
