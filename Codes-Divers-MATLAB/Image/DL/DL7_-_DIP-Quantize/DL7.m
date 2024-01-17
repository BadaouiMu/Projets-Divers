clear all ; 
close all ; 
clc ; 
for z=1:4
    if z==1 
        image = 'cameraman'; 
    elseif z==2 
         image= 'chest-xray' ; 

    elseif z==3 
        image= 'lenna256' ; 
    else 
        image= 'Breast_Xray' ;
    end
     
    figure ('name',image) ; 
    f=imread([image,'.tif']); 
    K= imfinfo([image,'.tif']);
    CR=K.Width *K.Height*K.BitDepth /8/K.FileSize ;
    subplot(331), imshow(f), title(['original image CR=',num2str(CR)])

    N=[128,64,32,16,8,4,2];
    format='.tif';
    CR=zeros(1,length(N));
    PSNR=zeros(size(N));
    
    for i=1:length(N)  
        fq= Uquant2D(f,N(i)) ; 
        imwrite(fq,[image(z),num2str(N(i)),format]); 
        fQ=imread([image(z),num2str(N(i)),format]); 
        KQ= imfinfo([image(z),num2str(N(i)),format]);
        CR(i)=KQ.Width *KQ.Height*KQ.BitDepth/8/KQ.FileSize ;
        MSE= sum(sum((double(f)-double(fq)).^2))/numel(f) ; 
        PSNR(i)= 20*log10(255/sqrt(MSE)) ;
        subplot(3,3,i+2) ,imshow(fq) ,title(['quant',num2str(N(i)),'bits,CR= ',num2str(CR(i)),'PSNR= ',num2str(PSNR(i))])
        for j=0:20
            if ((PSNR(i) <= CR(i) + j ) && (PSNR(i) >= CR(i)-j) ) 
                k=N(i) ; 
                break ; 
            end 
        end
        
    end
    subplot(3,3,2)
    plot(N,CR,N,PSNR); 
    title(['CR et PSNR ( le compromis entre PSNR et CR est ',num2str(k),')'] )
    legend('CR','PSNR')
end



