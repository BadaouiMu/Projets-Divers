function Xq = Uquant3D(x,N)
%%% Mustapha BADAOUI %%%

Xmx = max(max(max(x)));
Xmn = min(min(min(x)));

D = (Xmx - Xmn)/N; 
Xq = (x - Xmn)/D; 
Xq = round(Xq);
Xq = Xq * D + Xmn;



