function Y=medianFilterL(X,L)
%%% Mustapha BADAOUI %%%

[M,N]=size(X);
L2=(L-1)/2;
Y=X; 
for r = L2+1:M-L2
    for c=L2+1:N-L2
        i=1
        v=X(r-L2:r+L2,c-L2:c+L2); 
        Y(r,c)=median(v(:));
    end
end
        