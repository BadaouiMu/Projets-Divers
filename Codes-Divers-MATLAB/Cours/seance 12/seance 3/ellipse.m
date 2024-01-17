function ellipse(X0,E,c,N)
N=100; 
theta=(0:N)*(2*pi)./N ;
Y= sqrt(c)*[cos(theta);sin(theta)];
Fm1=inv(sqrtm(E));
X=diag(X0)*ones(2,N+1)+Fm1*Y ;
plot(X(1,:),X(2,:));set(gca,'DataAspectRatio',[1 1 1])

