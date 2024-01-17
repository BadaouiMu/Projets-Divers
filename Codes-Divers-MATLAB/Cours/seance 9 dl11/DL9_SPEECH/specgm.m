function A=specgm(s, L, ov, N, win)
%% s : input signal,
%% L : window length,
%% overlap : number of points common to successive windows,
%% N : number of points you compute in each DFT
m=1;
Ns=length(s);
A=[];
while (m+L < Ns)
    Ss=DFTwin(s,L,m,N,win);
    SsdB=20*log10(abs(Ss));
    A=[A,SsdB(1:N/2)];
    m=m+L-ov;
end
% ov = chevauchement
% imagesc(A);
axis xy % afficher les freq du bas vers le haut 
colormap(1-gray)
colormap(jet)
