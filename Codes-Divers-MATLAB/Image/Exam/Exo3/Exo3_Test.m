%%% Mustapha BADAOUI %%%
clear all;
close all;

f = imread('chessboard.tif');

fn1 = imread('noisedimage1.tif');

fn2 = imread('noisedimage2.tif');

%%% Ins�rez votre code ici %%%
subplot(131), imshow(f) ,title('f')
MSE = sum(sum(sum((double(f)-double(fn1)).^2)))/numel(f);
PSNR = 20*log10(255/sqrt(MSE));
subplot(132), imshow(fn1) ,title(['fn1 PSNR=',num2str(PSNR)])
MSE = sum(sum(sum((double(fn2)-double(f)).^2)))/numel(f);
PSNR = 20*log10(255/sqrt(MSE));
subplot(133), imshow(fn2) ,title(['fn2 PSNR=',num2str(PSNR)])

%% image bruite 1 
figure
w=fspecial('gauss',11,7); 
ff=imfilter(fn1,w);
MSE = sum(sum(sum((double(fn1)-double(f)).^2)))/numel(f);
PSNR = 20*log10(255/sqrt(MSE));
subplot(131), imshow(fn1) ,title(['fn1 PSNR=',num2str(PSNR)])
MSE = sum(sum(sum((double(ff)-double(f)).^2)))/numel(f);
PSNR = 20*log10(255/sqrt(MSE));
subplot(132), imshow(ff) ,title(['filtre lin PSNR=',num2str(PSNR)])

ff = medfilt2(fn1, [11 11], 'symmetric');
MSE = sum(sum(sum((double(ff)-double(f)).^2)))/numel(f);
PSNR = 20*log10(255/sqrt(MSE));
subplot(133), imshow(ff) ,title(['filtre non lin PSNR=',num2str(PSNR)])





%% image bruite 2
figure
ff=im2double(fn2); 
w=ones (7); 
ff=imfilter(ff,w,'replicate');
ff=uint8(ff); 

MSE = sum(sum(sum((double(fn2)-double(f)).^2)))/numel(f);
PSNR = 20*log10(255/sqrt(MSE));
subplot(131), imshow(fn2) ,title(['fn2 PSNR=',num2str(PSNR)])
MSE = sum(sum(sum((double(ff)-double(f)).^2)))/numel(f);
PSNR = 20*log10(255/sqrt(MSE));
subplot(132), imshow(ff,[]) ,title(['filtre PSNR=',num2str(PSNR)])
% 
% ff=double(fn2); 
% ff= padarray(ff,[7 7] , 'replicate');
% ff = colfilt(ff, [7 7],'sliding',@gmean);
% % imhist(ff) %% T=115 t2=140
% % ff=imadjust(ff,[115/255 140/255],[]);
% MSE = sum(sum(sum((double(ff)-double(f)).^2)))/numel(f);
% PSNR = 20*log10(255/sqrt(MSE));
% subplot(133), imshow(ff) ,title(['filtre non lin PSNR=',num2str(PSNR)])

%%% Mustapha BADAOUI %%%
