function [sq,SNRqdB]=nuquantize(s,ic)
%%% Mustapha badaoui

[repartition,codebook]=lloyds(s,ic);

%quantification
sq=zeros(size(s));

 for n=1:length(s),
    test=0;
    for j=1:length(repartition),
        if(s(n)<repartition(j) && test==0),
            sq(n)=codebook(j);
            test=1;
            
        end
%     if(test==0),
%         
%         sq(n)=codebook(length(repartition)+1);
%     end
    end
        
 end
Ns=length(s); 
Ps=sum(s.^2)/Ns ;
esq = s-sq ;
Esq= sum(esq.^2)/Ns ;
SNRq=Ps./Esq ;
SNRqdB=10*log10(SNRq);


