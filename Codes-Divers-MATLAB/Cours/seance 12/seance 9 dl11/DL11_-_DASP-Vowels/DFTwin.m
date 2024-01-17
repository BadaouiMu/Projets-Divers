function Sm = DFTwin(s,L,m,N) 

% s=s(:); 
% sm=s(m:m+L-1);
% sm= sm .* hamming(L); 
% 
% Sm=fft(sm,N); 
% 
m=floor(m) ; 
L=floor(L) ; 
Ns = length(s);
if(m+L<Ns)
    ss = s(m:m+L-1);
else
    Nz = L- (Ns-m+1) ; % nbr de zero à ajouter
    ss= [s(m:end);zeros(Nz,1)];
end
size(ss);
Sm = fft(ss.*hamming(L),N);
