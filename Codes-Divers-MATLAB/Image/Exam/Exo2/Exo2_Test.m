%%%  Mustapha BADAOUI  %%%
clear all;
close all;
clc;

f = imread('chessboard.tif');

%%% Insérez votre code ici %%%
MM=[11 25 39];
VV=[1 4 16];
figure('name','gauss') ;
figure('name','median'); 
for i=1:length(MM)
    M=MM(i);
    for j=1:length(VV)
       
        V=VV(j); 
        w=fspecial('gauss',M,V); 
        g=imfilter(f,w);
        MSE = sum(sum((double(f)-double(g)).^2))/numel(f);
        PSNR = 20*log10(255/sqrt(MSE));
        figure(1);
        subplot(3,3,j+3*(i-1)),imshow(uint8(g)),title(['gauss masque =',num2str(M),' variance =',num2str(V),' PSNR =',num2str(PSNR)])
        
    end
%      m = medianFilterL(f,M);
%      MSE=sum(sum((double(f)-double(m)).^2))/numel(f); %  MSE
%      PSNR=20*log10(255/sqrt(MSE)); 
%      
%      subplot(2,3,i),imshow(uint8(m)),title(['median masque =',num2str(M),' PSNR =',num2str(PSNR)]);
%      
     g = medfilt2(f, [M M], 'symmetric');
        MSE = sum(sum((double(f)-double(g)).^2))/numel(f);
        PSNR = 20*log10(255/sqrt(MSE));
       figure(2);
     subplot(1,3,i),imshow(uint8(g)),title(['median masque =',num2str(M),' PSNR =',num2str(PSNR)]);

end
%%%  Mustapha BADAOUI  %%%
