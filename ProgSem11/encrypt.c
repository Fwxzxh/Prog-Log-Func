#include <stdio.h>
#include <string.h>

int main(){
    char clave[50];
    char buffer[100] = "";
    printf("El archivo a encriptar se llama mensaje.txt\n");
    printf("Ingrese la clave para encriptar: ");
    scanf("%s",clave);
    printf("La clave ingresada es: %s",clave);
    printf("\n");
    FILE *arch = NULL;
    arch = fopen("mensaje.txt","a+");
    if(arch == NULL){
        printf("no fue posible abrir el archivo\n");
        return -1;
    }

    fgets(buffer,100,arch);
    char encriptado[100];
    for (int i=0; i < strlen(buffer); i++){
        encriptado[i] = buffer[i]  ^ clave[i % sizeof(clave)];
    }

    fputs(encriptado,arch);

    printf("el menaje encriptado es: ");
    printf("%s",encriptado);
    printf("\n");

    fclose(arch);

    return 0;
}
