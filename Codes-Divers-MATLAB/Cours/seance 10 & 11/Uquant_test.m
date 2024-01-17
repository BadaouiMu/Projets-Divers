clear all ;
close all ; 
clc ; 

s=audioread('speech.au'); 
m=audioread('music.au');



Ks=audioinfo('speech.au') ; 
Km=audioinfo('music.au') ; 

Fs= 8000 ; 
Ns = Ks.TotalSamples; 
Nm = Km.TotalSamples ; 

ts = (0:Ns-1) / Fs ; 
tm = (0:Nm-1) / Fs ; 

Ps=sum(s.^2)/Ns ; %puiss signal speech
Pm=sum(m.^2)/Nm ; %puiss signal music

st=7201 ;
et = 7400 ;
td = st:et; 

figure('name','signaux' ) 
subplot(521) , plot (ts,s), title ('speech signal '), xlabel('time(sec)') 
subplot(521) , plot (ts(td),s(td)), title ('speech signal '), xlabel('time(sec)')  
axis([0,max(ts) -1  ,1]) 
axis([min(ts(td)),max(ts(td)) -1  ,1]) 


subplot(522) , plot (tm,m), title ('music signal '), xlabel('time(sec)') 
subplot(522) , plot (tm(td),m(td)), title ('music signal '), xlabel('time(sec)') 
axis([0,max(tm) -1  ,1]) 
axis([min(tm(td)),max(tm(td)) -1  ,1]) 


nb=[7,4,2,1] ; % #bites par echan 


for b=1:length(nb), 
    N=2^nb(b) ;
    sq=Uquant(s,N) ; 
    mq=Uquant(m,N) ;
    
    subplot(5,2,2*b+1) , plot (ts,sq), title (['speech signal N= ',num2str(N)]), xlabel('time(sec)')  
    axis([0,max(ts) -1  ,1]) 
    subplot(5,2,2*b+1) , plot (ts(td),sq(td)), title (['speech signal N= ',num2str(N)]), xlabel('time(sec)')  
    axis([min(tm(td)),max(ts(td)) -1  ,1]) 
    
    subplot(5,2,2*b+2) , plot (tm,mq), title (['music signal N= ',num2str(N)]), xlabel('time(sec)') 
    axis([0,max(tm) -1  ,1])
    subplot(5,2,2*b+2) , plot (tm(td),mq(td)), title (['music signal N= ',num2str(N)]), xlabel('time(sec)') 
    axis([min(tm(td)),max(tm(td)) -1  ,1])
    
    
end
%histograme de l erreur 
figure('name','hist') 
for b=1:length(nb), 
    N=2^nb(b) ;
    sq=Uquant(s,N) ; 
    mq=Uquant(m,N) ;
    
    esq = s-sq ; 
    emq = m-mq ; 

    
    subplot(4,2,2*b-1) , hist(esq, 20), title (['Hist de l err (speech)  N= ',num2str(N)]), xlabel('time(sec)')  
    
    
    subplot(4,2,2*b) , hist(emq, 20), title (['Hist de l err (music) N= ',num2str(N)]), xlabel('time(sec)') 
    
    
end

%fct d"autocorrelation
figure('name','fct d"autocorrelation ') 
for b=1:length(nb), 
    N=2^nb(b) ;
    sq=Uquant(s,N) ; 
    mq=Uquant(m,N) ;
    
    esq = s-sq ; 
    Esq(b)= sum(esq.^2)/Ns ; 
    emq = m-mq ; 
    Emq(b)= sum(emq.^2)/Nm ; 

    [rs,lags]= xcorr(esq,200,'unbiased') ;  %200 nb de retars 
    [rm,lagsm]= xcorr(emq,200,'unbiased') ;  %200 nb de retars 

    subplot(4,2,2*b-1) , plot(lags, rs), title (['fct d"autocorrelation(speech)  N= ',num2str(N)]), xlabel('time(sec)')  
    subplot(4,2,2*b) , plot(lagsm, rm), title (['Hfct d"autocorrelation(music) N= ',num2str(N)]), xlabel('time(sec)') 
    
    
end
SNRqs=Ps./Esq ; 
SNRqm=Pm./Emq ; 

Dsts=1./SNRqs ; 
Dstm=1./SNRqm ; 

Rb=nb*Fs ; %debit 
figure('name','snr') 
subplot (211), plot (Rb,10*log10(SNRqs)) 
hold on 
plot (Rb,10*log10(SNRqm)) ,legend('speech','music')
title('snr(db) ') ,hold off 
subplot (212), plot (Rb,Dsts) 
hold on 
plot (Rb,Dstm) ,legend('speech','music'),
title('dst') ,hold off  %dst speech > dst music donc signal speech est moins correle que signal music


%fct de correlation entre le s origine et le s quantifie
figure('name','fct de correlation entre le s origine et le s quantifie ') 
for b=1:length(nb), 
    N=2^nb(b) ;
    sq=Uquant(s,N) ; 
    mq=Uquant(m,N) ;
    
    
    [rs,lags]= xcorr(s,sq,200,'unbiased') ;  %200 nb de retars 
    [rm,lagsm]= xcorr(m,mq,200,'unbiased') ;  %200 nb de retars 

    subplot(4,2,2*b-1) , plot(lags, rs), title (['correlation des signaux origine et quantf(speech)  N= ',num2str(N)]), xlabel('time(sec)')  
    subplot(4,2,2*b) , plot(lagsm, rm), title (['correlation des signaux origine et quantfN= ',num2str(N)]), xlabel('time(sec)') 
end
    
    
    
    
    
    
    
    







