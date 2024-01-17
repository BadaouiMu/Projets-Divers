m=4;
t=5;
n=15;
k=n-2*t;

pp=25; % D^4 + D^3 + 1
%poly generateur du code RS

%--------------------------
a=gf(2, m, pp);
a0=gf(1, m, pp);
g=gf(1, m, pp);
for i=1:2*t,
    ai = a^i;
    g=conv(g,[a0 ai]);
end
%---------------------------
g ;

%-----------------------------------
dn1=gf([1,zeros(1,n-1),1],m,pp);
[h,r]=deconv(dn1,g);
%-------------------------------------
h;

%X=0x92B4F2C2A
X=[2 5 8 11 14 ];

%-------------------------
X=[X,zeros(1,n-k)];
X=gf(X,m,pp);
[h,r]=deconv(X,g);
%----------------------------
A=[X(1:k),r(k+1:end)] ; %mot de code canal @@@@ a ne pas convertir a alpha 

% 
% 
% 
%Décodage
%-------------------------
a=gf(2,m,pp);
H=a.^(n-1:-1:0)';
H=repmat(H,1,2*t);
T=1:2*t;
T=repmat(T,n,1);
H= H .^ T;
%---------------------------

%B=0x473DBE7ED49073A e hex
B=gf([4 7 3 13 11 14 7 14 13 4 9 0 7 3 10],m,pp);
S=B*H ;

%-------------------------
Sb=S(t+1:end)';
Sm=[];
for i=1:t,
    Sm=[Sm;S(i:i+t-1)];
end
%---------------------------

det(Sm);
% 
% det=0 donc 
Sm=Sm(2:end, 2:end);
Sb=Sb(2:end);
det(Sm);

% 

ss=Sm\Sb ;%si det=0 alors sigma0=0 %attention le premier est le plus faible
F=gf ([1 ss(end:-1:1)'],m,pp);
di=roots(F); %racines %position d err
% 
% 
% trouver les valeurs des erreurs -------
Sb=S(1:t-1)';
Sm=[];
for i=1:t-1,
    Sm=[Sm;(di.^i)'];
end
%----------------------------------------   
ss=Sm\Sb  %les valeurs des err @@@@ a ne pas convertir a alpha 

% correction d err
E= gf([ 0 0 9 0 11 0 3 0 0 13 0 0 0 0 0 ],m,pp);
Sol= gf(E+B,m,pp); %code decode
Sol1= Sol(1:k); %code info
SS=Sol*H ;%verification