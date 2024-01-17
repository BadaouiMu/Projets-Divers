%%%  Mustapha badaoui  %%%
clear all;
close all;

I = imread('pic2022.tif');

%%% Insérez votre code ici %%%
%% q
subplot(221),imshow(I),title('image org') 
II=imfinfo('pic2022.tif');
t=II.Width*II.Height*II.BitDepth/8;

%% q1
NN=[4 2 1 ];
for i=1:length(NN)
    N=NN(i);
    f=Uquant3D(I,2^N); 
    MSE = sum(sum(sum((double(I)-double(f)).^2)))/numel(I);
    PSNR = 20*log10(255/sqrt(MSE));
    subplot(2,2,i+1),imshow(f),title(['image quantifie ordre=',num2str(N),' PSNR=',num2str(PSNR)]) 
end

% figure
% for i=1:length(NN)
%     N=NN(i); 
%     fr=I(:,:,1);
%     fg=I(:,:,2);
%     fb=I(:,:,3);
% 
%     fr=Uquant2D(fr,2^N); 
%     fg=Uquant2D(fg,2^N); 
%     fb=Uquant2D(fb,2^N);
%     
%     f=cat(3,fr,fg,fb); 
%     MSE = sum(sum(sum((double(I)-double(f)).^2)))/numel(I);
%     PSNR = 20*log10(255/sqrt(MSE));
%     subplot(2,2,i+1),imshow(f),title(['image quantifie ordre=',num2str(N),' PSNR=',num2str(PSNR)]) 
% end

%% q2
figure
[M N]=size(I);
subplot(221),imshow(I),title('image org') 
NS=[2 4 8];

for z=1:length(NS)
Ns=NS(z);
fl=double(I);
for i=1:Ns:M
    for j=1:Ns:N
        C=median(median(fl(i:(i+Ns-1),j:(j+Ns-1))));
        fl(i:(i+Ns-1),j:(j+Ns-1))=C;
    end
end
MSE = sum(sum(sum((double(I)-double(fl)).^2)))/numel(I);
PSNR = 20*log10(255/sqrt(MSE));
fl=uint8(fl); 
subplot(2,2,z+1),imshow(fl),title(['sous-echan ordre=',num2str(Ns),' PSNR =',num2str(PSNR)],'FontSize',6);
end

%% q3
figure
subplot(221),imshow(I),title('image org') 

NN=[16 64 256];
for i=1:length(NN)
    Nc=NN(i);
    [f,map] = rgb2ind(I,Nc, 'dither') ; 
    f=ind2rgb(f,map);
    MSE= sum(sum(sum((double(I)-double(f)).^2))/numel(I)) ; 
    PSNR= 20*log10(255/sqrt(MSE)) ;
    subplot(2,2,i+1), imshow(f) , title (['ind2rgb image dither Nc=',num2str(Nc),'PSNR= ',num2str(PSNR)],'FontSize',6) ; 
end


%%% Mustapha badaoui %%%
