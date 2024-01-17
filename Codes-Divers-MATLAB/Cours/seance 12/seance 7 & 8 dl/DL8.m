%% DL8:
clear all;
close all;
clc;

%% lecture 
[s,Fs] = audioread('speech_sample.wav');
soundsc(s,Fs) 


%% Les caractéristiques du signal: 
caracteristiques = audioinfo('speech_sample.wav') 

%% Centrer et normaliser le signal parole:
%centrer le signal
Ns = length(s);
m = sum(s)/Ns; 
s = s-m; 

%normaliser le signale
s=s/max(s) ; 

%% un segment voisé et un segment non-voisé
%on visualise le signal 
n = 0:Ns-1; % vecteur indice echantillons
t = n/Fs; % vecteur instants echantillons
figure
subplot(211), plot(n, s),xlabel('s(n)') 
subplot(212), plot(t, s),xlabel('s(t)')

%on prend : 
Ne = 300;
Nv = 6000; 
Nuv = 9000; 

sv = s(Nv:Nv+Ne-1);
suv = s(Nuv:Nuv+Ne-1);

% Tracage du segment voisé et du segment non-voisé
figure 
subplot(211), plot(Nv:Nv+Ne-1, sv),title('segment voise')
hold on, plot([Nv,Nv+Ne] , [0,0])
subplot(212), plot(Nuv:Nuv+Ne-1, suv),title('segment non voise')
hold on, plot([Nuv,Nuv+Ne],[0,0])

%%  calcul de la période de pitch
%methode 1
sv = s(Nv:Nv+Ne-1);
amdf= zeros(1,floor(Ne/2)) ; 
for i=1:floor(Ne/2) 
    sd = s(Nv+i:Nv+i+Ne-1);
    amdf(i) = sum(abs(sv-sd))/Ne ; 
end
pitch_methode1 = find(amdf==min(amdf))/Fs*1000  
p=pitch_methode1; %(6160-6102)/Fs*1000

%methode 2
rx= zeros(1,floor(Ne/2)) ; 
for i=1:floor(Ne/2) 
    sd = s(Nv+i:Nv+i+Ne-1);
    rx(i) = sum(sv.*sd) ; 
end
pitch_methode2 = find(rx==max(rx))/Fs*1000

%methode 3
dx= zeros(1,floor(Ne/2)) ; 
for i=1:floor(Ne/2) 
    sd = s(Nv+i:Nv+i+Ne-1);
    dx(i) = sum((sv-sd).^2) ; 
end
pitch_methode3 = find(dx==min(dx))/Fs*1000  

%% calcul de ZCR
sv1= [0; sv(1:end-1)];
suv1= [0; suv(1:end-1)];
%1 ere formule 
ZCRv_methode1 = sum((sv.*sv1)<0)
ZCRuv_methode1 = sum((suv.*suv1)<0) 
% 2 eme formle 
ZCRv_methode2 = sum(abs(sign(sv) - sign(sv1)))/2  
ZCRuv_methode2 = sum(abs(sign(suv) -sign(suv1)))/2 

%% Puiss et taux de passage par zero
Ne =3*p*Fs*(10^(-3)) ;
ov = Ne*(2/3) ; 
Nov = (Ne-ov) ;
% s assurer que Ne multiple de Ns 
if (rem(Ns,Nov) ~= 0 ) 
    r =rem(Ns,Nov) ; Nz =Nov-r; 
    s=[s; zeros(Nz,1)] ; 
end
Ns = length(s) ; 
NT = Ns /Nov ; 

P=zeros (NT,1) ;
ZCR=zeros (NT,1) ;

figure
for t=1:NT-2 
    ss=s((t-1)*Nov+1:Ne+(t-1)*Nov);   
    ss1=[0; ss(1:end-1)]; 
    Ps=sum(ss.^2)/Ne ;P(t)=Ps ; 
    ZCRs = sum((ss.*ss1)<0); ZCR(t) = ZCRs ; 
    plot ((t-1)*Nov+1:Ne+(t-1)*Nov,ss),title(['trame N : ',num2str(t) ,' avec Ps= ',num2str(Ps),' ZCRs = ' , num2str(ZCRs) ])
    axis ([1,Ns,-1,1]) ; 
    hold on, plot ([(t-1)*Nov + 1, Ne+(t-1)*Nov] , [0,0] ) 
    hold off, 
    pause (.05); 
end
plot (P/max(P))
hold on 
plot (ZCR/max(ZCR))
legend ('P', 'ZCR' );