close all ; 
clear all ; 
clc; 

%donnees 
N=200 ; alpha = 0.95 ; m=[1 2] ; 
C =[2.3659 -0.3787 ; -0.3787 0.6427 ] ;

% valeur theorique du nombre p=de points en dehors de la zone de confiance 
s=-2*log(1-alpha) ; %cours 
Nth= fix((1-alpha)*N);  %cours %fix = floor 
 
%generer N echantillons gaussiens 2D de moyenne nylle et de variance unitaire
y=randn(2,N) ; %matrice 2 ligne et N colone random de 0 a 1 

plot (y(1,:), y(2,:), 'b.'); hold on ; %comme deux plot a verifier 


ellipse([0,0],[1 0;0 1] ,s,'g-'); %fct deja vu 

mm= repmat(m',1,N); 
x= sqrtm(C)* y + mm; 
ellipse(m,inv(C), s, 'b-'); 
plot(x(1,:),x(2,:),'r+'); axis([-6 6 -6 6 ] ); 

%vecture de N composantes n[i] =y[1,i]c + y[2,i]c
normy =ones(1,2) * (y.*y); 
nb =length(find(normy>s)); %compte le nb de composantes en dehors de l' intervalle de confiance 
text(2,4,sprintf('N_t_h=%g N=%g',Nth,nb)) %N_t_h = N_{th}
