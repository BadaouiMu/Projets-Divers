function Xq = Uquant2D(x,N)
Xmx = max(max(x));
Xmn = min(min(x));

D = (Xmx - Xmn)/N; 
Xq = (x - Xmn)/D; 
Xq = round(Xq);
Xq = Xq * D + Xmn;



