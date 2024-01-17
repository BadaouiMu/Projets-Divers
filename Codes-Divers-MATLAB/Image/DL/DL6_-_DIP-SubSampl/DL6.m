%ona tjrs cette chaine : lecture > conversion to double > Traitement >
%concersion to uint8 > sauvegardee

close all ; 
clear all ; 
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

N=[2, 4, 8];
CR=zeros(1,length(N));
PSNR=zeros(size(N));
k=-1; 
for i=1:length(N)
    f=imread([image,'.tif']); 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [M ,F]=size(f); 
    if rem(M,N(i)) ~= 0 
        
        M=floor(M/N(i))*N(i);
        
    end
    if rem(F,N(i)) ~= 0 

        F=floor(F/N(i))*N(i); 
        
    end 
    f=f(1:M, 1:F);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    fs = f(1:N(i):end, 1:N(i):end); 
    [M,F] = size(fs);

    imwrite(fs,[image(z),num2str(N(i)),format]); 
   fQ=imread([image(z),num2str(N(i)),format]); 
   KQ= imfinfo([image(z),num2str(N(i)),format]);

%CR(i)=KQ.Width *KQ.Height*KQ.BitDepth/8/KQ.FileSize ; 
CR(i)=K.FileSize/KQ.FileSize ;

    subplot(3,3,i+3), imshow(fs), title(['1/',num2str(N(i)),' subsampled image CR= ',num2str(CR(i))]) 
    fss = im2uint8(zeros(2*size(fs))); 
    
    for r = 1:M
        for c = 1:F
            fss(2*r-1, 2*c-1) = fs(r,c);
        end
    end

    for r = 1:M
        for c = 1:F-1
            fss(2*r-1, 2*c) = (fss(2*r-1,2*c-1) + fss(2*r-1,2*c+1))/2 ;
        end
    end
    for r = 1:M-1
        for c = 1:2*F
            fss(2*r, c) = (fss(2*r-1,c) + fss(2*r+1,c))/2 ;
        end
    end

    if ( (N(i)==4 )|| (N(i)==8 ))

        [M,F] = size(fss);

    fsss = im2uint8(zeros(2*size(fss))); 

    for r = 1:M
        for c = 1:F
            fsss(2*r-1, 2*c-1) = fss(r,c);
        end
    end

    for r = 1:M
        for c = 1:F-1
            fsss(2*r-1, 2*c) = (fsss(2*r-1,2*c-1) + fsss(2*r-1,2*c+1))/2 ;
        end
    end
    for r = 1:M-1
        for c = 1:2*F
            fsss(2*r, c) = (fsss(2*r-1,c) + fsss(2*r+1,c))/2 ; 
        end
    end
    fss=fsss;
    end

    if (N(i)==8 )
        [M,F] = size(fss);

fssss = im2uint8(zeros(2*size(fsss))); 

    for r = 1:M
        for c = 1:F
            fssss(2*r-1, 2*c-1) = fsss(r,c);
        end
    end

    for r = 1:M
        for c = 1:F-1
            fssss(2*r-1, 2*c) = (fssss(2*r-1,2*c-1) + fssss(2*r-1,2*c+1))/2 ;
        end
    end
    for r = 1:M-1
        for c = 1:2*F
            fssss(2*r, c) = (fssss(2*r-1,c) + fssss(2*r+1,c))/2 ; % pour les lignes paires
        end
    end
    fss=fssss;
    end
% %%%%%%%%%%%%%%%%%%%%%%
% if (z==2 )
%     if(N(i)==4)
%       fss=fss(1:end-3,1:end);
%     end
%     if(N(i)==2)
%       fss=fss(1:end-1,1:end);
%     end
%     if(N(i)==8)
%       fss=fss(1:end-3,1:end);
%     end
% end
% if (z==4)
%     if(N(i)==4)
%       fss=fss(1:end-1,1:end-2);
%     end
%     if(N(i)==2)
%       fss=fss(1:end-1,1:end);
%     end
%     if(N(i)==8)
%       fss=fss(1:end-5,1:end-6);
%     end
% end
% %%%%%%%%%%%%%%%%%%%%%%%%

    
    MSE = sum(sum((double(f)-double(fss)).^2))/numel(f) ;
    PSNR(i) = 20 * log10(255/sqrt(MSE)) ;

    subplot(3,3,i+6), imshow(fss), title(['l"image avec sa taille initiale PSNR=',num2str(PSNR(i))])
    %%%%%%%%%%%%%%%%%%%%%%
    for j=0:20
        if ((PSNR(i) <= CR(i) + j ) && (PSNR(i) >= CR(i)-j) ) 
            k=N(i) ; 
            break ; 
        end 
    end
    %%%%%%%%%%%%%%%%%%%%%%%%
end

subplot(3,2,2)
plot(N,CR,N,PSNR); 
title(['CR et PSNR ( le compromis entre PSNR et CR est ',num2str(k),')'] )
legend('CR','PSNR')
end

