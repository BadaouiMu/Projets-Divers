
function [fb,T1] = bayerDL(f,Nt)

if Nt == 2,
% Modele de Bayer 2x2
   T = 255 * ([3, 2; 1, 4] - .5)/(Nt*Nt);
elseif Nt ==3,
    % Modele de Bayer 3x3
    T = 255 * ([7, 9, 5,;2, 1, 4; 6, 3, 8] - .5)/(Nt*Nt);
else 
    D=bayerN(Nt);
    T = 255 * ((D+1)- .5)/(Nt*Nt);
    
end
T1 = T;

[M,N] = size(f);
[Mt,Nt] = size(T);

while (Mt<M | Nt<N)
    T = [T, T; T, T];
    [Mt,Nt] = size(T);
end
T= T(1:M,1:N);
fb = 255*(f>=T);
fb = uint8(fb);
end
