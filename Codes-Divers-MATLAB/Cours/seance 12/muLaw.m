function y=muLaw(x,mu) 
if mu==0 
    y=x ; 
else
y= (1+log(1+mu*abs(x) ) )/log(1+mu) .*sign(x) ; 
end