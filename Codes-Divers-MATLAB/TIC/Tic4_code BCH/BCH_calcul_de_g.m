%primpoly(4,'all') ;
m=4;
t=3;
pp=19 ;%poly primitif de gf(2^4)  %si on change ce poly tous (a1..,m1..,et g) change on peut essayer 25 trouver par primpoly

n=2^m - 1;
a1=gf(2,4,pp) ;
a3=a1^3 ; 
a5=a1^5 ;

m1=minpol(a1) ;
m3=minpol(a3) ;
m5=minpol(a5) ;

g=conv(m1,conv(m3,m5));
g=g(3:end); %pour que g commence par un element non nul 
%ona k<n-k donc on va utiliser circuit de multiplication 

dn1=gf([1,zeros(1,n-1),1]); %D^(n+1)+1
%calcul de h
[h r]=deconv(dn1,g);
% on trouve r=0 car g divise dn1
h ;


%codage 
X=gf([1 0 1 1 0 ]);
Xd=[X zeros(1,10) ];
[q r]=deconv(Xd,g);

% r=r(6:end);
B=Xd+r; %on trouve beta















%2eme ex

%primpoly(5,'all') ;%on trouve 37
m=5;
t=7;
pp=37 ;

a1=gf(2,5,pp) ;
a3=a1^3 ; 
a5=a1^5 ;
a7=a1^7 ;
a9=a1^9 ;
a11=a1^11 ;
a13=a1^13 ;

m1=minpol(a1) ;
m3=minpol(a3) ;
m5=minpol(a5) ;
m7=minpol(a7) ;
m9=minpol(a9) ;
m11=minpol(a11) ;
m13=minpol(a13) ;

g=conv(m1,m3);
g=conv(g,m5);
g=conv(g,m7);
g=conv(g,m11) ;




