%%%  Mustapha BADAOUI  %%%


%%% Insérez votre code ici %%%
clear all;
close all;

N = 4096;
D = 4;

f=chessBoard(N,D);
imshow(f)

[M MM]=size(f) ; 
DD=2;
f=chessBoard(N,DD);
precision=10^-3;
for i=1:D
    N=N/2;
    D=2*D;
    ff=chessBoard(N,D);
    f(M-N+1:M,M-N+1:M)=ff; 
end
figure
imshow(f)

%%% Mustapha BADAOUI %%%
