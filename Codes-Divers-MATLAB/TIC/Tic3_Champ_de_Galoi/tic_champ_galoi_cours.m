primpoly(4) ; %sol %poly par default
primpoly(4,'all') ; %sol %tous les poly

x = [2 0 14 7 ] ; %type: double
a = gf(x,4) ; % sur workspace il ya une difference entre type de a et x// si une des valeur de x est  > a 15 il donne un err donc les element doivent etre entre 0 et 15 (2^m-1)
%a = gf(x,4,25) por changer % pour a le poly primitif est 19 par defaut 

%table addition
m=4;
e=repmat([0:2^m-1],2^m,1); %repmat(s,r,c) repeter s pour r ligne et c colones
f=gf(e,m);
addtb= f + f' ; %sol

%table multiplication
m=4 ;
els = gf([0:2^m-1]',m) ;
multb = els * els' ;%sol

%polymin
m=4 ;
e=gf(6,4) ;%on a choisi l'element 6 c est alpha^5 // attention 6 c'est pas alpha^6
mp=minpol(e) ; %sol %donne binaire il faut la convertir a un polynome dans ce cas (00111)=> D^2+D+1

%Multiplication et div polynomiale 
A = gf([ 1 1 0 0 1]) ;%A=D^4 + D^3 + 1
B = gf([ 1 0 0 0 0 ]); % B=D^4
[Q R] = deconv(A,B); %faire div il donne A=Q*B+R
B=conv(Q,A) + R ; %sol %pour verifier %conv multip
%autre ex :
X=[0 1 0  1] ;
X=[X zeros(1,3) ] ;
X=gf(X) ;
g=gf([1 0 1 1]);
[q r ] = deconv(X,g) ;
a = X +r ;%sol
b=a+gf([1 0 0 0 0 0 0 ]) ;%faire une err dans la premier pos
[q r] = deconv(b,g) ;
s=r(4+1:end) ; %sol %calcul de syndrome %4 est k %pour prendre les drniers bits

%produit de plusieur vect
a1=gf(2,4);  %alpha 1
a3=gf(a1^3,4);%alpha 3
a5=gf(a1^5,4);%alpha 5
        %calcul de pol min 
m1=gf(minpol(a1),4) ; %minplo donne des valeur dans gf(2) il faut la convertir
m3=gf(minpol(a3),4) ;
m5=gf(minpol(a5),4) ;
        %calcul de g
g=conv(m1,conv(m3,m5)); %res sur 13 bit => on doit la convertir en polynome on peut calculer le poids (nb de 1) on trouve 7 donc dmin=3
        %verifier que g est un poly generateur (faux pour moment)
% a=gf([1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1],4) ;
% [q r] = deconv(a,g) ;
% r

%remplacer des res 
m = 4;
apoly = gf([4 5 3],m) ;% A^2 x^2 + (A^2 + 1) x + (A + 1)
x0 = gf([0 1 2],m); % Points auxquels le polynôme sera évalué
y = polyval(apoly,x0) ;

%calculer des racine
m = 4;
apoly = gf([4 5 3],m); % A^2 x^2 + (A^2 + 1) x + (A + 1)
z = roots(apoly) ;% vecteur des racines du polynôme









