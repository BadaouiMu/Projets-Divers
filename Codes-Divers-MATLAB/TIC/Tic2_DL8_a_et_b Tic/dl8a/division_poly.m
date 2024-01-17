X=[1 1 0 0 1] ;
% X=X';
Y=zeros (1,16) ; Y(1)=1 ;Y(16)=1;
% Y=[];
[q, r]=deconv(Y,X) ;
for j=1:length(r)
    if mod(abs(r(j)),2)==0 
            r(j)=0;
        else r(j)=1;
    end
end
for j=1:length(q)
    if mod(abs(q(j)),2)==0 
            q(j)=0;
        else q(j)=1;
    end
end
r
q