function Xq=Uquant(x,N) 

xmx=max(x); 
xmn=min(x); 
D=(xmx-xmn)/N ; 
Xq= (x-xmn)/D ; 
Xq=floor(Xq); 
Xq=Xq*D+xmn ; 
