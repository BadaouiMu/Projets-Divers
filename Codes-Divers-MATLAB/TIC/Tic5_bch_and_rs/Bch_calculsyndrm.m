%B=D^10 + D^3

n=15;m=4;t=3;

a=gf(2,m) ;
H=a.^(n-1:-1:0)';
H=repmat(H,1,2*t);
T=1:2*t;
T=repmat(T,n,1);
H=H.^T;
B=gf([0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 ],m);
S=B*H ; %sol 1

%recherche de F(D) 
Sb=S(t+1:end)';
Sm=[] ;
for i=1:t,
    Sm=[Sm;S(i:i+t-1) ] ;
end
%ss=Sm\Sb    il ne marche pas car det(Sm)=0 (voir cahier
Sm=Sm(2:end,2:end) ;
Sb=Sb(2:end) ;

ss=Sm\Sb ;   %sol 2 donne F
F=gf([ 1 15 13 ],m);
roots(F) ; %%sol 1


