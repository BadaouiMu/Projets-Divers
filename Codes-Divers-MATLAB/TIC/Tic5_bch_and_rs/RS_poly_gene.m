 m=4;t=3;n=15;
 pp=19;
 
 a=gf(2,m,pp) ;% alpha
 g=gf(1,m,pp); % car on sait q
 for i=1:2*t
     ai=a^i ;
     g=conv(g,[1 ai]) ;
 end
 g
 