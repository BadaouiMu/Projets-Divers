function A = Specgm(s,L,ov,N) 

m=1;
Fs=46000;
Ns=length(s) ;

A=[] ;

while (m +L -1 <= Ns)
    S= DFTwin(s,L,m,N) ; 
    S=abs(S);
    SdB=20*log10(abs(S));
    A = [A SdB(1:(N/2))] ;
    m= m+L - ov ; 
end
imagesc([0:Ns-1]/Fs,[0:Fs/2],A) 
axis xy 
colormap(1-gray(256)) 


