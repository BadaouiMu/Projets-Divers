function A = Specgm(s,L,ov,N) 
%% syntax: 
%% 
%% Matrice image des puissances spectrales du signal parole 
%  A = Specgm(s,L,ov,N)
%% s: vecteur signal parole temporel 
%% L :  taille de la fenetre 
%% ov : nombre d echt en chevauchement 
%% N ; resolution frequentielle 
%% Sm : Matrice image des puissances spectrales

m=1; %commencer du debut

Fs=8000; 

Ns=length(s) ;

A=[] ;

while (m+L-1 <= Ns)
    S= DFTwin(s,L,m,N) ; 
%     mS=abs(S.^2); 
    mS=abs(S); %faite a la fin pour avoir la diff 

%     mS = 10*log10(mS); faite a la fin pour avoir la diff
%     A = [A mS((N/2):end)] ;
    A = [A mS(1:(N/2))] ;  %faite a la fin pour avoir la diff 
    m=m+L - ov ; 
end
colormap(1-gray(256))  %256 niveau de gris de noir vers le blanc  1-gray(256)de blanc vers noir
% colormap('spring')
% colormap('summer')
% colormap('winter') 

imagesc([0:Ns]/Fs,[0:Fs/2],A) 
axis xy % pour afficher les freq du bas vers le haut 



