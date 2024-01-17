clear all
close all

load VOYELLES.mat

Fs=8000;
Nf=512;
f=(0:Nf/2-1)*Fs/Nf;
Np=45; % éch par période pitch
Ln=5*Np; % longueure trame bande étroite = NARROW
Lw=Np; % longueure trame bande large = WIDE
ovn=Ln/3;
ovw=Lw/3;

A=figure('Name','La voyelle A');
E=figure('Name','La voyelle E');
I=figure('Name','La voyelle I');
O=figure('Name','La voyelle O');
U=figure('Name','La voyelle U');
%%
disp('==========LA VOYELLE A===========')
figure (A)

soundsc(a)

Na= length(a);
ta=(0:Na-1)/Fs;
subplot(221),plot(ta,a);


Sa=fft(a,Nf);
SadB=20*log10(abs(Sa(1:Nf/2)));
subplot(222), plot(f,SadB);

% narrowband spectrogram
An=specgm(a,Ln,ovn,Nf,0);
subplot(223),imagesc(ta,f,An)
title('narrowband spectrogram')
xlabel('Time (in sec)')
ylabel('Frequency (in Hz)')


% wideband spectrogram
Aw=specgm(a,Lw,ovw,Nf,0);
subplot(224),imagesc(ta,f,Aw)
title('wideband spectrogram')
xlabel('Time (in sec)')
ylabel('Frequency (in Hz)')

