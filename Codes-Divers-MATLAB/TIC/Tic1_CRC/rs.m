%---------------A modifier----------------%
%primpoly(m,'all') 
pp=25 ; %utilise %primpoly(4,'all') pour avoir le nb 
m=4;
t=2; %capacite de correction
p=10^-3 ;    %proba d err de canal donné
X=[ 1 1 11 4 15 2 12 2 10] ; %seq a code %
B= gf([4 7 3 13 11 14 7 14 13 4 9 0 7 3 10 ],m,pp) ;%seq a decode 
%-----------------------------------------%






     %---------------------------------------------
     n=2^m -1;k=n-2*t;
     a=gf(2,m,pp) ;% alpha
     alphaa=[];
     for i=1:(2^m-1) 
         alphaa=[alphaa,a^i] ;
     end
    %  alphaa
    %  I=find(alphaa==14) 
     %---------------------------------------------
    %poly gen

     g=gf(1,m,pp); 
     for i=1:2*t
         ai=a^i ;
         g=conv(g,[1 ai]) ;
     end
     g ; %Qst 1

     %---------------------------------------------
    syms D ;syms alpha ;
    Poly_generateur=0;
     for i=1:(length(g)) 
         if g(i)==1
             Poly_generateur=Poly_generateur+D^((n-k-i+1));
         elseif g(i) ==0 
             Poly_generateur=Poly_generateur ;
         else
            Poly_generateur=Poly_generateur+alpha^(find(alphaa==g(i)))*D^((n-k-i+1));
         end
     end
     Poly_generateur ;
    %----------------------------------------------


     % poli control (D^n+1)=h*g
     dn1= gf([ 1 zeros(1,n-1) 1 ],m,pp);
     [h r] = deconv (dn1,g) ;
     h ; %------------------------------Qst 1 
     r ; %verification

     %---------------------------------------------
    syms D ;syms alpha ;
    Poly_control=0;
     for i=1:(length(h)) 
         if h(i)==1
             Poly_control=Poly_control+D^((k-i+1));
         elseif h(i) ==0 
             Poly_control=Poly_control ;
         else
            Poly_control=Poly_control+alpha^(find(alphaa==h(i)))*D^((k-i+1));
         end
     end
     Poly_control ;
    %----------------------------------------------

     %calcule proba 
     pe=0;
     n=7;
     t=2;

     for i=0:t
         pe = pe +  (nchoosek(n,i)) * (p^i) * ((1-p)^(n-i)) ;
     end
     Proba_err=1-pe   %---------------------- Qst 1

     %calcul efficatite
     efficatite=k/n ; %------------------------ Qst 1

     %gain de codage
     gain_en_dB = 10 *log10(efficatite*(t+1))  ;%------ Qst 1


     %Codage
        X=[X zeros(1,n-k)] ;
        X=gf(X,m,pp) ;
        [ h r ] = deconv (X,g) ;
        A= X+r; %------------------------- Qst 2

    %decodage  
    %matrice de decodage

    a=gf(2,m,pp) ;
    H=a.^(n-1:-1:0)';
    H=repmat(H,1,2*t);
    T=1:2*t;
    T=repmat(T,n,1);
    H=H.^T;

    S=B*H ; %-------------------------- Qst 3
    Syndrome=[] ;
        for i=1:length(S)
            if S(i)==1
                 Syndrome=[Syndrome,1];
            elseif S(i) ==0 
                Syndrome=[Syndrome,0];
            else
                Syndrome=[Syndrome,alpha^(find(alphaa==S(i)))];
            end
        end
        Syndrome ;


    %recherche de F(D) 
    Sb=S(t+1:end)';
    Sm=[] ;
    for i=1:t,
        Sm=[Sm;S(i:i+t-1) ] ;
    end

    sigma=0 ;
    if det(Sm) == 0
        Sm=Sm(2:end,2:end) ;
        Sb=Sb(2:end) ;
        sigma=sigma+1;
    end

    if det(Sm) == 0
        Sm=Sm(2:end,2:end) ;
        Sb=Sb(2:end) ;
        sigma=sigma+1 ;
    end
    if det(Sm) == 0
        Sm=Sm(2:end,2:end) ;
        Sb=Sb(2:end) ;
        sigma=sigma+1 ;
    end
    sigma;
    ss=Sm\Sb ; 
    F=gf ([1 ss(end:-1:1)'],m,pp);%----- Qst 3
     %---------------------------------------------
    syms D ;syms alpha ;
    Poly_localisateur=0;
     for i=1:(length(F)) 
         if F(i)==1
             Poly_localisateur=Poly_localisateur+D^(((t-sigma)-i+1));
         elseif F(i) ==0 
             Poly_localisateur=Poly_localisateur ;
         else
            Poly_localisateur=Poly_localisateur+alpha^(find(alphaa==F(i)))*D^(t-sigma-i+1);
         end
     end
     Poly_localisateur=Poly_localisateur*D^sigma;
     Poly_localisateur ;
    %----------------------------------------------
    di = roots(F);  %------------------- Qst 3
    Position_err=[] ;
    for i=1:length(di)
        if di(i)==1
             Position_err=[Position_err,1];
         elseif di(i) ==0 
             Position_err=[Position_err,0];
         else
            Position_err=[Position_err,find(alphaa==di(i))];
        end
    end
    Position_err ;


    % recherche de valeur d err
    Sb=S(1:t-1)' ;
    Sm=[] ;
    for i=1:t-1,
        Sm=[Sm ;(di.^i)' ] ;
    end
    ss=Sm\Sb ; %------------------------ Qst 3
    Valeur_err=ss ;
    Valeur_errs=[] ;
    for i=1:length(di)
        if ss(i)==1
             Valeur_errs=[Valeur_errs,1];
         elseif ss(i) ==0 
             Valeur_errs=[Valeur_errs,0];
         else
            Valeur_errs=[Valeur_errs,find(alphaa==ss(i))];
        end
    end
    Valeur_errs ;

    Seq_err = sum(alpha.^(Valeur_errs).*D.^(Position_err)) ;
    % 
    % correction d err
    E=gf([zeros(1,n)],m,pp) ;
    E(n-Position_err)=Valeur_err ;


    Code_decode= gf(E+B,m,pp) ;%---------------- Qst 3 seq decode
    Code_info_decode= Code_decode(1:k); %-------------------- Qst 3 seq d info




    %--------------------------a afficher ------------%
    n
    k
    dmin=2*t+1
    Poly_generateur
    Poly_control
    Proba_err
    efficatite_pourcentage=efficatite*100
    gain_en_dB
    seq_code=A
    Syndrome
    Poly_localisateur
    Position_err
    Valeur_err_en_decimal=Valeur_err'
    Seq_err_non_demande=Seq_err
    Code_decode
    Code_info_decode