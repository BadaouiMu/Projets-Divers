function y = decomp(x, law) %x ==> signal analogique compressé à l'entrée
%%%Mustapha badaoui

if law ==0,
    y = ((1+mu).^abs(x)-1)/mu .*sign(x);
else
    y=zeros(1,length(x));
    A=87,56;
    for i =1:length(x)
        
        if abs(x)<=1/(1+log(A)) 
            y(i)=((log((A))+1)*abs(x(i))/(A))*sign(x(i));
        else
            y(i)=(exp(abs(x)*A^(abs(x)))/(A*exp(1)))*sign(x(i));
        end
    end
end









