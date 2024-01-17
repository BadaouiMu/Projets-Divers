clc;
clear;
close ALL





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TO MODIFY  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P=[1 1 1 1 0 1 0 1 1]; %matrice dse generateurs P==>  et séquence à coder
X='0xA4B';%sequence d'entree
k=1;%nombre d'entrées
n=3;%nombre de sorties
L=3;%nombre d'étages
s0={0,0,'-1','-1'};
s1={'-1','-1',0,0};
s2={1,1,'-1','-1'};
s3={'-1','-1',1,1};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% END %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





















X=hexToBinaryVector(X);
for oo=1:k*(L-1)
    X=[X 0];
end
disp('SEQUENCE A CODER EN BINAIRE EN RAJOUTANT LES K(L-1) ZEROS : ')
disp(X)
disp('============================================================')
s=[s0;s1;s2;s3];
[mp,np]=size(P);
L=length(P)/n-1;
colg=np+n*(length(X)-1);
lig=mp*length(X);
G=zeros(lig,colg);
decli=1;
deccol=1;
pasvert=mp;
for i=1:length(X)
    G(decli:decli+mp-1,deccol:deccol+np-1)=P;
    decli=decli+mp;
    deccol=deccol+n;
end
taille=(length(X)/k+L)*n
disp('============================================================================')
G=G(1:length(X),:);
res=gf(X)*gf(G);
res=res(1:taille);
disp('SEQUENCE CODEE : ')
disp(res)
disp('===================================================================')
n=length(X)+1;
N=length(s);
a=0;
plot([1 2],[5 5]);
hold on
plot([1 2],[0 0]);
hold on
plot([n+1 n+2],[0 0]);
hold on
txt = 'S0';
text(1/2,4,txt,'Color','k')
txt = 'S1';
text(1/2,3,txt,'Color','k')
txt = 'S2';
text(1/2,2,txt,'Color','k')
txt = 'S3';
text(1/2,1,txt,'Color','k')
for i=1:n
    plot(i,1,'ko',i,2,'ko',i,3,'ko',i,4,'ko');
    hold on;
end
Diag=[0 -1 -1 -1;zeros(length(X),N)-1]';
for j=1:length(X)
    for i=1:N
        if Diag(i,j)==0
            for k=1:N
                if s{k,i} ~='-1'
                    plot([j j+1],[N-i+1,N-k+1],'g');
                    hold on
                    Diag(k,j+1)=0;
                end
            end
        end                
end
end
    j=1;
N=length(s);
for i=1:length(X)
    txt = ''+X(i);
    text(i-2/3+1,4+1/2,txt,'Color','k')
    for jj=1:N
        if s{jj,j}==X(i)
            a=jj;
        end
    end
    plot([i i+1],[N-j+1,N-a+1],'b');
    hold on
    j=a;
end