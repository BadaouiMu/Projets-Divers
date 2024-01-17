%primpoly(4,'all') 
pp=25 ;
m=4;t=5;
n=2^m -1;k=n-2*t;

%poly gen
 a=gf(2,m,pp) ;% alpha
 g=gf(1,m,pp); % car on sait q
 for i=1:2*t
     ai=a^i ;
     g=conv(g,[1 ai]) ;
 end
 g ; %Sol 1
 
 % poli control (D^n+1)=h*g
 dn1= gf([ 1 zeros(1,n-1) 1 ],m,pp);
 [h r] = deconv (dn1,g) ;
 h ; %sol 
 
 %calcule proba 
 pe=0;
 p=10^(-3) ;
 for i=0:t
     pe = pe +  (nchoosek(n,i)) * (p^i) * ((1-p)^(n-i)) ;
 end
 Pe=1-pe ;
 
 %calcul efficatie
 Rc=k/n ;
 
 %gain de codage
 Ga = 10 *log10(Rc*(t+1))  ;
 
 
 %codege 
 X= [ 2 5 8 11 14] ;
 X=[X zeros(1,n-k)] ;
 X=gf(X,m,pp) ;
 [ h r ] = deconv (X,g) ;
 A= X+r; %ou A=[X(1:k) r(k+1:end) ]
 
 %decodage
B= gf([4 7 3 13 11 14 7 14 13 4 9 0 7 3 10 ],m,pp) ;
  
a=gf(2,m,pp) ;
H=a.^(n-1:-1:0)';
H=repmat(H,1,2*t);
T=1:2*t;
T=repmat(T,n,1);
H=H.^T;
S=B*H;  %sol 1

%recherche de F(D) 
Sb=S(t+1:end)';
Sm=[] ;
for i=1:t,
    Sm=[Sm;S(i:i+t-1) ] ;
end

Sm=Sm(2:end,2:end) ;
Sb=Sb(2:end) ;

det(Sm); %sol
ss=Sm\Sb ; %sol de sigma


F=gf ([1 ss(end:-1:1)'],m,pp);
di = roots(F);  %posiiiont d err



% 
% 
%recherche de valeur d err
Sb=S(1:t-1)' ;
Sm=[] ;
for i=1:t-1,
    Sm=[Sm;(di.^i)' ] ;
end
det(Sm); %sol

ss=Sm\Sb ;  %sol 2 valeur d'err

%correction d err
E= gf([ 0 0 9 0 11 0 3 0 0 13 0 0 0 0 0 ],m,pp);
Sol= gf(E+B,m,pp); %sol
%Sol= Sol(1:k); %sol final
SS=Sol*H ;%verification 

