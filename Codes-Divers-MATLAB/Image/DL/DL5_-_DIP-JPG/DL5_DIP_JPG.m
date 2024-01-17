%ona tjrs cette chaine : lecture > conversion to double > Traitement >
%concersion to uint8 > sauvegardee

close all ; 
clear all ; 
clc ; 
for z=1:4
    if z==1 
        image = 'bubbles'; 
    elseif z==2 
         image= 'Cameraman' ; 

    elseif z==3 
        image= 'lenna256' ; 
    else 
        image= 'Rose1024' ;
    end
     
    figure ('name',image) ; 
f=imread([image,'.tif']); 
K= imfinfo([image,'.tif']);
CR=K.Width *K.Height*K.BitDepth /8/K.FileSize ;

Q=[100, 50, 25, 10, 5, 0];
format='.jpeg';
CR=zeros(1,length(Q));
PSNR=zeros(size(Q));
k=-1; 
for i=1:length(Q)
imwrite(f,[image(z),num2str(Q(i)),format],'quality',Q(i)); 
fQ=imread([image(z),num2str(Q(i)),format]); 
KQ= imfinfo([image(z),num2str(Q(i)),format]);

CR(i)=KQ.Width *KQ.Height*KQ.BitDepth/8/KQ.FileSize ; 
subplot(3,3,i)
imshow(fQ), title (['Q= ',num2str(Q(i)) ,' et CR=',num2str(CR(i))])
MSE=sum(sum((double(f)-double(fQ)).^2))/numel(fQ) ;
PSNR(i)=10*log10((255^2)/MSE) ; 
if ((PSNR(i) <= CR(i) + 9 ) && (PSNR(i) >= CR(i)-9) ) 
    k=Q(i) ; 
end
end

subplot(313)
plot(Q,CR,Q,PSNR); 
title(['CR et PSNR ( le compromis entre PSNR et CR est ',num2str(k),')'] )
legend('CR','PSNR')
end

