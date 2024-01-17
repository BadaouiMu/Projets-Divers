%%%Mustapha badaoui


function zc = zerocross (s)

s1=[0; s(1:end-1)];

zc = length(find((s .* s1)<0)); % trouver moi la taille des indices  quand le produit est negatif

% % calcul du zcr basé sur la différence
% 
% d=abs(sign(s)-sign(s1));
% 
% % zcr=sum(d(2:end))/(N-1)/2;
% 
% zcr=sum(d(2:end))/2;
% end