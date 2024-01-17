clear all
close all

load VOYELLES.mat

Fs = 8000;

Na= length(a);
Ne= length(e);
Ni= length(i);
No= length(o);
Nu= length(u);

ta=(0:Na-1)/Fs;
te=(0:Ne-1)/Fs;
ti=(0:Ni-1)/Fs;
to=(0:No-1)/Fs;
tu=(0:Nu-1)/Fs;


soundsc(a)
% pause
% soundsc(e)
% pause
% soundsc(i)
% pause
% soundsc(o)
% pause
% soundsc(u)
% pause

subplot(531), plot(ta,a);
subplot(534), plot(te,e);
subplot(537), plot(ti,i);
subplot(5,3,10), plot(to,o);
subplot(5,3,13), plot(tu,u);

Nf=512;
f=(0:Nf/2-1)*Fs/Nf;

Sa=fft(a,Nf);
Se=fft(e,Nf);
Si=fft(i,Nf);
So=fft(o,Nf);
Su=fft(u,Nf);

SadB=20*log10(abs(Sa(1:Nf/2)));
SedB=20*log10(abs(Se(1:Nf/2)));
SidB=20*log10(abs(Si(1:Nf/2)));
SodB=20*log10(abs(So(1:Nf/2)));
SudB=20*log10(abs(Su(1:Nf/2)));


subplot(532), plot(f,SadB);
subplot(535), plot(f,SedB);
subplot(538), plot(f,SidB);
subplot(5,3,11), plot(f,SodB);
subplot(5,3,14), plot(f,SudB);

Np=45; % ech par periode pitch
L=5*Np; % longueure trame bande etroite
ov=L/3;

subplot(533),A=specgm(a,L,ov,Nf,0);
% specgm(signal,40,20,Nf,1)
subplot(533),imagesc(ta,f,A);
xlabel('Time (in sec)')
ylabel('Frequency (in Hz)')

subplot(536),E=specgm(e,L,ov,Nf,0);
% specgm(signal,40,20,Nf,1)
subplot(536),imagesc(te,f,E);
xlabel('Time (in sec)')
ylabel('Frequency (in Hz)')

subplot(5,3,9),I=specgm(i,L,ov,Nf,0);
% specgm(signal,40,20,Nf,1)
subplot(5,3,9),imagesc(ti,f,I);
xlabel('Time (in sec)')
ylabel('Frequency (in Hz)')

subplot(5,3,12), O=specgm(o,L,ov,Nf,0);
% specgm(signal,40,20,Nf,1)
subplot(5,3,12),imagesc(to,f,O);
xlabel('Time (in sec)')
ylabel('Frequency (in Hz)')

subplot(5,3,15),U=specgm(u,L,ov,Nf,0);
% specgm(signal,40,20,Nf,1)
subplot(5,3,15),imagesc(tu,f,U);
xlabel('Time (in sec)')
ylabel('Frequency (in Hz)')

% axis xy
% colormap(1-gray);
% colormap(jet);

