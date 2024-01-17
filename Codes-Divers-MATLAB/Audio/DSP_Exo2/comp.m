function y = comp(x, law) 
%%% Mustapha badaoui

if law==0, 
    mu=255 ;
   y = log(1+mu*abs(x))/log(1+mu) .*sign(x); 
else
    y=zeros(1,length(x));
    A=87.56 ;
    for i =1:length(x)
        
        if abs(x)<=1/A 
            y(i)=((A*abs(x(i)))/(1+log(A)))*sign(x(i));
        else
            y(i)=(log((A*abs(x(i)))+1)/(1+log(A)))*sign(x(i));
        end
    end
end









