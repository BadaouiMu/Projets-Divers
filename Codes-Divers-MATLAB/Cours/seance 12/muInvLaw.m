function y=muInvLaw(x,mu) 
if x==0 
    y=x ; 
else
y= ((1+mu).^abs(x)-1)/mu .* sign(x) ; 
end