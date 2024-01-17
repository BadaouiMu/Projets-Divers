% DL8: Traitement temporel des signaux paroles –

clear all;
close all;
clc;

% lecture et écoute du fichier "speech_sample.wav"

[s,Fs] = audioread('speech_sample.wav');
soundsc(s,Fs) 

% Les caractéristiques du signal: 
audioinfo 'speech_sample.wav'
K = audioinfo('speech_sample.wav'); % ex ==> K.BitsPerSample , K.SampleRate



Ns = length(s);
Ds = Ns/Fs; % duree de sample
n = 0:Ns-1; % vecteur indice echantillons
t = n/Fs; % vecteur instants echantillons

subplot(211), plot(n, s),xlabel('#Sample')
% axis([0, max(t), -1, 1])
subplot(212), plot(t, s),xlabel('Time(sec)')

% Centrer et normaliser le signal parole:

Nstv = 13000; %voicedSig
Nstuv = 9000; %UnvoicedSig
Ne = 300;

m = sum(s)/Ns; % la composante continue
s = s-m; % ==> signal est surement centre
sv = s(Nstv:Nstv+Ne-1);
suv = s(Nstuv:Nstuv+Ne-1);

% Tracage du segment voisé et du segment non-voisé
figure
subplot(221), plot(Nstv:Nstv+Ne-1, sv),title('segment voise')
hold on, plot([Nstv,Nstv+Ne] , [0,0]) % axe des abscisses
subplot(222), plot(Nstuv:Nstuv+Ne-1, suv),title('segment non voise')
hold on, plot([Nstuv,Nstuv+Ne],[0,0])% axe des abscisses

%  calcul de la période de pitch
       % premiere methode 
       
s0 = s(Nstv:Nstv+Ne-1); % selection du segment voise

amdf = zeros(1, floor(Ne/2));
for i = 1:floor(Ne/2),
    sd = s(Nstv+i:Nstv+i+Ne-1); % selection du segment voise decale de i 
    amdf(i) = sum(abs(sv-sd))/Ne;
end
p1 = find(amdf==min(amdf))/Fs*1000 % en msec
 
       % Deuxieme methode 


s0 = s(Nstv:Nstv+Ne-1); % selection du segment voise
amdf = zeros(1, floor(Ne/2));
for i = 1:floor(Ne/2)
    sd = s(Nstv+i:Nstv+i+Ne-1); % selection du segment voise decale de i 
    amdf(i) = sum(s0 .* sd);
end
p2 = find(amdf==max(amdf))/Fs*1000 % en msec

 % troixieme methode 

s0 = s(Nstv:Nstv+Ne-1); % selection du segment voise
amdf = zeros(1, floor(Ne/2));
for i = 1:floor(Ne/2),
    sd = s(Nstv+i:Nstv+i+Ne-1); % selection du segment voise decale de i 
    amdf(i) = sum((s0-sd).^2);
end
p3 = find(amdf==min(amdf))/Fs*1000 % en msec

% signal decale
 
sv1 = [0;sv(1:end-1)] ;% signal decale de sv
suv1 = [0;suv(1:end-1)];% signal decale de suv

%  calcul de taux de passage par zéro :

% 1ere formule

ZCRv = sum((sv.*sv1)<0); % le nmbre de passage par zero du segment voise
ZCRuv = sum((suv.*suv1)<0); % le nmbre de passage par zero du segment non voise

% 2ere formule

ZCRv = sum(abs(sign(sv)- sign(sv1)))/2; % le nmbre de passage par zero
ZCRuv = sum(abs((sign(suv)- sign(suv1))))/2;

subplot(223), plot(Nstv:Nstv+Ne-1, sv),title(['segment voise, ' ,'ZCRv= ',num2str(ZCRv)])
hold on, plot([Nstv,Nstv+Ne] , [0,0]) % axe des abscisses
subplot(224), plot(Nstuv:Nstuv+Ne-1, suv),title(['segment non voise,', ' ZCRuv= ',num2str(ZCRuv)])
hold on, plot([Nstuv,Nstuv+Ne],[0,0])% axe des abscisses


% Tracer pour le signal parole l’évolution de la puissance moyenne et du taux de passage par
%zéro en prenant des trames de durée trois fois la période du pitch et un chevauchement de
%2/3 cette durée.

L = 330;
m  = 1;
ov = L*2/3; %chevauchement(sans chevauchement ov = 0) overlap

 while (m+L-1 <= Ns)
      S = DFTwin(s,L,m,Nf);
      mS = abs(S);
      plot(f, mS(1:Nf/2))
      axis([0,4000,0,30])
      pause(1)
      m = m + L - ov ;
 end