% Centre de gravité
Pa = abs(fftshift(Sa(1:Nf/2)));
cogA = sum(Pa.*f');
fprintf('Centre de gravité de "a" est %f \n',cogA);

% Ecart type
etA=sqrt(sum((f'-cogA).^2.*Pa));
fprintf('Ecart type de "a" est %f \n',etA);

% Asymétrie
asymA=sum(((f'-cogA)./etA).^3.*Pa);
fprintf('Asymétrie de "a" est %f \n',asymA);

% Aplatissement
aplatA=-3+sum(((f'-cogA)./etA).^4.*Pa);
fprintf('Aplatissement de "a" est %f \n',aplatA);

pause(3)

%%
disp('==========LA VOYELLE E===========')
figure (E)

soundsc(e)

Ne= length(e);
te=(0:Ne-1)/Fs;
subplot(221),plot(te,e);


Se=fft(e,Nf);
SedB=20*log10(abs(Se(1:Nf/2)));
subplot(222), plot(f,SedB);

% narrowband spectrogram
En=specgm(e,Ln,ovn,Nf,0);
subplot(223),imagesc(te,f,En)
title('narrowband spectrogram')
xlabel('Time (in sec)')
ylabel('Frequency (in Hz)')


% wideband spectrogram
Ew=specgm(e,Lw,ovw,Nf,0);
subplot(224),imagesc(te,f,Ew)
title('wideband spectrogram')
xlabel('Time (in sec)')
ylabel('Frequency (in Hz)')


% Centre de gravité
Pe = abs(fftshift(Se(1:Nf/2)));
cogE = sum(Pe.*f');
fprintf('Centre de gravité de "e" est %f \n',cogE);

% Ecart type
etE=sqrt(sum((f'-cogE).^2.*Pe));
fprintf('Ecart type de "e" est %f \n',etE);

% Asymétrie
asymE=sum(((f'-cogE)./etE).^3.*Pe);
fprintf('Asymétrie de "e" est %f \n',asymE);

% Aplatissement
aplatE=-3+sum(((f'-cogE)./etE).^4.*Pe);
fprintf('Aplatissement de "e" est %f \n',aplatE);

pause(3)

%%
disp('==========LA VOYELLE I===========')
figure (I)

soundsc(i)

Ni= length(i);
ti=(0:Ni-1)/Fs;
subplot(221),plot(ti,i);


Si=fft(i,Nf);
SidB=20*log10(abs(Si(1:Nf/2)));
subplot(222), plot(f,SidB);

% narrowband spectrogram
In=specgm(i,Ln,ovn,Nf,0);
subplot(223),imagesc(ti,f,In)
title('narrowband spectrogram')
xlabel('Time (in sec)')
ylabel('Frequency (in Hz)')


% wideband spectrogram
Iw=specgm(i,Lw,ovw,Nf,0);
subplot(224),imagesc(ti,f,Iw)
title('wideband spectrogram')
xlabel('Time (in sec)')
ylabel('Frequency (in Hz)')

% Centre de gravité
Pi = abs(fftshift(Si(1:Nf/2)));
cogI = sum(Pi.*f');
fprintf('Centre de gravité de "i" est %f \n',cogI);

% Ecart type
etI=sqrt(sum((f'-cogI).^2.*Pi));
fprintf('Ecart type de "i" est %f \n',etI);

% Asymétrie
asymI=sum(((f'-cogI)./etI).^3.*Pi);
fprintf('Asymétrie de "i" est %f \n',asymI);

% Aplatissement
aplatI=-3+sum(((f'-cogI)./etI).^4.*Pi);
fprintf('Aplatissement de "i" est %f \n',aplatI);

pause(3)

%%
disp('==========LA VOYELLE O===========')
figure (O)

soundsc(o)

No= length(o);
to=(0:No-1)/Fs;
subplot(221),plot(to,o);


So=fft(o,Nf);
SodB=20*log10(abs(So(1:Nf/2)));
subplot(222), plot(f,SodB);

% narrowband spectrogram
On=specgm(o,Ln,ovn,Nf,0);
subplot(223),imagesc(to,f,On)
title('narrowband spectrogram')
xlabel('Time (in sec)')
ylabel('Frequency (in Hz)')


% wideband spectrogram
Ow=specgm(o,Lw,ovw,Nf,0);
subplot(224),imagesc(to,f,Ow)
title('wideband spectrogram')
xlabel('Time (in sec)')
ylabel('Frequency (in Hz)')

% Centre de gravité
Po = abs(fftshift(So(1:Nf/2)));
cogO = sum(Po.*f');
fprintf('Centre de gravité de "o" est %f \n',cogO);

% Ecart type
etO=sqrt(sum((f'-cogO).^2.*Po));
fprintf('Ecart type de "o" est %f \n',etO);

% Asymétrie
asymO=sum(((f'-cogO)./etO).^3.*Po);
fprintf('Asymétrie de "o" est %f \n',asymO);

% Aplatissement
aplatO=-3+sum(((f'-cogO)./etO).^4.*Po);
fprintf('Aplatissement de "o" est %f \n',aplatO);

pause(3)

%%
disp('==========LA VOYELLE U===========')
figure (U)

soundsc(u)

Nu= length(u);
tu=(0:Nu-1)/Fs;
subplot(221),plot(tu,u);


Su=fft(u,Nf);
SudB=20*log10(abs(Su(1:Nf/2)));
subplot(222), plot(f,SudB);

% narrowband spectrogram
Un=specgm(u,Ln,ovn,Nf,0);
subplot(223),imagesc(tu,f,Un)
title('narrowband spectrogram')
xlabel('Time (in sec)')
ylabel('Frequency (in Hz)')


% wideband spectrogram
Uw=specgm(u,Lw,ovw,Nf,0);
subplot(224),imagesc(tu,f,Uw)
title('wideband spectrogram')
xlabel('Time (in sec)')
ylabel('Frequency (in Hz)')

% Centre de gravité
Pu = abs(fftshift(Su(1:Nf/2)));
cogU = sum(Pu.*f');
fprintf('Centre de gravité de "u" est %f \n',cogU);

% Ecart type
etU=sqrt(sum((f'-cogU).^2.*Pu));
fprintf('Ecart type de "u" est %f \n',etU);

% Asymétrie
asymU=sum(((f'-cogU)./etU).^3.*Pu);
fprintf('Asymétrie de "u" est %f \n',asymU);

% Aplatissement
aplatU=-3+sum(((f'-cogU)./etU).^4.*Pu);
fprintf('Aplatissement de "u" est %f \n',aplatU);

