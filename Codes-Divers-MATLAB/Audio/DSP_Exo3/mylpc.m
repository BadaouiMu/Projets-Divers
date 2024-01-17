
function coef = mylpc(x, P)
%%%Mustapha badaoui

%% x: vecteur des echantillons parole
%% P: ordre de prediction(# coef a calculer)

x=x(:); %vecteur colonne
N=length(x); %taille des echantillons

rs=zeros(P,1);% vecteur colonne de P composantes
Rs = zeros(P); % matrice carree de taille P
r=zeros(P+1,1);% vecteur colonne de P+1 composantes

xp = x;

r(1) = sum(x.*x)/N;

for n =2:P+1,
    xp=[0;xp(1:end-1)];
    r(n)=sum(x.*xp)/N;
end

%% construction de Rs et rs
rs=r(2:end); %vecteur des coef de corrélation r(1) à r(p) 

Rs=toeplitz(r(1:end-1));%  toeplitz==> matrice carré symmetrique des coeff de corrélation r(0) à r(p-1) ,

%% résolution du stm d'equ
coef =Rs\rs; % résolution du stm d'équation , \ => la division des matrices 