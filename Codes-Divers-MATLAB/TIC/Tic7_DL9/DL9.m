%primpoly(4,'all') 
m=4;
t=3;
pp=25 ;%poly primitif de gf(2^4)  %si on change ce poly tous (a1..,m1..,et g) change on peut essayer 25 trouver par primpoly

n=2^m - 1;
a1=gf(2,4,pp) ;
a3=a1^3 ; 
a5=a1^5 ;

m1=minpol(a1) ;
m3=minpol(a3) ;
m5=minpol(a5) ;

g=conv(m1,conv(m3,m5)) ;
g=g(3:end) ;%dmin = 11; deg[g]=10=n-k donc k=5
k=5;

dn1=gf([1,zeros(1,n-1),1]); %D^(n+1)+1
%calcul de h
[h r]=deconv(dn1,g);
% on trouve r=0 car g divise dn1
r ; % r=0
h  ;

 %calcule proba 
 pe=0;
 p=10^(-3) ;
 for i=0:t
     pe = pe +  (nchoosek(n,i)) * (p^i) * ((1-p)^(n-i)) ;
 end
 Pe=1-pe;
 
 %calcul efficatie
 Rc=k/n ;
 
 %gain de codage
 Ga = 10 *log10(Rc*(t+1)) 

%codage 

X=gf([1 0 0 0 1 ]); %B=[1 0 0 0 1 0 0 1 1 0 1 0 1 1 1 ]
X=gf([1 0 1 0 1 ]); %B=[1 0 1 0 1 1 1 1 0 0 0 1 0 0 1 ]
Xd=gf([X zeros(1,n-k) ],m,pp); 
[q r]=deconv(Xd,g);

% r=r(6:end);
B=Xd+r; %on trouve beta



%decodage

a=gf(2,m,pp) ;
H=a.^(n-1:-1:0)';
H=repmat(H,1,2*t);
T=1:2*t;
T=repmat(T,n,1);
H=H.^T;

B=gf([1 0 0 1 0 1 1 0 0 1 0 0 1 1 0],m,pp);%0x4B26 (15b)%s1=[7 12 11 6 0 10]
% B=gf([1 0 1 1 1 1 0 0 0 1 0 0 1 1 0],m,pp);%(3 10 14)=(a12 10 8) 
% B=gf([0 1 1 0 1 1 0 1 1 1 1 0 0 0 1],m,pp);%s2=[1 1 12 1 10 6]
% B=gf([0 0 1 1 0 1 0 1 1 1 1 0 0 0 1],m,pp);0x36F1 (15b)%(6 10 13)=(a13 10 11)

S=B*H  ;%sol 1 // pour verifier le decodage on commente ss et F

%recherche de F(D) 
Sb=S(t+1:end)';
Sm=[] ;
for i=1:t,
    Sm=[Sm;S(i:i+t-1) ] ;
end
det(Sm) ;

% Sm=Sm(2:end,2:end) ;
% Sb=Sb(2:end) ;

ss=Sm\Sb ;
F=gf ([1 ss(end:-1:1)'],m,pp);
di = roots(F)  %posiiiont d err






