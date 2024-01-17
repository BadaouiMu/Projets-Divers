%%%Mustapha badaoui

close all
clear all
%======QUESTION 1 =========
[S, Fs]= audioread('speech.wav');
K = audioinfo('speech.wav') ;
%%%Q2===============
N = length(S);
t = (0:N-1)/Fs;
soundsc(S,Fs)
S=S-mean(S); %centraliser
Sn = S/max(S); %normaliser le canal 2
subplot(211),plot(t,Sn)
xlabel('time(sec)')
title('X');
maxR =max(S) ; 
minR =min(S) ; 
nbb=N^(1/3) 
lk =(maxR-minR)/nbb ;
pointsR= (0: lk:maxR); 
%
[nn,xx] =hist(S,pointsR); 
subplot(212),bar(xx, nn/(N*lk));title('histograme');
 

e1=9810 ;
e2=9998 ;
L=e2-e1 ;
sv=S(e1:e2);
P=(9998-9810)/6/Fs*1000  

es=sum((sv).^2)/L;
sv1 = [0; sv(1:end-1)];
zcr = sum((sv.*sv1)<0);
disp(['Energy = ',num2str(es), ' Wat'])
disp(['Passage par zero = ',num2str(zcr), ' fois'])
% %%======spectre===============
figure
Nf = 512;
f=(0:Nf/2-1)*Fs/Nf;
Sa =fft(sv,Nf);
SadB = 20*log10(abs(Sa(1:Nf/2)));
subplot(211),plot(f,SadB),title('spectre')
% %%%%%%%spectrogram================

Nf = 512;
f=(0:Nf/2-1)*Fs/Nf;
ov = 0;%overlapping
subplot(212),
A= Specgm(sv,L,ov,Nf);title('spectrogram')

n=[1,2,3,4,5];
vect_snr=zeros(size(n));

figure;
for i=1:length(n)
    [sq,snr]=Uquantize(S,2^n(i));
    vect_snr(i)=snr;
    subplot(5,1,i);
    plot(t,sq),title(['SIGNAL DE SNR:',num2str(vect_snr(i))]);
end