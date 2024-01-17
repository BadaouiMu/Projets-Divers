close all ; 
clear all ; 
clc  ;

for ii=1:4
    if ii==1     
        image='flowers.tif';
    elseif ii==2 
        image='girl.tif' ;
    elseif ii==3 
        image='middle_row_left_chalk.tif' ;
    else
        image='woman_baby_original.tif' ;
    end
figure('name',image) 
f=imread(image) ; 
f= rgb2gray(f) ; 
subplot(251), imshow(f) , title('image org') ; 
subplot(256), imhist(f) , title('hist org') ;

%% iterative
[T,ti]=iterThresholdDL(f,10^-3);
fi=255*uint8(f>T);
MSE = sum(sum((double(f)-double(fi)).^2))/numel(f);
PSNR = 20*log10(255/sqrt(MSE));
subplot(252), imshow(fi) , title(['image bw T_{initial}=',num2str(ti),' T_{final}=',num2str(T),' PSNR= ',num2str(PSNR),'dB'],'FontSize',6) ; 


%% noised binarisation 
A=75;
fn =double(f)-A+(2*A+1)*rand(size(f)); 
fn=uint8(fn); 
fbn=255*uint8(fn>T);
MSE  = sum(sum((double(f)-double(fbn)).^2))/numel(f);
PSNR = 20*log10(255/sqrt(MSE));
subplot(253), imshow(fbn) , title(['image fbn T=',num2str(T),' PSNR= ',num2str(PSNR),'dB'],'FontSize',6) ;

%% Bayer dithering
[fb,D]=bayerDL(f,3);
MSE = sum(sum((double(f)-double(fb)).^2))/numel(f);
PSNR = 20*log10(255/sqrt(MSE));
subplot(2,5,4),imshow(fb),title(['ordered dithering dim 3 PSNR =',num2str(PSNR)],'FontSize',6);
matrice_3x3=D

%% Technique de diffusion d’erreur
fd=diffuse(f,T);
MSE = sum(sum((double(f)-double(fd)).^2))/numel(f);
PSNR = 20*log10(255/sqrt(MSE));
subplot(255),imshow(fd),title(['error diff T= ',num2str(T),' PSNR =',num2str(PSNR)],'FontSize',6); 

%% filtrage
L = 7;
Var = 1;
h = gaussFilter(L, Var);

f1 = filter2(h, fi);
f2 = filter2(h, fbn);
f3 = filter2(h, fb);
f4 = filter2(h, fd);

MSE = sum(sum((double(f)-double(f1)).^2))/numel(f);
PSNR = 20*log10(255/sqrt(MSE));
subplot(257),imshow(uint8(f1)),title(['image filtre PSNR =',num2str(PSNR)]);

MSE = sum(sum((double(f)-double(f2)).^2))/numel(f);
PSNR = 20*log10(255/sqrt(MSE));
subplot(258),imshow(uint8(f2)),title(['image filtre PSNR =',num2str(PSNR)]);

MSE = sum(sum((double(f)-double(f3)).^2))/numel(f);
PSNR = 20*log10(255/sqrt(MSE));
subplot(259),imshow(uint8(f3)),title(['image filtre PSNR =',num2str(PSNR)]);

MSE = sum(sum((double(f)-double(f4)).^2))/numel(f);
PSNR = 20*log10(255/sqrt(MSE));
subplot(2,5,10),imshow(uint8(f4)),title(['image filtre PSNR =',num2str(PSNR)]);

end



