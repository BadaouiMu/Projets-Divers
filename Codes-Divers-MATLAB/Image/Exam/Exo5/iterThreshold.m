function T=iterThreshold(f,pr)
t=mean(f(:)); 
T_initial=t
T=[t];
I1= find(f<=T); 
I2=find(f>T); 
R1=f(I1); 
R2=f(I2); 
m1=mean(R1); 
m2=mean(R2); 
t=.5*(m1+m2); 

while(abs(t-T(end))>pr)
    T=[T t]; 
    I1= find(f<=T(end)); 
    I2=find(f>T(end)); 
R1=f(I1); 
R2=f(I2); 
m1=mean(R1); 
m2=mean(R2); 
t=.5*(m1+m2); 
end
T=T(end); 
T_final=T
