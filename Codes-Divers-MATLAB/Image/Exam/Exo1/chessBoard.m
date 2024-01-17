function f = chessBoard(N, Nb)
%%% Mustapha BADAOUI %%%
% génération d'un échequier 
%% N: # pixels par ligne
%% Nb: # de répétition (puissance de 2)

M = Nb; 

Nr = Nb/2;

Nc = N/Nr;
Mc = M/Nr;

N2 = Nc/2;
M2 = Mc/2;

f0 = [ ones(N2),zeros(N2)];
f=[];
for n = 1:Nr
    f = [f,f0];
end

f0 = [f; f(:, end:-1:1)]; 
f=[];
for n = 1:Nr
    f = [f;f0];
end

