S= [ 1 0 0 1 1 ] ;
Q= [ 1 0 0 1 0 0 1 0 1 1 1 1] ;
B=conv(S,Q) 
for j=1:length(B)
        if mod(abs(B(j)),2)==0 
            B(j)=0;
        else B(j)=1;
        end
end
B