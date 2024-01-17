clear all  ; 
close all ; 
clc ; 

Fs=8000  ; 
F=250  ;
Ts=1/Fs ; 
T=1/F ;
%generation d'une periode de sinusoide 
t=0:Ts:T-Ts; 

s=sin(2*pi*F*t) ; 
subplot(211) , plot(t,s) 
hold on 
subplot(212) , plot(t,s) 

hold on 

mu=[25,50,150,255]; 
for m=1:length(mu) 
    sc=muLaw(s,mu(m)); 
    subplot(211), plot(t,sc) 
    sr=muInvLaw(sc,mu(m)); 
    subplot(212), plot(t,sr) 

end 
subplot(211) ,legend ('orignal','mu=25', 'mu=50'  ,'mu=150', 'mu=255' ) 
subplot(212),legend ('orignal','mu=25', 'mu=50'  ,'mu=150', 'mu=255' )
hold off 
hold off 
figure 

s=audioread('speech.au'); 
K=audioinfo('speech.au') ; 
D=K.Duration ;
Ns=K.TotalSamples ; %ajauter pour la dernier app 
% % % % % commenter pour faire une autre app 
%%%%% 55555555555555555555555R
% subplot(311) ,plot (s)
% soundsc(s) 
% pause(D+1) 
% 
% mu=255; 
% sc=muLaw(s,mu);
% subplot(312) ,plot (sc)
% 
% soundsc(sc)
% pause(D+1) 
% 
% %ajauter pour verifier 
% N=4; 
% scq=Uquant(sc,N); 
% 
% sr=muInvLaw(scq,mu) ;
% subplot(313) ,plot (sr)
% 
% soundsc(sr)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%une autre app 
close all
hist (s,40)
%trouver l estimation de niveau de quantificaton apartir de l'histogram :
%[-0.18, -0.04,0.04,0.18] %n'est pas necessaire qu il soit symetrique 
icb=[-0.18, -0.04,0.04,0.18] ;
ip = zeros(1,length(icb)-1) ; 

for n=1:length(icb)-1 , 
    ip(n) = (icb(n)+icb(n+1) )/2 ; 
end 

hold on 
plot(icb,zeros(1,length(icb)),'ro'); 
plot(ip,zeros(1,length(ip)),'gx'); 

[p,cb]=lloyds(s,icb); 
plot(cb,zeros(1,length(cb)),'co'); 
plot(p,zeros(1,length(p)),'yx'); 

sq=zeros(size(s)); 
for n=1:Ns ,  %%%on doit faire une function qui fait ca independement de nb de niv de quantification 
    if s(n) <p(1) , 
        sq(n) =cb(1); 
    elseif s(n) < p(2), 
        sq(n) =cb(2);
    elseif s(n) < p(3), 
        sq(n) =cb(3); 
    else 
        sq(n) =cb(4); 
    end 
end
Ns=length(s); 
Ps=sum(s.^2)/Ns ;
esq = s-sq ;
Esq= sum(esq.^2)/Ns ;
SNRq=Ps./Esq ;
SNRqdB=10*log10(SNRq)
subplot(311) ,plot (s)
% soundsc(s) 
% pause(D+1) 
mu=255; 
sc=muLaw(s,mu);
N=4; 
scq=Uquant(sc,N); 
sr=muInvLaw(scq,mu) ;
% soundsc(r) 
% pause(D+1) 
subplot(312) ,plot (sr)
% soundsc(sq) 
% pause(D+1) 
subplot (313) , plot (sq) 
