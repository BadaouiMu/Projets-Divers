%%%Mustapha badaoui


clear all ; 
close all; 
clc;

%lecture du fichier "start.au"
[s,Fs] = audioread('speech.wav') ; 



Ns=length(s); %= K.TotalSamples
Ds=Ns/Fs ;% = K.Duration

% soundsc(s,Fs) 
n=0:Ns-1 ; %vecteur indice echant
t = n/Fs ; 

%pour s assurer que le signal est centre
moy= sum(s) / Ns ; 
ss=s ;
s= s - moy ; 


%normaliser le signale
s=s/max(s) ; 


% s assurer que Ne multiple de Ns 

Ne =30*10^((-3)) * Fs ; 
if (rem(Ns,Ne) ~= 0 ) 
    r =rem(Ns,Ne) ; Nz =Ne-r; 
    s=[s; zeros(Nz,1)] ; 
end
Ns = length(s) ; 

NT = Ns /Ne ; %# de trame

P=zeros (NT,1) ;
ZCR=zeros (NT,1) ;

% 
% for t=1:NT 
%     ss=s((t-1)*Ne+1:t*Ne); 
%     ss1=[0; ss(1:end-1)]; 
%     Ps=sum(ss.^2)/Ne ;P(t)=Ps ; 
%     ZCRs = sum((ss.*ss1)<0); ZCR(t) = ZCRs ; 
%     plot ((t-1)*Ne+1:t*Ne ,ss),title(['trame N : ',num2str(t) ,' avec Ps= ',num2str(Ps),' ZCRs = ' , num2str(ZCRs) ])
%     axis ([1,Ns,-1,1]) ; 
%     hold on, plot ([(t-1)*Ne+1,t*Ne] , [0,0] ) 
%     hold off, 
%     pause (.01); 
% end

figure 
plot (P/max(P))
hold on 
plot (ZCR/max(ZCR))


figure
y=pre(s) ;


% L=NT;
% 
% P=[10,12,15]; % nbre de coef LPC
% for i=1:3
% A = zeros (P(i),L);
% 
% for c = 1:L,
%    A(:,c)= mylpc(s(:,c),P(i)) ;
% end
% end
% A
t = (0:Ns-1)/Fs;

subplot(211), plot(t,s);

s1 = [0;s(1:end-1)];
a = .97;

sd = s - a * s1;

subplot(212), plot(t,sd);

% pause(D+1)
% soundsc(sd, Fs)

Dt = 30e-3; % duree de trame
Nt = floor(Dt * Fs) ;% # d'echantillons par trame

if (rem(Ns,Nt)~=0) % le reste de la division de Ns par Nt 
    s = [s; zeros(Nt-rem(Ns,Nt),1)];
end
Ns = length(s); % mise a jour

L = Ns/Nt ;% nbre de trame

S = reshape(s, Nt,L);
%size(S)
E = sum(S .* S)/Nt; % vecteur energie par trame 
%size(E)

Nzc = zeros(1,L);
for c = 1:L,
   Nzc(c)= zerocross(S(:,c));
   
end
%    size(Nzc)
Nth = Nt/4; % valeur seuil
VU =  Nzc < Nth;

P=[10,12,15]; % nbre de coef LPC
for i=1:3

A = zeros (P(i),L);

for c = 1:L,
   A(:,c)= mylpc(S(:,c),P(i)); % :,c ==> la coloone de c
   
end

% size(A) % 15 ligne 84 clonnes

%%% Synthese
Dp = 7.5e-3;
Np = Dp * Fs;
for c = 1:L, 
    if VU(c) == 1 ,
        e = exciteV(Nt,Np);
    else
        e = exciteNV(Nt);
    end
    Num = 1;
    Den = [1; -A(:,c)]; % on met ';' car A est un vecteur colonne
    Ss(:,c) =  E(c) * filter(Num,Den,e);% synthese pour chaque trame , Num  ==>numerateur , Den==>  denumerateur
    
end

ss = reshape(Ss, Nt*L, 1);

t = (0:Ns-1)/Fs;

plot(t,ss);
soundsc(ss)
end