
X=[1 0 0 1 1] ;
% X=X';
Y=zeros (1,15) ;
G=zeros(11,15);
for i=1:11
    Y(i)=1 ;
    
    [q r]=deconv(Y,X) ;
%     r=r' ;
%     r=abs(r) ;
%     r=r'; %si impaire le remplacer par 1 sinon 0
    for j=11:15
        if mod(abs(r(j)),2)==0 
            r(j)=0;
        else r(j)=1;
        end
    end
    G(i,: )=Y+r;
    i
    Y
    r 
    Y(i)=0 ;
end
G
    