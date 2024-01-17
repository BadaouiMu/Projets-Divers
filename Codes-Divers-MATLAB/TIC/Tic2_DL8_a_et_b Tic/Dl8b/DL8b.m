X=gf([1 0 0 1 1]) ;
X=gf([1 1]);
% X=gf(conv([1 1],X));
Y=gf([1 1  1 0 0 0 0 0 0 0 1 1 1 0 0 ]);

[q r]=deconv(Y,X) ;
% for j=11:15
%    if mod(abs(r(j)),2)==0 
%         r(j)=0;
%         else r(j)=1;
%    end
% end
r