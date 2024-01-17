close all ;
clear all ; 
clc ; 
%%
for i=1:2
    if i==1 
        f=imread('flowers.tif');
    else
        f=imread('girl.tif');
    end
figure
R=f(:,:,1); 
G=f(:,:,2); 
B=f(:,:,3);
Y = (0.299.*(R) + 0.587.*G + 0.114.*B);
I= (0.596.* R - 0.274.*G - 0.322.*B);
Q = (0.211.*R - 0.523.*G + 0.312.*B);
h= cat(3,Y,I,Q);
subplot(241), imshow(h);title('rgb2ntsc') 

R = (1.000.*Y + 0.956.*I + 0.621.*Q);
G= (1.000.*Y- 0.272.*I - 0.647.*Q);
B = (1.000.*Y - 1.106.*I + 1.703.*Q);
hh= cat(3,R,G,B);
subplot(242), imshow(hh);title('ntsc2rgb')

%%

Y = (0.299.*(f(:,:,1)) + 0.587.*(f(:,:,2)) + 0.114.*(f(:,:,3)));
Cb = (0.564.*((f(:,:,3)) - (Y(:,:,1)))+128);
Cr = (0.713.*((f(:,:,1)) - (Y(:,:,1)))+128);
h= cat(3,Y,Cb,Cr);
subplot(243), imshow(h);title('rgb2ycbcr')

R = (h(:,:,1)) + 1.4025.*((h(:,:,3) - 128));
G = (h(:,:,1)) - 0.3443.*((h(:,:,2) - 128)) - 0.7144.*((h(:,:,3) - 128));
B = (h(:,:,1)) + 1.7730.*((h(:,:,2) - 128));
hh = cat(3,R,G,B);
subplot(244), imshow(hh);title('ycbcr2rgb')

%%

f=double(f);
R=f(:,:,1); 
G=f(:,:,2); 
B=f(:,:,3);
C=1-R; 
M=1-G;
Y=1-B;
h = cat(3,C,M,Y);
subplot(245), imshow(h);title('rgb to hsv')


h=double(h);
C=h(:,:,1); 
M=h(:,:,2);
Y=h(:,:,3); 
R=1-C; 
G=1-M;
B=1-Y; 
hh = cat(3,R,G,B); 
subplot(246), imshow(hh);title('hsv to rgb')

%%

f = double(f);
R = f(:,:,1);
G = f(:,:,2);
B = f(:,:,3);
[M ,N,k] = size(f);
V=zeros(M,N); VV=zeros(M,N);
S=zeros(M,N); 
H=zeros(M,N); 
for i=1:M
    for j=1:N
        V(i,j) = max(max(R(i,j),G(i,j)),B(i,j));
        VV(i,j) = min(min(R(i,j),G(i,j)),B(i,j));
    end
end

for i=1:M
    for j=1:N
        if V(i,j) == 0
            S(i,j) = 0;
        else
            S(i,j) = (V(i,j)- VV(i,j)) / V(i,j);
        end
    end
end

for i=1:M
    for j=1:N
        if     V(i,j) == R(i,j)
            H(i,j) = (1/6)*(0 + ((G(i,j) - B(i,j))  / (V(i,j)- VV(i,j))));
            
        elseif V(i,j) == G(i,j)
            H(i,j) = (1/6)*(2 + ((B(i,j) - R(i,j))  / (V(i,j)- VV(i,j))));
             
        elseif V(i,j) == B(i,j)
            H(i,j) = (1/6)*(4 + ((R(i,j) - G(i,j))  / (V(i,j)- VV(i,j))));
        end
        
        if H(i,j) < 0
            H(i,j) = H(i,j) + 360; 
        end   
    end
end
HSV = cat(3,H,S,V); 
subplot(247), imshow(HSV),title('rgb2hsv')


I=double(f)/255;
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
numi=1/2*((R-G)+(R-B));
denom=((R-G).^2+((R-B).*(G-B))).^0.5;
H=acosd(numi./(denom+0.000001));
H(B>G)=360-H(B>G);
H=H/360; 
S=1- (3./(sum(I,3)+0.000001)).*min(I,[],3);
I=sum(I,3)./3;
HSI=zeros(size(f));
HSI(:,:,1)=H;
HSI(:,:,2)=S;
HSI(:,:,3)=I;
subplot(248), imshow(HSI),title('hsv2rgb')






end












