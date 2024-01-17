%---------------A modifier----------------%
%primpoly(m,'all') 
pp=25 ; %utilise %primpoly(4,'all') pour avoir le nb 
m=4;
t=5; %capacite de correction
p=10^(-3) ;    %proba d err de canal donné
X=[ 3 6 9 12 15 ] ; %seq a code %
B= gf([4 7 3 13 11 14 7 14 13 4 9 0 7 3 10],m,pp) ;%seq a decode
%-----------------------------------------%


RS_Mus(pp,m,t,p,X,B)  

%if you got an error than you recheck 't'

