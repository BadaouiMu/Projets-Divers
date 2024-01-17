clear all; 
close all; 
clc ;
N=1000 ; %nb bits
 
p=0.2 ; %proba de succes (1)
figure
x = rand (1,N) >= 1-p ; stem (x) %ou <p

Nb1=sum(x);
p_exp =Nb1/N
