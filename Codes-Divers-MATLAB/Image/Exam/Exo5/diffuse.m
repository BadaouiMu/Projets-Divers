function b=diffuse(f,T)
[m,n]=size(f);

b=zeros(size(f)); 
e=zeros(size(f)); 

f=double(f); 


b(1,:)=255*(f(1,:)>T); 
b(m,:)=255*(f(m,:)>T); 
b(:,n)=255*(f(:,n)>T); 
b(:,1)=255*(f(:,1)>T); 

for r = 2:m-1
    for c=2:n-1 
        b(r,c)= 255*(f(r,c)>T);
        e(r,c)= f(r,c)-b(r,c) ;
        
        f(r,c+1)=f(r,c+1) + 7/16*e(r,c); 
        f(r+1,c-1)=f(r+1,c-1) + 3/16*e(r,c); 
        f(r+1,c)=f(r+1,c) + 5/16*e(r,c); 
        f(r+1,c+1)=f(r+1,c+1) + 1/16*e(r,c);

    end
end
b=uint8(b);