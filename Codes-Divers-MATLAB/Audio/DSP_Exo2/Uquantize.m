function [Xq,SNRqdB] = Uquantize(X,b)
%%%Mustapha badaoui

N = 2^b;
mx = max(max(X));
mn = min(min(X)); 
D = (mx - mn)/N;


Xq = (X - mn)/D;

Xq = round(Xq);
Xq = Xq * D + mn;
% SNRqdB=10*log10(sum(X*Xq)/sum((X-Xq).*(X-Xq)));
Ns=length(X); 
Ps=sum(X.^2)/Ns ;
esq = X-Xq ;
Esq= sum(esq.^2)/Ns ;
SNRq=Ps./Esq ;
SNRqdB=10*log10(SNRq);

