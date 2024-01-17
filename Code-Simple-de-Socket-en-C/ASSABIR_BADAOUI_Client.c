#include<stdio.h>
#include<sys/socket.h>
#include<sys/types.h>
#include<netinet/in.h>
#include<netdb.h>
#include<string.h> 
#include <stdlib.h>
#include <fcntl.h> // for open
#include <unistd.h> // for close

#define max 3000

int main()
{     
     int s,a,t;
     char msgs[max],msgc[100],msgc1[100] ;
     FILE *f; 
     struct hostent *adr_h;
     struct sockaddr_in serveur;
     
     //***************** Creation de la socket
     if((s=socket(AF_INET,SOCK_STREAM,0))<0) 
         {
         perror("\nSocket : \n");
         exit(0);
         }
     printf("Socket cree\n");

    //***************** Remplissage de la structure serveur
     serveur.sin_family=AF_INET;
     serveur.sin_port=htons(2502);

     //***************** Construction de l'adresse
     if((adr_h=gethostbyname("127.0.0.1"))==0) 
     {
         perror("\n Machine inconnue : \n");
         exit(0);
    }
     bcopy((char *)adr_h->h_addr,(char *)&serveur.sin_addr,adr_h->h_length);

     //***************** Connexion au serveur
    if(connect(s,(struct sockaddr *)&serveur,sizeof(serveur))<0)
            perror("\nEchec de la connexion avec le serveur");
    else 
	{ 
	    printf("\nConnexion reussie avec le serveur\n");
	    //Communication avec le serveur
	
	    printf("Donnez le nom du fichier voulu :");
        gets(msgc);
        strcpy(msgc1,msgc);
	    t=send(s,msgc,20,0);  
		recv(s,msgs,max,0) ;
		if (strcmp(msgs,"NULL")==0 )  printf("fichier inexistant\n") ;
		else
        {
		    f=fopen(strcat(msgc1,".txt"),"w");	
		    for(;;)
            {
		    while(recv(s,msgs,max,0)!=0)
            {     
		        fputs(msgs,f);
			}
			exit(0);
			}
        }
	    close(s);
    }
}