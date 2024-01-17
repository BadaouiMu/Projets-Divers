clear all ; 
close all ; 
clc ;

for z=1:4
    if z==1 
        image = 'flowers'; 
    elseif z==2 
         image= 'girl' ; 

    elseif z==3 
        image= 'middle_row_left_chalk' ; 
    else 
        image= 'woman_baby_original' ;
    end
     
    figure ('name',[image,'1']) ; 
    f=imread([image,'.tif']); 
    K= imfinfo([image,'.tif']);
    subplot(331), imshow(f), title('original image')

    N=[2 4 8];
    format='.tif';
    fr = f(:,:,1);
    fg = f(:,:,2);
    fb = f(:,:,3);
    for i = 1:length(N),
        step = N(i);
        fr1 = fr(1:step:end,1:step:end);
        fg1 = fg(1:step:end,1:step:end);
        fb1 = fb(1:step:end,1:step:end);
        fres=cat(3,fr1,fg1,fb1);
        imwrite(fres,[image(z),'sech',num2str(N(i)),format]); 
        fQ=imread([image(z),'sech',num2str(N(i)),format]); 
        KQ= imfinfo([image(z),'sech',num2str(N(i)),format]);
        CR=K.FileSize/KQ.FileSize ;
        subplot(3,3,i+3),imshow(fres),title(['s-echan ',num2str(step),'  CR=',num2str(CR)])
    end


    for i=1:length(N)  
        fr2= Uquant2D(fr,N(i)) ; 
        fg2= Uquant2D(fg,N(i)) ; 
        fb2= Uquant2D(fb,N(i)) ; 
        fq=cat(3,fr2,fg2,fb2);
        imwrite(fq,[image(z),'q',num2str(N(i)),format]); 
        fQ=imread([image(z),'q',num2str(N(i)),format]); 
        KQ= imfinfo([image(z),'q',num2str(N(i)),format]);
        CR=K.FileSize/KQ.FileSize ;
        subplot(3,3,i+6) ,imshow(fq) ,title(['quant',num2str(N(i)),'bits,CR= ',num2str(CR)])
    end
    
    figure ('name',[image,'2']) ; 
    C=[8, 64, 256, 1024];
    PSNRd=zeros(size(C));
    PSNRnd=zeros(size(C));
    CRd=zeros(size(C));
    CRnd=zeros(size(C));
    for n= 1:length(C)
        [fd,mapd]=rgb2ind(f,C(n),'dither');
        [fnd,mapnd]=rgb2ind(f,C(n),'nodither');
        imwrite(fd,mapd,[image(z),'fd',num2str(N(i)),format]);
        imwrite(fnd,mapnd,[image(z),'fnd',num2str(N(i)),format]); 
        fQd=imread([image(z),'fd',num2str(N(i)),format]); 
        fQnd=imread([image(z),'fnd',num2str(N(i)),format]); 
        KQd= imfinfo([image(z),'fd',num2str(N(i)),format]);
        KQnd= imfinfo([image(z),'fnd',num2str(N(i)),format]);
        CRd(n)=K.FileSize/KQd.FileSize ;
        CRnd(n)=K.FileSize/KQnd.FileSize ;
        subplot(4,4,1+(n-1)*4),imshow(fd,mapd), title(['rgb2ind d N= ',num2str(C(n)),' CR= ',num2str(CRd(n))])
        subplot(4,4,3+(n-1)*4),imshow(fnd,mapnd), title(['rgb2ind nd N= ',num2str(C(n)),' CR= ',num2str(CRnd(n))])
    
        frd=ind2rgb(fd,mapd);
        frd=im2uint8(frd);
        MSE= sum(sum(sum((double(frd)-double(fq)).^2)))/numel(f) ; 
        PSNRd(n)= 20*log10(255/sqrt(MSE)) ;
     
        frnd=ind2rgb(fnd,mapnd);
        frnd=im2uint8(frnd);
        MSE= sum(sum(sum((double(f)-double(frnd)).^2)))/numel(f) ; 
        PSNRnd(n)= 20*log10(255/sqrt(MSE)) ;
        
        subplot(4,4,2+(n-1)*4),imshow(frd), title(['ind2rgb d PSNR= ' num2str(PSNRd(n))])
        subplot(4,4,4+(n-1)*4),imshow(frnd), title(['ind2rgb nd PSNR= ' num2str(PSNRnd(n))])
        for j=0:20
            if ((PSNRd(n) <= CRd(n) + j ) && (PSNRd(n) >= CRd(n)-j) ) 
                kd=C(n) ; 
                break ; 
            end 
        end
        for j=0:20
            if ((PSNRnd(n) <= CRnd(n) + j ) && (PSNRnd(n) >= CRnd(n)-j) ) 
                knd=C(n) ; 
                break ; 
            end 
        end
    end
    figure(1+(z-1)*2)    
    subplot(3,3,2)
    plot(C,CRd,C,PSNRd); 
    title(['CRd et PSNRd ( le compromis entre PSNR et CR est ',num2str(kd),')'] )
    legend('CRd','PSNRd')
    subplot(3,3,3)
    plot(C,CRnd,C,PSNRnd); 
    title(['CRnd et PSNRnd ( le compromis entre PSNR et CR est ',num2str(knd),')'] )
    legend('CRnd','PSNRnd')
end



