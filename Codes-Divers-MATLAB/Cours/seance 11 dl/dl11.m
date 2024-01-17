clear all ; 
close all ; 
clc 
 a=audioread('a.mp4');
 a=audioread('a.wav');
 a=audioread('a.wav');
 a=audioread('a.wav');
 a=audioread('a.wav');
 
 soundsc(a) , pause(3) 
 soundsc(e) , pause(3) 
 soundsc(i) , pause(3) 
 soundsc(o) , pause(3) 
 soundsc(u) , pause(3) 


Na= length(a) ;
Ne= length(e) ;
Ni= length(i) ;
No= length(o) ;
Nu= length(u) ;

Fs=8000 ; 

ta = (0:Na-1)/Fs ;
te = (0:Ne-1)/Fs ;
ti = (0:Ni-1)/Fs ;
to = (0:No-1)/Fs ;
tu = (0:Nu-1)/Fs ;


ns=4800 ; 
nd=256; 

subplot (511), plot (ta(ns:ns+nd-1),a(ns:ns+nd-1)) , title('"a" sound') %Tpa= (.6184-.6129)*1000 = 5.5
subplot (512), plot (te(ns:ns+nd-1),e(ns:ns+nd-1)) , title('"e" sound') %Tpe= 5,6
subplot (513), plot (ti(ns:ns+nd-1),i(ns:ns+nd-1)) , title('"i" sound') %Tpi= 5,5
subplot (514), plot (to(ns:ns+nd-1),o(ns:ns+nd-1)) , title('"o" sound') %Tpa= 5,4
subplot (515), plot (tu(ns:ns+nd-1),u(ns:ns+nd-1)) , title('"u" sound') %Tpa= 5,4
%on prend Tp= 5,5 
figure

%sinon pour plus de precision 
Ne=256;Nv=4800; 
sva = a(Nv:Nv+Ne-1);
amdf= zeros(1,floor(Ne/2)) ; 
for k=1:floor(Ne/2) 
    ad = a(Nv+k:Nv+k+Ne-1);
    amdf(k) = sum(abs(sva-ad))/Ne ; 
end
pitch_a = find(amdf==min(amdf))/Fs*1000 

Ne=256;Nv=4800; 
sve = e(Nv:Nv+Ne-1);
amdf= zeros(1,floor(Ne/2)) ; 
for k=1:floor(Ne/2) 
    ed = e(Nv+k:Nv+k+Ne-1);
    amdf(k) = sum(abs(sve-ed))/Ne ; 
end
pitch_e = find(amdf==min(amdf))/Fs*1000 

Ne=256;Nv=4800; 
svi = i(Nv:Nv+Ne-1);
amdf= zeros(1,floor(Ne/2)) ; 
for k=1:floor(Ne/2) 
    id = i(Nv+k:Nv+k+Ne-1);
    amdf(k) = sum(abs(svi-id))/Ne ; 
end
pitch_i = find(amdf==min(amdf))/Fs*1000 

Ne=256;Nv=4800; 
svo = o(Nv:Nv+Ne-1);
amdf= zeros(1,floor(Ne/2)) ; 
for k=1:floor(Ne/2) 
    od = o(Nv+k:Nv+k+Ne-1);
    amdf(k) = sum(abs(svo-od))/Ne ; 
end
pitch_o = find(amdf==min(amdf))/Fs*1000 

Ne=256;Nv=4800; 
svu = u(Nv:Nv+Ne-1);
amdf= zeros(1,floor(Ne/2)) ; 
for k=1:floor(Ne/2) 
    ud = u(Nv+k:Nv+k+Ne-1);
    amdf(k) = sum(abs(svu-ud))/Ne ; 
end
pitch_u = find(amdf==min(amdf))/Fs*1000 


%utilisation de specgm
m=4800 ; 
L=174 ; %= 4*Np = 4*Tp*Fs/1000
Nf=512 ; %resolution 

F=0:Nf/2-1;
f=(0:Nf/2-1)/Nf*Fs; 

Sa=DFTwin(a,L,m,Nf) ; 
Sa=abs(Sa); 
SadB=20*log10(Sa) ; 
subplot (511),
plot (f,Sa(F+1)) , title('"a" spctrum') %F1 = 718,8   F2=2359

%e :
m=3600 ;  %pour e
L=174 ; %= 4*Np = 4*Tp*Fs/1000
Nf=512 ; %resolution 

F=0:Nf/2-1;
f=(0:Nf/2-1)/Nf*Fs; 

Se=DFTwin(e,L,m,Nf) ; 
Se=abs(Se); 
SedB=20*log10(Se) ; 
subplot (512),
plot (f,Se(F+1)) , title('"e" spctrum') %F1 = 359,9   F2=2891

%i
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  il faut la revoir : fixer apres qu on a
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  comenter la partie de pitch c est a cause
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  on a travailler avec i dans for !!1
m=4800 ; 
L=174 ; %= 4*Np = 4*Tp*Fs/1000
Nf=512 ; %resolution 

F=0:Nf/2-1;
f=(0:Nf/2-1)/Nf*Fs; 

Si=DFTwin(i,L,m,Nf) ; 
Si=abs(Si); 
SidB=20*log10(Si) ; 
subplot (513),
plot (f,Si(F+1)) , title('"i" spctrum') %F1 =    F2=

%o
m=4800 ; 
L=174 ; %= 4*Np = 4*Tp*Fs/1000
Nf=512 ; %resolution 

F=0:Nf/2-1;
f=(0:Nf/2-1)/Nf*Fs; 

So=DFTwin(o,L,m,Nf) ; 
So=abs(So); 
SodB=20*log10(So) ; 
subplot (514),
plot (f,So(F+1)) , title('"o" spctrum') %F1 =    F2=

%u
m=4800 ; 
L=174 ; %= 4*Np = 4*Tp*Fs/1000
Nf=512 ; %resolution 

F=0:Nf/2-1;
f=(0:Nf/2-1)/Nf*Fs; 

Su=DFTwin(u,L,m,Nf) ; 
Su=abs(Su); 
SudB=20*log10(Su) ; 
subplot (515),
plot (f,Su(F+1)) , title('"u" spctrum') %F1 =    F2=

figure 
ov= L/4; 
subplot(231), Specgm(a,L,ov,Nf);title('"a" spectogram')  
subplot(232), Specgm(e,L,ov,Nf);title('"e" spectogram')   
subplot(233), Specgm(i,L,ov,Nf); title('"i" spectogram')  
subplot(234), Specgm(o,L,ov,Nf); title('"o" spectogram')  
subplot(235), Specgm(u,L,ov,Nf); title('"u" spectogram')  


