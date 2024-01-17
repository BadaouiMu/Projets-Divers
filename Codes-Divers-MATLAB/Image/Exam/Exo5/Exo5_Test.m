%%% Mustapha BADAOUI %%%
clear all;
close all;

I = imread('pic2022.tif');
I = rgb2gray(I);

%%% Insérez votre code ici %%%
%%
subplot(121),imshow(I), title('Original Image')
subplot(122),imhist(I)
%% a

%=========Seuillage Simple==============%
figure
T = iterThreshold(I, 1e-3);

I1 = 255*uint8(I>T);
MSE = sum(sum((double(I)-double(I1)).^2))/numel(I);
PSNR = 20*log10(255/sqrt(MSE));
 subplot(121), imshow(I1), title(['Iterative ','PSNR = ', num2str(PSNR),'db'])

w = fspecial('gauss',7,1);
I1f = imfilter(I1, w);
MSE = sum(sum((double(I)-double(I1f)).^2))/numel(I);
PSNR = 20*log10(255/sqrt(MSE));
subplot(122),imshow(I1f),title(['Iterative filtre , ','PSNR = ', num2str(PSNR), 'dB'])

%==========Noised Binarization============%
figure
A = 50;

I2 = double(I) - A + 2*(A+1) * rand(size(I));

I2 = 255*uint8(I2>T);
MSE = sum(sum((double(I)-double(I2)).^2))/numel(I);
PSNR = 20*log10(255/sqrt(MSE));

subplot(121), imshow(I2), title(['Noised Binarization ','PSNR = ', num2str(PSNR)])

w = fspecial('gauss',7,1);
I2f = imfilter(I2, w);
MSE = sum(sum((double(I)-double(I2f)).^2))/numel(I);
PSNR = 20*log10(255/sqrt(MSE));
subplot(122),imshow(I2f),title(['Noised Binarization après filtrage, ','PSNR = ', num2str(PSNR), 'dB'])

%==========Ordered Ditering==========%
figure
I3 = bayer(I);
MSE = sum(sum((double(I)-double(I3)).^2))/numel(I);
PSNR = 20*log10(255/sqrt(MSE));

subplot(121), imshow(I3), title(['bayer dithering ','PSNR = ', num2str(PSNR)])

w = fspecial('gauss',7,1);
I3f = imfilter(I3, w);
MSE = sum(sum((double(I)-double(I3f)).^2))/numel(I);
PSNR = 20*log10(255/sqrt(MSE));
subplot(122),imshow(I3f),title(['bayer dith après filtrage, ','PSNR = ', num2str(PSNR), 'dB'])

% %Error Diffusion
figure

I4 = diffuse(I,T);
MSE = sum(sum((double(I)-double(I4)).^2))/numel(I);
PSNR = 20*log10(255/sqrt(MSE));

subplot(121), imshow(I3), title(['diffuse ','PSNR = ', num2str(PSNR)])

w = fspecial('gauss',7,1);
I4f = imfilter(I4, w);
MSE = sum(sum((double(I)-double(I4f)).^2))/numel(I);
PSNR = 20*log10(255/sqrt(MSE));
subplot(122),imshow(I4f),title(['diffuse après filtrage, ','PSNR = ', num2str(PSNR), 'dB'])


%%% Mustapha BADAOUI %%%
