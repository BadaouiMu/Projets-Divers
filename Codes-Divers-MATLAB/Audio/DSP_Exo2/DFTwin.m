function S = DFTwin(s,L,m,N,win)
%%%Mustapha badaoui


%% S: vecteur parole
%% L : taille de la fenetre 
%% m : indice du segment a traiter
%% N: la resolution frequentielle
%% win : la fenetre a utiliser -> 0 : rect, 1 : hamming

% choix de la fenetre
if win==0
    w=rectwin(L);
else
    w= hamming(L);
end

% construction du segment - prendre en charge les cas particulier
Ns = length(s);
if(m+L<Ns)
    ss = s(m:m+L-1);
else
    Nz = L- (Ns-m+1) ; % nbr de zero à ajouter
    ss= [s(m:end);zeros(Nz,1)];
end
% size(ss) 
S = fft(ss.*w,N);