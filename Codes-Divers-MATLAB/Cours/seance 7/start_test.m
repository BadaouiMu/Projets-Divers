clear all ; 
close all; 
clc;

%lecture du fichier "start.au"
[s,Fs] = audioread('start.au') ; 



% audioinfo 'start.au' %%% pour avoir tous les infos 
K = audioinfo ('start.au' ); % => K.BitsPerSample / K.SampleRate
Ns=length(s); %= K.TotalSamples
Ds=Ns/Fs ;% = K.Duration

% soundsc(s,Fs) 
n=0:Ns-1 ; %vecteur indice echant
t = n/Fs ; 
subplot(211) , plot (n,s) ,xlabel('#samples') 
subplot (212)  , plot (t , s ) , xlabel ('time (s)') 
% Tp = on prend une period ex Tp=(0.9453-0.8828)*1000 faux car on doit calcule en milieu $ou (3636-3571)*0.125

%pour s assurer que le signal est centre
moy= sum(s) / Ns ; 
ss=s ;
s= s - moy ; 
figure
subplot(211) , plot (t,s) ,title('centre') 
subplot (212)  , plot (t , ss ) , title ('non centre')  %c est presque la meme chose pour ce cas 


Ne = 300 ; 
nstv = 4000 ; 
nstuv = 3000  ; 
sv= s (nstv:nstv+Ne-1 ) ;
suv= s (nstuv:nstuv+Ne-1 ) ;

P= sum(s.^2)/Ns ; %n est pas necessaire 
Pv=sum(sv.^2)/Ne ; 
Puv=sum(suv.^2)/Ne ; 

%calcul de ZCR
sv1= [0; sv(1:end-1)];
suv1= [0; suv(1:end-1)];
%1 ere formule 
ZCRv = sum((sv.*sv1)<0); 
ZCRuv = sum((suv.*suv1)<0); 
% 2 eme formle 
ZCRvf2 = sum(abs(sign(sv) - sign(sv1)))/2 ; 
ZCRuvf2 = sum(abs(sign(suv) -sign(suv1)))/2 ;

figure 
subplot(211) , plot (nstv:nstv+Ne-1 ,sv),title(['sv avec Pv= ',num2str(Pv),' ZCRv f1= ' , num2str(ZCRv),' ZCRv f2= ' , num2str(ZCRvf2) ])
hold on, plot ([nstv, nstv+Ne] , [0,0] ) 
subplot (212)  , plot (nstuv:nstuv+Ne-1 , suv ) , title (['suv avec Puv= ',num2str(Puv),' ZCRuv f1= ' , num2str(ZCRuv),' ZCRv f2= ' , num2str(ZCRuvf2)])  
hold on, plot ([nstuv, nstuv+Ne] , [0,0] ) 

figure 
%exo
%parvourir le signal depuis le debut jusqu a la fin avec des segments non
%chevauches de 300 ech si la taille n est pas 300 ajouter des 0 ou tranquer
% pour ech determiner P et Zcr et tracer l evolution de P et de ZCR 

%normaliser le signale
s=s/max(s) ; 


% s assurer que Ne multiple de Ns 

Ne =300 ; 
if (rem(Ns,Ne) ~= 0 ) 
    r =rem(Ns,Ne) ; Nz =Ne-r; 
    s=[s; zeros(Nz,1)] ; 
end
Ns = length(s) ; 

NT = Ns /Ne ; %# de trame

P=zeros (NT,1) ;
ZCR=zeros (NT,1) ;


for t=1:NT 
    ss=s((t-1)*Ne+1:t*Ne); 
    ss1=[0; ss(1:end-1)]; 
    Ps=sum(ss.^2)/Ne ;P(t)=Ps ; 
    ZCRs = sum((ss.*ss1)<0); ZCR(t) = ZCRs ; 
    plot ((t-1)*Ne+1:t*Ne ,ss),title(['trame N : ',num2str(t) ,' avec Ps= ',num2str(Ps),' ZCRs = ' , num2str(ZCRs) ])
    axis ([1,Ns,-1,1]) ; 
    hold on, plot ([(t-1)*Ne+1,t*Ne] , [0,0] ) 
    hold off, 
    pause (1); 
end

figure 
plot (P/max(P))
hold on 
plot (ZCR/max(ZCR))


% 
%     
% 
% 
% 
% 
