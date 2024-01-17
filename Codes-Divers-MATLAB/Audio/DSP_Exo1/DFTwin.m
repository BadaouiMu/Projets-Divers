function Sm = DFTwin(s,L,m,N) 
%%%Mustapha badaoui

%% syntax: 
%% Sm=DFTwin(s,L,m,N )
%% Transformee de Fourier discrete dans le temps a court=ter, eutilisant le fenetrage de haming 


%% s: vecteur signal parole temporel 
%% L :  taille de la fenetre 
%% m : indice du premier echant de la fenetre 
%% N ; resolution frequentielle 
%% Sm : vecteur des composantes freq
s=s(:); %transforme le vecteur s en vecteur colonne 
sm=s(m:m+L-1); %isolation du segment 
sm= sm .* hamming(L); % fenetrage 

Sm=fft(sm,N); 



