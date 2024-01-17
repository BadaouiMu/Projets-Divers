#include<stdio.h>
#include<sys/socket.h>
#include<sys/types.h>
#include<netinet/in.h>
#include<netdb.h>
#include<string.h>
#include <fcntl.h> // for open
#include <unistd.h> // for close
#include <stdlib.h>
#include <arpa/inet.h>

#define max 3000

int main(){

       int s,a,b,c,r,longueur,z;
       FILE *f;
       struct sockaddr_in serveur,client;
       char msgs[max]="",msgc[20];
  //     struct hostent *adr_h;
 f=fopen("Q","r");

//Creation du socket
    if((s=socket(AF_INET,SOCK_STREAM,0))==-1) 
    {
         perror("\n Socket : \n");
         exit(0);
    }

 //Remplissage de la structure serveur
    serveur.sin_family=AF_INET;
    serveur.sin_addr.s_addr=INADDR_ANY;
    serveur.sin_port=htons(2502);
printf("serveur: Reçu connection de %s\n",inet_ntoa(serveur.sin_addr));

//Affecter une adresse à la socket
    if((b=bind(s,(struct sockaddr*)&serveur,sizeof(serveur)))==-1) 
    {
         perror("\n Bind : \n");
         exit(0);
    }
    
    printf("\n Bind reussi");

//Fonction listen : 5 connexion maximum
    listen(s,5);
    printf("\n\n Le serveur attend une connexion\n");

//Accept: Le serveur est prêt et attend des connexions    
     longueur=sizeof(client);
    if((c=accept(s,(struct sockaddr *)&client,&longueur))<0) 
	 {
        perror("\n Echec Connexion : ");
        exit(0);
     }
	printf("\n Connexion reussie avec le client\n");  

//Communication avec le client
     for(;;)
    {	
        if(recv(c,msgc,20,0)){
        f=fopen(msgc,"r");
        if (f == NULL) {strcpy(msgs,"NULL") ;
   		    send(c,msgs,max,0) ; }
        else {
            strcpy(msgs,"NOT NULL") ;
            send(c,msgs,max,0) ; 
            while(fgets(msgs,max,f)!=NULL)
        {
	        send(c,msgs,strlen(msgs),0);  
	    }
	    fclose(f);
	
	    } 
    }
	close(c); 
	c=accept(s,(struct sockaddr *)&client,&longueur);
	 
	}
	
  //Fermer les sockets
     
    close(s);
    
}