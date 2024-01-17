function h=gaussFilter(N, var)
%%% Generation de la reponse impulsionnelle d'un filtre gaussiEn
%%% N: taille du filtre suppose impaire
%%% var : variance du filtre

n = -(N-1)/2:(N-1)/2;% variation suivant les lignes 
m = -(N-1)/2:(N-1)/2;% variation suivant les lignes 

% h = exp(-(n.^2 + m'.^2)/(2*var));
% h = zeros(N); 
% for n = -(N-1)/2:(N-1)/2;
%     for m = -(N-1)/2:(N-1)/2;
%         h(n+(N-1)/2+1,m+(N-1)/2+1) = exp(-(n^2 + m^2)/(2*var));
%     end
% end

%%%%%%%%%%%Autre mth mais on cree le mesh%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Nn = -(N-1)/2:(N-1)/2;% N points
Nm = -(N-1)/2:(N-1)/2;% N points

[Nn,Nm] = meshgrid(-(N-1)/2:(N-1)/2, -(N-1)/2:(N-1)/2); % N^2 points
 h = exp(-(Nn.^2 + Nm.^2)/(2*var));
h = h/sum(h(:));













