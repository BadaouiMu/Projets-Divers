function y = pre(x) 
%%% Mustapha badaoui

a=.97;
x1=[0 ;x(1:end-1)] ;
y=x-a*x1 ;