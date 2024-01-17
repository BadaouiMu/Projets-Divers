%%% Mustapha badaoui
clear
close all
clc


[s,Fs]=audioread('speech.wav');
T=(0:length(s)-1)/Fs;

n=[2,4,8];
vect_snr=zeros(size(n));

figure;
for i=1:length(n)
    [sq,snr]=Uquantize(s,2^n(i));
    vect_snr(i)=snr;
    
    if snr>=37,
        MOS=5; % EXCELLENT
    elseif snr<37 && snr>=31
        MOS=4; % GOOD   
    elseif snr<31 && snr>=25
        MOS=3; % FAIR
    elseif snr<25 && snr>=20
        MOS=2;% POOR
    elseif snr<20
        MOS=1 ;% VERY POOR
    end   
    
    subplot(3,1,i);
    plot(T,sq),title(['SIGNAL DE SNR:',num2str(vect_snr(i)),'MOS = ',num2str(MOS)]);
end


n=[2,4,8];
vect_snr=zeros(size(n));

figure
for i=1:length(n)
    y = comp(s, 1) ;
    [sq,snr]=Uquantize(y,2^n(i));
    vect_snr(i)=snr;
    
    if snr>=37,
        MOS=5; % EXCELLENT
    elseif snr<37 && snr>=31
        MOS=4; % GOOD   
    elseif snr<31 && snr>=25
        MOS=3; % FAIR
    elseif snr<25 && snr>=20
        MOS=2;% POOR
    elseif snr<20
        MOS=1 ;% VERY POOR
    end   
    
    subplot(3,1,i);
    plot(T,sq),title(['SIGNAL DE SNR:',num2str(vect_snr(i)),'MOS = ',num2str(MOS)]);
end

n=[2,3,4];
vect_snr=zeros(size(n));


figure;
for i=1:length(n)
    icb=[-1 1] ;
    for z=1:(n(i)-1)
        icb= [icb(1:length(icb)/2),-2^-z , 2^-z,icb(length(icb)/2+1:end)];
    end
   
    [sq,snr]=nuquantize(s,icb);
    vect_snr(i)=snr;
    if i==2
        icb
        [repartition,codebook]=lloyds(s,icb);
        repartition=repartition
        codebook=codebook
    end
    if snr>=37,
        MOS=5; % EXCELLENT
    elseif snr<37 && snr>=31
        MOS=4; % GOOD   
    elseif snr<31 && snr>=25
        MOS=3; % FAIR
    elseif snr<25 && snr>=20
        MOS=2;% POOR
    elseif snr<20
        MOS=1 ;% VERY POOR
    end   
    
    subplot(3,1,i);
    plot(T,sq),title(['SIGNAL DE SNR:',num2str(vect_snr(i)),'MOS = ',num2str(MOS)]);
end
