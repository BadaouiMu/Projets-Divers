clear all ; 
close all ; 
clc 

[a,Fsa]=audioread('a.wav');
[e,Fse]=audioread('e.wav');
[i,Fsi]=audioread('i.wav');
[o,Fso]=audioread('o.wav');
[u,Fsu]=audioread('u.wav');




%on a Fsa=Fse=.. donc : 
Fs=Fsa 
% 
% soundsc(a,Fs) ;pause(3) 
% ssoundsc(e,Fs) ;pause(3) 
% soundsc(i,Fs) ;pause(3) 
% soundsc(o,Fs) ;pause(3) 
% soundsc(u,Fs) ;pause(3) 
 
 
Na= length(a) ;
Ne= length(e) ;
Ni= length(i) ;
No= length(o) ;
Nu= length(u) ;

ta = (0:Na-1)/Fs ;
te = (0:Ne-1)/Fs ;
ti = (0:Ni-1)/Fs ;
to = (0:No-1)/Fs ;
tu = (0:Nu-1)/Fs ;


Nv=7500 ; 
Ne=256; 
Nf=512 ;

subplot (511), plot (ta*Fs,a) , title('"a" sound') 
subplot (512), plot (te*Fs,e)    , title('"e" sound') 
subplot (513), plot (ti*Fs,i)    , title('"i" sound')
subplot (514), plot (to*Fs,o)    , title('"o" sound') 
subplot (515), plot (tu*Fs,u)    , title('"u" sound') 
 figure
subplot (511), plot (ta(Nv:Nv+Ne-1),a(Nv:Nv+Ne-1)) , title('"a" sound') %Tpa= (.6411-.6347)*1000 =  6.40
subplot (512), plot (te(Nv:Nv+Ne-1),e(Nv:Nv+Ne-1)) , title('"e" sound') %Tpe= 5,7
subplot (513), plot (ti(Nv:Nv+Ne-1),i(Nv:Nv+Ne-1)) , title('"i" sound') %Tpi= 5,9
subplot (514), plot (to(Nv:Nv+Ne-1),o(Nv:Nv+Ne-1)) , title('"o" sound') %Tpa= 6.1
subplot (515), plot (tu(Nv:Nv+Ne-1),u(Nv:Nv+Ne-1)) , title('"u" sound') %Tpa= 5,9

figure

%sinon pour plus de precision 
 
sva = a(Nv:Nv+Ne-1);
amdf= zeros(1,floor(Ne/2)) ; 
for k=1:floor(Ne/2) 
    ad = a(Nv+k:Nv+k+Ne-1);
    amdf(k) = sum(abs(sva-ad))/Ne ; 
end
amdf=amdf(4:end) ;
pitch_a = find(amdf==min(amdf))/Fs*1000


sve = e(Nv:Nv+Ne-1);
amdf= zeros(1,floor(Ne/2)) ; 
for k=1:floor(Ne/2) 
    ed = e(Nv+k:Nv+k+Ne-1);
    amdf(k) = sum(abs(sve-ed))/Ne ; 
end
amdf=amdf(4:end) ;
pitch_e = find(amdf==min(amdf))/Fs*1000 


svi = i(Nv:Nv+Ne-1);
amdf= zeros(1,floor(Ne/2)) ; 
for k=1:floor(Ne/2) 
    id = i(Nv+k:Nv+k+Ne-1);
    amdf(k) = sum(abs(svi-id))/Ne ; 
end
amdf=amdf(4:end) ;
pitch_i = find(amdf==min(amdf))/Fs*1000 

svo = o(Nv:Nv+Ne-1);
amdf= zeros(1,floor(Ne/2)) ; 
for k=1:floor(Ne/2) 
    od = o(Nv+k:Nv+k+Ne-1);
    amdf(k) = sum(abs(svo-od))/Ne ; 
end
amdf=amdf(4:end) ;
pitch_o = find(amdf==min(amdf))/Fs*1000 

svu = u(Nv:Nv+Ne-1);
amdf= zeros(1,floor(Ne/2)) ; 
for k=1:floor(Ne/2) 
    ud = u(Nv+k:Nv+k+Ne-1);
    amdf(k) = sum(abs(svu-ud))/Ne ; 
end
amdf=amdf(4:end) ;
pitch_u = find(amdf==min(amdf))/Fs*1000 

pitch_moy = 5.5 
p=pitch_moy ;
% 
%%%%%utilisation de specgm
L=floor(4*p*Fs/1000) ;
 
