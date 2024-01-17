
function fb = bayer(f)


T = 255 * ([7, 9, 5,;2, 1, 4; 6, 3, 8] - .5)/(3*3);

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
