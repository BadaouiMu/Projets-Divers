n = 7 ;
k = 4 ;
m = n-k ;

%pour c(n,k)


primpoly(3,'all') ; %donne les primitive plynomiale degre 3
p = gf([1 0 1 1 ]) ;

%seq 0x45C
x1 = gf([0 1 0 0 ]);
a1 = [ x1 zeros(1,m) ]; %decalage de x de 'm' pos 
a1=gf(a1) ;

[q r] = deconv (a1, p) ; %division de a1 par p
a1 = [ a1(1:k) r(k+1:end)] ;

x2 = gf([0 1 0 1 ]);
a2 = [ x2 zeros(1,m) ]; %decalage de x de 'm' pos 
a2=gf(a2) ;

[q r] = deconv (a2, p) ; %division de a1 par p
a2 = [ a2(1:k) r(k+1:end)] ;

x3 = gf([1 1 0 0 ]);
a3 = [ x3 zeros(1,m) ]; %decalage de x de 'm' pos 
a3=gf(a3) ;

[q r] = deconv (a3, p) ; %division de a1 par p
a3 = [ a3(1:k) r(k+1:end)]  ;

%pour c(n,k-1)

d1= [1 1] ;
g=conv( p, d1) ;%multiplier p et d1

%seq 0x45C
y1=gf([0 1 0 ]) ;
b1=[ y1 zeros(1,m+1)] ;
b1=gf(b1) ;
[q r] = deconv (b1, g) ;
b1= [ b1(1:k-1) r(k:end)]  ;

y1=gf([0 0 1 ]) ;
b1=[y1 zeros(1,m+1)] ;
b1=gf(b1) ;
[q r] = deconv (b1, g) ;
b1= [ b1(1:k-1) r(k:end)] ; 

y1=gf([0 1 1 ]) ;
b1=[y1 zeros(1,m+1)] ;
b1=gf(b1) ;
[q r] = deconv (b1, g) ;
b1= [ b1(1:k-1) r(k:end)]  ;

y1=gf([1 0 0 ]) ;
b1=[y1 zeros(1,m+1)] ;
b1=gf(b1) ;
[q r] = deconv (b1, g) ;
b1= [ b1(1:k-1) r(k:end)]  ;


%Partie decodage circuit meggit attaque par droite
% seq 0x11C67E (21bits)
% B1=[1000111] => B1,3=[0111100] 3 decalge a gauche
% B2=[0001100] => B2,3=[1100000] 3 decalge a gauche
% B3=[1111110] => B3,3=[1110111] 3 decalge a gauche
% pour B1 

B1= gf([1 0 0 0 1 1 1]);
B13 = [B1(m+1:end) B1(1:m) ]

[q r] = deconv (B13,p) ;
S13= r(k+1:end) ;%valeur de syndrome %ontrouve une valeur !=0 et diff de 100 donc on continu
% donc a6 vrai
r = [ r(2:end) gf(0) ] ;
[q r] = deconv (r,p) ;
S13= r(k+1:end) ; % aussi diff donc on refait=> a5 vrai

r = [ r(2:end) gf(0) ] ;
[q r] = deconv (r,p) ;
S13= r(k+1:end) ;% aussi diff donc on refait=> a4 vrai

r = [ r(2:end) gf(0) ] ;
[q r] = deconv (r,p) ;
S13= r(k+1:end)  ; % aussi diff donc on refait=> a3 vrai

r = [ r(2:end) gf(0) ] ;
[q r] = deconv (r,p) ;
S13= r(k+1:end)  % aussi diff donc on refait=> a2 vrai

r = [ r(2:end) gf(0) ] ;
[q r] = deconv (r,p) ;
S13= r(k+1:end)  % on s13=100 donc a1 est faux a2=a2+1

r = [ r(2:end) gf(1) ] ;
[q r] = deconv (r,p) ;
S13= r(k+1:end)   %a1 brai ms gf(1) car precedent

r = [ r(2:end-1) gf([1 0] ) ] ;
[q r] = deconv (r,p) ;
S13= r(k+1:end) % a0 vrai











