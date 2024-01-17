function D=bayerN(n)
D2=[0 2;3 1];
%n puiss de 2 
if n==2 
    D=D2;
else
    D=bayerN(n/2); 
    D=[ 4*D+D2(1,1)*ones(n/2), 4*D+D2(1,2)*ones(n/2) ;
        4*D+D2(2,1)*ones(n/2), 4*D+D2(2,2)*ones(n/2) ];
end