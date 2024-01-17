close all ; 
clear all ; 
clc ; 

%generation de la distri de poisson a partir de la distri uniforme
%init et generation de U
N=2000;
U=rand(1,N);
a=5;Umax=max(U);X=zeros(1,N);
%init par calc
pX(1)=exp(-a);%PX(X=0);
FX(1)=pX(1);nmax=1;

%pddf et cdf calcul
while((FX(nmax)<Umax)&(nmax<N))
    %iterative call
    pX(nmax+1)=a*pX(nmax)/nmax;
    FX(nmax+1)=FX(nmax)+pX(nmax+1);
    nmax=nmax+1;
end


%Generation de X
for ii=1:nmax-1
    ind=find((U>=FX(ii))&(U<FX(ii+1)));
    X(ind)=ii*ones(1,length(ind));
end

%les cas extremes
ind=find(U<FX(1));
X(ind)=zeros(1,length(ind));
ind=find(U>=FX(nmax));
X(ind)=nmax*ones(1,length(ind));

%verification
[pXest x0]=hist(X,(0:nmax));
stem(x0,pXest/N,'fill');hold;
plot((0:nmax-1),pX,'y',(0:nmax-1),pX,'rx');