clear all ;
close all ; 
clc; 
[s,Fs]=audioread('go.au');
[s,Fs]=audioread('start.au'); 

Ns=length(s); 
n=0:Ns-1 ; 
t= n/Fs ; 
subplot(211), plot(n,s)
subplot(212), plot(t,s)
% period de pitch (0.5271-0.5181)*1000=9ms ou (4991-4921)*.125=8.

L=330; 
m=2720 ; 

Nf =  512; %resolution freq 
fn=(0:Nf/2-1)/Nf*2*pi; 
f=fn/pi*Fs/2 ; 

S= DFTwin(s,L,m,Nf) ; 
mS=abs(S); 
SdB=20*log10(mS); 


figure 
subplot(221), plot(fn,mS(1:Nf/2))
subplot(222), plot(fn,SdB(1:Nf/2))
subplot(223), plot(f,mS(1:Nf/2))
subplot(224), plot(f,SdB(1:Nf/2))


figure
if (rem(Ns,L) ~= 0 ) 
    r =rem(Ns,L) ; Nz =L-r; 
    s=[s; zeros(Nz,1)] ; 
end
Ns=length(s); 
m=1; %commencer du debut

ov= L/2 ; %pour avoir un chevechement 
%ov =0 pas de che 

while (m+L-1 <= Ns)
    S= DFTwin(s,L,m,Nf) ; 
    mS=abs(S); 
    plot(f,mS(1:Nf/2)), pause(.01)
    axis([0,4000,0,30])
    m=m+L - ov ; 
end

figure

A=Specgm(s,L,ov,Nf) ;


%fichier .mat c est un fichier ou il est stocker des var matlab