%pour a 
F=0:Nf/2-1;
f=(0:Nf/2-1)/Nf*Fs; 

Sa=DFTwin(a,L,Ne,Nf) ; 
Sa=abs(Sa); 
SadB=20*log10(Sa) ; 
subplot (511),
plot (f,Sa(F+1)) , title('"a" spctrum') %F1=94 , F2=812 , F3=1422

%%%e :


F=0:Nf/2-1;
f=(0:Nf/2-1)/Nf*Fs; 

Se=DFTwin(e,L,Ne,Nf) ; 
Se=abs(Se); 
SedB=20*log10(Se) ; 
subplot (512),
plot (f,Se(F+1)) , title('"e" spctrum') %F1=125 , F2=969 , F3=1688

%%%i
F=0:Nf/2-1;
f=(0:Nf/2-1)/Nf*Fs; 

Si=DFTwin(i,L,Ne,Nf) ; 
Si=abs(Si); 
SidB=20*log10(Si) ; 
subplot (513),
plot (f,Si(F+1)) , title('"i" spctrum') %F1=156 , F2=797 , F3=1250

%%%o
% m=28000;
F=0:Nf/2-1;
f=(0:Nf/2-1)/Nf*Fs; 

So=DFTwin(o,L,Ne,Nf) ; 
So=abs(So); 
SodB=20*log10(So) ; 
subplot (514),
plot (f,So(F+1)) , title('"o" spctrum')  %F1=129 , F2=812 , F3=1766

%%%u


F=0:Nf/2-1;
f=(0:Nf/2-1)/Nf*Fs; 

Su=DFTwin(u,L,Ne,Nf) ; 
Su=abs(Su); 
SudB=20*log10(Su) ; 
subplot (515),
plot (f,Su(F+1)) , title('"u" spctrum')%F1=125 , F2=875 , F3=1266

figure 
ov= L/4; 
subplot(231), Specgm(a,L,ov,Nf);title('"a" spectogram')  
subplot(232), Specgm(e,L,ov,Nf);title('"e" spectogram')   
subplot(233), Specgm(i,L,ov,Nf); title('"i" spectogram')  
subplot(234), Specgm(o,L,ov,Nf); title('"o" spectogram')  
subplot(235), Specgm(u,L,ov,Nf); title('"u" spectogram')  

%Centre de gravite
f=(0:Nf/2-1)*Fs/Nf; 
Pa = abs(fftshift(Sa(1:Nf/2)));
Cog_a = sum(Pa.*f')

Pe = abs(fftshift(Se(1:Nf/2)));
Cog_e = sum(Pe.*f')

Pi = abs(fftshift(Si(1:Nf/2)));
Cog_i = sum(Pi.*f')

Po = abs(fftshift(So(1:Nf/2)));
Cog_o = sum(Po.*f')

Pu = abs(fftshift(Su(1:Nf/2)));
Cog_u = sum(Pu.*f')

% Ecart type
ecart_type_a=sqrt(sum(((f'-Cog_a).^2).*Pa))

ecart_type_e=sqrt(sum((f'-Cog_e).^2.*Pe))

ecart_type_i=sqrt(sum((f'-Cog_i).^2.*Pi))

ecart_type_o=sqrt(sum((f'-Cog_o).^2.*Po))

ecart_type_u=sqrt(sum((f'-Cog_u).^2.*Pu))

% Asymétrie
asymetrie_a=sum(((f'-Cog_a)./ecart_type_a).^3.*Pa)
asymetrie_e=sum(((f'-Cog_e)./ecart_type_e).^3.*Pe)
asymetrie_i=sum(((f'-Cog_i)./ecart_type_i).^3.*Pi)
asymetrie_o=sum(((f'-Cog_o)./ecart_type_o).^3.*Po)
asymetrie_u=sum(((f'-Cog_u)./ecart_type_u).^3.*Pu)

% Aplatissement
aplatissement_a=-3+sum(((f'-Cog_a)./ecart_type_a).^4.*Pa)
aplatissement_e=-3+sum(((f'-Cog_e)./ecart_type_e).^4.*Pe)
aplatissement_i=-3+sum(((f'-Cog_i)./ecart_type_i).^4.*Pi)
aplatissement_o=-3+sum(((f'-Cog_o)./ecart_type_o).^4.*Po)
aplatissement_u=-3+sum(((f'-Cog_u)./ecart_type_u).^4.*Pu)



